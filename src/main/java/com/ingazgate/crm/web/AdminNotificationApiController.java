package com.ingazgate.crm.web;

import com.ingazgate.crm.user.AdminNotification;
import com.ingazgate.crm.user.AdminNotificationRepository;
import com.ingazgate.crm.user.AdminNotificationService;
import com.ingazgate.crm.user.AppUser;
import java.security.Principal;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/notifications")
public class AdminNotificationApiController {
  private static final DateTimeFormatter ISO_FMT = DateTimeFormatter.ISO_OFFSET_DATE_TIME;

  private final AuthUsers authUsers;
  private final AdminNotificationRepository adminNotificationRepository;
  private final AdminNotificationService adminNotificationService;

  public AdminNotificationApiController(
      AuthUsers authUsers,
      AdminNotificationRepository adminNotificationRepository,
      AdminNotificationService adminNotificationService) {
    this.authUsers = authUsers;
    this.adminNotificationRepository = adminNotificationRepository;
    this.adminNotificationService = adminNotificationService;
  }

  @GetMapping
  ResponseEntity<Map<String, Object>> list(Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (user.getId() == null) {
      return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
    }
    long unread = adminNotificationRepository.countUnreadForOwner(user.getId());
    List<AdminNotification> rows =
        adminNotificationRepository.findRecentForOwner(user.getId(), PageRequest.of(0, 20));
    List<Map<String, Object>> items = rows.stream().map(this::toDto).toList();
    Map<String, Object> body = new HashMap<>();
    body.put("unreadCount", unread);
    body.put("items", items);
    return ResponseEntity.ok(body);
  }

  @PostMapping("/{id}/read")
  ResponseEntity<Void> markRead(@PathVariable UUID id, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (user.getId() == null) {
      return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
    }
    adminNotificationService.markReadForOwner(id, user.getId());
    return ResponseEntity.noContent().build();
  }

  @GetMapping("/all")
  ResponseEntity<Map<String, Object>> listAll(Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (user.getId() == null) {
      return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
    }
    long unread = adminNotificationRepository.countUnreadForOwner(user.getId());
    List<AdminNotification> rows =
        adminNotificationRepository.findAllForOwnerUnreadFirst(user.getId());
    List<Map<String, Object>> items = rows.stream().map(this::toDto).toList();
    Map<String, Object> body = new HashMap<>();
    body.put("unreadCount", unread);
    body.put("items", items);
    return ResponseEntity.ok(body);
  }

  @PostMapping("/read-all")
  ResponseEntity<Void> markAllRead(Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (user.getId() == null) {
      return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
    }
    adminNotificationService.markAllReadForOwner(user.getId());
    return ResponseEntity.noContent().build();
  }

  private Map<String, Object> toDto(AdminNotification n) {
    Map<String, Object> m = new HashMap<>();
    m.put("id", n.getId().toString());
    m.put("message", n.getMessage());
    m.put("createdAt", n.getCreatedAt() != null ? ISO_FMT.format(n.getCreatedAt()) : "");
    m.put("read", n.isRead());
    m.put("linkUrl", n.getLinkUrl() != null ? n.getLinkUrl() : "");
    return m;
  }
}
