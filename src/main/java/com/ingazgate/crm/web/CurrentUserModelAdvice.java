package com.ingazgate.crm.web;

import com.ingazgate.crm.user.AdminNotification;
import com.ingazgate.crm.user.AppUser;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class CurrentUserModelAdvice {
  private final RequestCurrentUser requestCurrentUser;
  private final AuthUsers authUsers;
  private final MessageSource messageSource;

  @Value("${app.meta.site-name:Student CRM}")
  private String siteName;

  public CurrentUserModelAdvice(
      RequestCurrentUser requestCurrentUser, AuthUsers authUsers, MessageSource messageSource) {
    this.requestCurrentUser = requestCurrentUser;
    this.authUsers = authUsers;
    this.messageSource = messageSource;
  }

  @ModelAttribute("currentUserName")
  String currentUserName() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication == null || authentication.getName() == null) {
      return "User";
    }
    String name = authentication.getName().trim();
    if (name.isEmpty() || "anonymousUser".equalsIgnoreCase(name)) {
      return "User";
    }
    int at = name.indexOf('@');
    if (at > 0) {
      name = name.substring(0, at);
    }
    name = name.trim();
    if (name.isEmpty()) {
      return "User";
    }
    return Character.toUpperCase(name.charAt(0)) + name.substring(1);
  }

  @ModelAttribute("currentUserRole")
  String currentUserRole() {
    AppUser user = currentUser();
    return user != null && user.getRole() != null ? user.getRole() : "EMPLOYEE";
  }

  @ModelAttribute("currentUserRoleLabel")
  String currentUserRoleLabel() {
    String role = currentUserRole();
    Locale locale = LocaleContextHolder.getLocale();
    try {
      return messageSource.getMessage("role." + role, null, locale);
    } catch (NoSuchMessageException ex) {
      return role;
    }
  }

  @ModelAttribute("currentUserDisplayName")
  String currentUserDisplayName() {
    AppUser user = currentUser();
    if (user != null) {
      String display = trimToNull(user.getDisplayName());
      if (display != null) {
        return display;
      }
    }
    return currentUserName();
  }

  @ModelAttribute("currentUserId")
  UUID currentUserId() {
    AppUser user = currentUser();
    return user != null ? user.getId() : null;
  }

  @ModelAttribute("currentUserHasAvatar")
  boolean currentUserHasAvatar() {
    AppUser user = currentUser();
    return user != null && trimToNull(user.getLogoUrl()) != null;
  }

  /** Per-user URL so each agent's logo is cached separately. */
  @ModelAttribute("currentUserAvatarUrl")
  String currentUserAvatarUrl() {
    AppUser user = currentUser();
    if (user == null || trimToNull(user.getLogoUrl()) == null) {
      return null;
    }
    return "/users/" + user.getId() + "/avatar";
  }

  @ModelAttribute("currentUserInitials")
  String currentUserInitials() {
    String name = currentUserDisplayName();
    if (name == null || name.isBlank()) {
      return "U";
    }
    String[] parts = name.trim().split("\\s+");
    if (parts.length >= 2 && !parts[0].isEmpty() && !parts[1].isEmpty()) {
      return ("" + Character.toUpperCase(parts[0].charAt(0))
              + Character.toUpperCase(parts[1].charAt(0)));
    }
    return Character.toUpperCase(name.trim().charAt(0)) + "";
  }

  @ModelAttribute("currentUserCanManageAgents")
  boolean currentUserCanManageAgents() {
    AppUser user = currentUser();
    return authUsers.canManageAgents(user);
  }

  /** Loaded via /api/admin/notifications in app.js — keeps every page render off the notifications table. */
  @ModelAttribute("topbarNotifications")
  List<AdminNotification> topbarNotifications() {
    return List.of();
  }

  @ModelAttribute("topbarUnreadNotificationCount")
  long topbarUnreadNotificationCount() {
    return 0L;
  }

  @ModelAttribute("sidebarBrandName")
  String sidebarBrandName() {
    AppUser user = currentUser();
    if (user == null || authUsers.canManageAgents(user)) {
      return siteName == null || siteName.isBlank() ? "Student CRM" : siteName.trim();
    }
    String office = trimToNull(user.getOfficeName());
    if (office != null) {
      return office;
    }
    String display = trimToNull(user.getDisplayName());
    if (display != null) {
      return display;
    }
    return "Agent";
  }

  @ModelAttribute("sidebarBrandLogoUrl")
  String sidebarBrandLogoUrl() {
    AppUser user = currentUser();
    if (user == null || authUsers.canManageAgents(user)) {
      return "/images/logo.jpg";
    }
    if (trimToNull(user.getLogoUrl()) != null) {
      return "/users/" + user.getId() + "/avatar";
    }
    return "/images/logo.jpg";
  }

  private AppUser currentUser() {
    return requestCurrentUser.get();
  }

  private static String trimToNull(String value) {
    if (value == null) {
      return null;
    }
    String trimmed = value.trim();
    return trimmed.isEmpty() ? null : trimmed;
  }
}

