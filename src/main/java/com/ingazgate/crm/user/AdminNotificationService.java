package com.ingazgate.crm.user;

import java.time.OffsetDateTime;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminNotificationService {
  private final AppUserRepository appUserRepository;
  private final AdminNotificationRepository adminNotificationRepository;
  private final WorkspaceOwnershipService workspaceOwnershipService;

  public AdminNotificationService(
      AppUserRepository appUserRepository,
      AdminNotificationRepository adminNotificationRepository,
      WorkspaceOwnershipService workspaceOwnershipService) {
    this.appUserRepository = appUserRepository;
    this.adminNotificationRepository = adminNotificationRepository;
    this.workspaceOwnershipService = workspaceOwnershipService;
  }

  public void notifyIngazgateAdmins(String message, UUID actorUserId) {
    notifyIngazgateAdmins(message, actorUserId, null);
  }

  public void notifyUser(UUID ownerUserId, String message, UUID actorUserId, String linkUrl) {
    String text = message == null ? "" : message.trim();
    if (text.isEmpty() || ownerUserId == null) {
      return;
    }
    if (actorUserId != null && actorUserId.equals(ownerUserId)) {
      return;
    }
    String link = trimToNull(linkUrl);
    AdminNotification note = new AdminNotification();
    note.setId(UUID.randomUUID());
    note.setOwnerUserId(ownerUserId);
    note.setMessage(text);
    note.setCreatedAt(OffsetDateTime.now());
    note.setRead(false);
    note.setLinkUrl(link);
    adminNotificationRepository.save(note);
  }

  public void notifyIngazgateAdmins(String message, UUID actorUserId, String linkUrl) {
    String text = message == null ? "" : message.trim();
    if (text.isEmpty()) {
      return;
    }
    String link = trimToNull(linkUrl);
    var admins = appUserRepository.findIngazgateAdmins();
    OffsetDateTime now = OffsetDateTime.now();
    for (AppUser admin : admins) {
      if (admin.getId() == null) {
        continue;
      }
      if (actorUserId != null && actorUserId.equals(admin.getId())) {
        continue;
      }
      AdminNotification note = new AdminNotification();
      note.setId(UUID.randomUUID());
      note.setOwnerUserId(admin.getId());
      note.setMessage(text);
      note.setCreatedAt(now);
      note.setRead(false);
      note.setLinkUrl(link);
      adminNotificationRepository.save(note);
    }
  }

  @Transactional
  public void markReadForOwner(UUID notificationId, UUID ownerUserId) {
    adminNotificationRepository
        .findByIdAndOwnerUserId(notificationId, ownerUserId)
        .ifPresent(
            n -> {
              if (!n.isRead()) {
                n.setRead(true);
                adminNotificationRepository.save(n);
              }
            });
  }

  @Transactional
  public void markAllReadForOwner(UUID ownerUserId) {
    if (ownerUserId == null) {
      return;
    }
    for (AdminNotification n : adminNotificationRepository.findUnreadForOwner(ownerUserId)) {
      n.setRead(true);
      adminNotificationRepository.save(n);
    }
  }

  public boolean isIngazgateUser(AppUser user) {
    return workspaceOwnershipService.isIngazgateUser(user);
  }

  private static String trimToNull(String value) {
    if (value == null) {
      return null;
    }
    String t = value.trim();
    return t.isEmpty() ? null : t;
  }
}
