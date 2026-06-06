package com.ingazgate.crm.web;

import com.ingazgate.crm.user.AdminNotification;
import com.ingazgate.crm.user.AdminNotificationRepository;
import com.ingazgate.crm.user.AppUser;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NotificationWebController {
  private final AuthUsers authUsers;
  private final AdminNotificationRepository adminNotificationRepository;

  public NotificationWebController(
      AuthUsers authUsers, AdminNotificationRepository adminNotificationRepository) {
    this.authUsers = authUsers;
    this.adminNotificationRepository = adminNotificationRepository;
  }

  @GetMapping("/notifications")
  String notificationsPage(Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    List<AdminNotification> all =
        user.getId() != null
            ? adminNotificationRepository.findAllForOwnerUnreadFirst(user.getId())
            : List.of();
    List<AdminNotification> unread = new ArrayList<>();
    List<AdminNotification> past = new ArrayList<>();
    for (AdminNotification n : all) {
      if (n.isRead()) {
        past.add(n);
      } else {
        unread.add(n);
      }
    }
    model.addAttribute("pageTitleKey", "page.notifications.title");
    model.addAttribute("activeNav", "notifications");
    model.addAttribute("contentTemplate", "pages/notifications");
    model.addAttribute("bodyPageClass", "page-notifications");
    model.addAttribute("unreadNotifications", unread);
    model.addAttribute("pastNotifications", past);
    return "layout/shell";
  }
}
