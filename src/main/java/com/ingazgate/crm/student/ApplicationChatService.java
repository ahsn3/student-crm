package com.ingazgate.crm.student;

import com.ingazgate.crm.support.UserDisplayNames;
import com.ingazgate.crm.user.AdminNotificationService;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.WorkspaceOwnershipService;
import com.ingazgate.crm.web.AuthUsers;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ApplicationChatService {
  private static final Logger log = LoggerFactory.getLogger(ApplicationChatService.class);
  private static final DateTimeFormatter ISO_FMT = DateTimeFormatter.ISO_OFFSET_DATE_TIME;
  private static final int BODY_MAX = 4000;
  private static final long CHAT_FILE_MAX_BYTES = 10L * 1024L * 1024L;

  private final AuthUsers authUsers;
  private final WorkspaceOwnershipService workspaceOwnershipService;
  private final StudentApplicationRepository studentApplicationRepository;
  private final ApplicationMessageRepository applicationMessageRepository;
  private final ApplicationChatReadRepository applicationChatReadRepository;
  private final AdminNotificationService adminNotificationService;

  public ApplicationChatService(
      AuthUsers authUsers,
      WorkspaceOwnershipService workspaceOwnershipService,
      StudentApplicationRepository studentApplicationRepository,
      ApplicationMessageRepository applicationMessageRepository,
      ApplicationChatReadRepository applicationChatReadRepository,
      AdminNotificationService adminNotificationService) {
    this.authUsers = authUsers;
    this.workspaceOwnershipService = workspaceOwnershipService;
    this.studentApplicationRepository = studentApplicationRepository;
    this.applicationMessageRepository = applicationMessageRepository;
    this.applicationChatReadRepository = applicationChatReadRepository;
    this.adminNotificationService = adminNotificationService;
  }

  public Optional<StudentApplication> findAuthorizedApplication(UUID applicationId, AppUser user) {
    if (user == null || applicationId == null) {
      return Optional.empty();
    }
    UUID ownerId = workspaceOwnershipService.dataOwnerId(user);
    Optional<StudentApplication> owned =
        studentApplicationRepository.findByIdAndOwnerUser_IdForEdit(applicationId, ownerId);
    if (owned.isPresent()) {
      return owned;
    }
    if (authUsers.canManageAgents(user)) {
      return studentApplicationRepository
          .findByIdWithGraph(applicationId)
          .filter(
              app ->
                  app.getOwnerUser() != null
                      && workspaceOwnershipService.canIngazgateAdminViewOwner(
                          app.getOwnerUser()));
    }
    return Optional.empty();
  }

  public Map<UUID, Long> unreadCountsForApplications(Collection<UUID> applicationIds, AppUser viewer) {
    if (viewer == null || viewer.getId() == null || applicationIds == null || applicationIds.isEmpty()) {
      return Map.of();
    }
    List<UUID> ids = applicationIds.stream().filter(id -> id != null).distinct().toList();
    if (ids.isEmpty()) {
      return Map.of();
    }
    Map<UUID, Long> out = new HashMap<>();
    try {
      final int batchSize = 200;
      for (int i = 0; i < ids.size(); i += batchSize) {
        List<UUID> batch = ids.subList(i, Math.min(i + batchSize, ids.size()));
        for (Object[] row :
            applicationMessageRepository.countUnreadByApplicationIds(batch, viewer.getId())) {
          if (row.length >= 2 && row[0] instanceof UUID appId && row[1] instanceof Number count) {
            out.put(appId, count.longValue());
          }
        }
      }
    } catch (RuntimeException ex) {
      log.warn("Unread counts unavailable", ex);
    }
    return out;
  }

  /** Unread agent chat activity per workspace owner id (for IngazGate agents list). */
  public Map<UUID, Long> unreadCountsByAgentOwners(Collection<UUID> agentOwnerIds, AppUser viewer) {
    if (viewer == null
        || viewer.getId() == null
        || agentOwnerIds == null
        || agentOwnerIds.isEmpty()) {
      return Map.of();
    }
    List<UUID> ids = agentOwnerIds.stream().filter(id -> id != null).distinct().toList();
    if (ids.isEmpty()) {
      return Map.of();
    }
    Map<UUID, Long> out = new HashMap<>();
    try {
      final int batchSize = 100;
      for (int i = 0; i < ids.size(); i += batchSize) {
        List<UUID> batch = ids.subList(i, Math.min(i + batchSize, ids.size()));
        for (Object[] row :
            applicationMessageRepository.countUnreadByOwnerUserIds(batch, viewer.getId())) {
          if (row.length >= 2 && row[0] instanceof UUID ownerId && row[1] instanceof Number count) {
            out.put(ownerId, count.longValue());
          }
        }
      }
    } catch (RuntimeException ex) {
      log.warn("Agent unread counts unavailable", ex);
    }
    return out;
  }

  /** Application ids with at least one unread chat message for the viewer. */
  public Set<UUID> applicationIdsWithUnread(Collection<UUID> applicationIds, AppUser viewer) {
    return unreadCountsForApplications(applicationIds, viewer).entrySet().stream()
        .filter(e -> e.getValue() != null && e.getValue() > 0)
        .map(Map.Entry::getKey)
        .collect(Collectors.toCollection(HashSet::new));
  }

  /** Loads messages for server-rendered chat panel; marks read for viewer. */
  @Transactional
  public List<ApplicationChatLine> loadChatForPage(UUID applicationId, AppUser viewer) {
    if (findAuthorizedApplication(applicationId, viewer).isEmpty()) {
      throw new IllegalArgumentException("Application not found");
    }
    List<ApplicationChatLine> lines = new ArrayList<>();
    try {
      for (ApplicationMessage m :
          applicationMessageRepository.findForApplicationOrderByCreatedAtAsc(applicationId)) {
        lines.add(toChatLine(m, viewer));
      }
    } catch (RuntimeException ex) {
      log.warn("Chat page load failed for application {}", applicationId, ex);
    }
    if (viewer.getId() != null) {
      markRead(applicationId, viewer.getId(), OffsetDateTime.now());
    }
    return lines;
  }

  @Transactional(readOnly = true)
  public Map<String, Object> listMessages(UUID applicationId, AppUser viewer, boolean markRead) {
    StudentApplication app =
        findAuthorizedApplication(applicationId, viewer)
            .orElseThrow(() -> new IllegalArgumentException("Application not found"));
    long unread = 0L;
    if (viewer.getId() != null) {
      try {
        unread = applicationMessageRepository.countUnreadForApplication(applicationId, viewer.getId());
      } catch (RuntimeException ex) {
        log.warn("Unread count unavailable for application {}", applicationId, ex);
      }
    }
    List<Map<String, Object>> messages = new ArrayList<>();
    try {
      List<ApplicationMessage> rows =
          applicationMessageRepository.findForApplicationOrderByCreatedAtAsc(applicationId);
      for (ApplicationMessage m : rows) {
        messages.add(toMessageDto(m, viewer));
      }
    } catch (RuntimeException ex) {
      log.error("Failed to load messages for application {}", applicationId, ex);
      Map<String, Object> body = new LinkedHashMap<>();
      body.put("messages", messages);
      body.put("unreadCount", 0L);
      body.put("error", "chatUnavailable");
      body.put(
          "applicationNumber",
          app.getApplicationNumber() != null ? app.getApplicationNumber() : "");
      return body;
    }
    if (markRead && viewer.getId() != null) {
      markRead(applicationId, viewer.getId(), OffsetDateTime.now());
      unread = 0L;
    }
    Map<String, Object> body = new LinkedHashMap<>();
    body.put("messages", messages);
    body.put("unreadCount", unread);
    body.put(
        "applicationNumber",
        app.getApplicationNumber() != null ? app.getApplicationNumber() : "");
    return body;
  }

  @Transactional
  public void postMessage(
      UUID applicationId, AppUser sender, String body, MultipartFile file) {
    StudentApplication app =
        findAuthorizedApplication(applicationId, sender)
            .orElseThrow(() -> new IllegalArgumentException("Application not found"));
    String text = body == null ? "" : body.trim();
    if (text.length() > BODY_MAX) {
      text = text.substring(0, BODY_MAX);
    }
    boolean hasFile = file != null && !file.isEmpty();
    if (text.isEmpty() && !hasFile) {
      throw new IllegalArgumentException("empty");
    }
    if (hasFile && file.getSize() > CHAT_FILE_MAX_BYTES) {
      throw new IllegalArgumentException("fileTooLarge");
    }

    OffsetDateTime now = OffsetDateTime.now();
    ApplicationMessage row = new ApplicationMessage();
    row.setId(UUID.randomUUID());
    row.setApplication(app);
    row.setOwnerUser(app.getOwnerUser());
    row.setSender(sender);
    row.setBody(text.isEmpty() ? null : text);
    row.setCreatedAt(now);
    if (hasFile) {
      try {
        row.setFileName(safeFileName(file.getOriginalFilename()));
        row.setContentType(file.getContentType());
        row.setSizeBytes(file.getSize());
        row.setContent(file.getBytes());
      } catch (Exception ex) {
        throw new IllegalArgumentException("uploadFailed", ex);
      }
    }
    applicationMessageRepository.save(row);
    if (sender.getId() != null) {
      markRead(applicationId, sender.getId(), now);
    }
    notifyParties(app, sender, text, hasFile);
  }

  @Transactional(readOnly = true)
  public Optional<ApplicationMessage> findMessageForDownload(
      UUID applicationId, UUID messageId, AppUser viewer) {
    if (findAuthorizedApplication(applicationId, viewer).isEmpty()) {
      return Optional.empty();
    }
    return applicationMessageRepository.findByIdAndApplication_Id(messageId, applicationId);
  }

  @Transactional
  public void markRead(UUID applicationId, UUID userId, OffsetDateTime at) {
    if (applicationId == null || userId == null) {
      return;
    }
    ApplicationChatRead row =
        applicationChatReadRepository
            .findByApplicationIdAndUserId(applicationId, userId)
            .orElseGet(
                () -> {
                  ApplicationChatRead created = new ApplicationChatRead();
                  created.setApplicationId(applicationId);
                  created.setUserId(userId);
                  return created;
                });
    row.setLastReadAt(at != null ? at : OffsetDateTime.now());
    applicationChatReadRepository.save(row);
  }

  private void notifyParties(
      StudentApplication app, AppUser sender, String text, boolean hasFile) {
    String appNum =
        app.getApplicationNumber() != null && !app.getApplicationNumber().isBlank()
            ? app.getApplicationNumber().trim()
            : "application";
    String link = "/applications/" + app.getId() + "?tab=chat";
    String preview = buildPreview(text, hasFile);
    String from = senderLabel(sender);

    if (authUsers.canManageAgents(sender)) {
      AppUser owner = app.getOwnerUser();
      if (owner != null && owner.getId() != null) {
        adminNotificationService.notifyUser(
            owner.getId(),
            from + " replied on " + appNum + preview,
            sender.getId(),
            link);
      }
    } else {
      adminNotificationService.notifyIngazgateAdmins(
          from + " sent a message on " + appNum + preview, sender.getId(), link);
    }
  }

  private ApplicationChatLine toChatLine(ApplicationMessage m, AppUser viewer) {
    AppUser sender = m.getSender();
    boolean mine = isMine(m, viewer);
    return new ApplicationChatLine(
        m.getId(),
        senderLabel(sender),
        mine,
        authUsers.canManageAgents(sender),
        m.getBody() != null ? m.getBody() : "",
        m.getFileName(),
        m.hasFile(),
        m.getCreatedAt());
  }

  private Map<String, Object> toMessageDto(ApplicationMessage m, AppUser viewer) {
    Map<String, Object> row = new LinkedHashMap<>();
    row.put("id", m.getId() != null ? m.getId().toString() : "");
    row.put("body", m.getBody() != null ? m.getBody() : "");
    row.put("hasFile", m.getFileName() != null && !m.getFileName().isBlank());
    row.put("fileName", m.getFileName() != null ? m.getFileName() : "");
    row.put("senderName", senderLabel(m.getSender()));
    AppUser sender = m.getSender();
    row.put(
        "senderEmail",
        sender != null && sender.getEmail() != null
            ? sender.getEmail().trim().toLowerCase()
            : "");
    row.put("senderRole", senderRole(sender));
    row.put("mine", isMine(m, viewer));
    row.put("createdAt", m.getCreatedAt() != null ? ISO_FMT.format(m.getCreatedAt()) : "");
    return row;
  }

  private boolean isMine(ApplicationMessage m, AppUser viewer) {
    if (viewer == null || viewer.getId() == null || m.getSender() == null) {
      return false;
    }
    return viewer.getId().equals(m.getSender().getId());
  }

  private String senderRole(AppUser sender) {
    if (sender == null) {
      return "USER";
    }
    return authUsers.canManageAgents(sender) ? "ADMIN" : "AGENT";
  }

  private String senderLabel(AppUser sender) {
    boolean staff = sender != null && authUsers.canManageAgents(sender);
    return UserDisplayNames.actorLabel(sender, staff);
  }

  private static String buildPreview(String text, boolean hasFile) {
    if (text != null && !text.isBlank()) {
      String t = text.trim().replaceAll("\\s+", " ");
      if (t.length() > 72) {
        t = t.substring(0, 72) + "…";
      }
      return ": " + t;
    }
    if (hasFile) {
      return " (attachment)";
    }
    return "";
  }

  private static String safeFileName(String original) {
    String fallback = "attachment.bin";
    if (original == null || original.isBlank()) {
      return fallback;
    }
    String cleaned = original.replace("\\", "/");
    int slash = cleaned.lastIndexOf('/');
    String base = slash >= 0 ? cleaned.substring(slash + 1) : cleaned;
    base = base.trim();
    if (base.isEmpty()) {
      return fallback;
    }
    if (base.length() > 180) {
      return base.substring(base.length() - 180);
    }
    return base;
  }
}
