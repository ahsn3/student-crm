package com.ingazgate.crm.web;

import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import java.net.URI;
import java.security.Principal;
import java.util.UUID;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

@Controller
public class UserAvatarController {
  private final AppUserRepository appUserRepository;
  private final AuthUsers authUsers;

  public UserAvatarController(AppUserRepository appUserRepository, AuthUsers authUsers) {
    this.appUserRepository = appUserRepository;
    this.authUsers = authUsers;
  }

  @GetMapping("/users/{userId}/avatar")
  ResponseEntity<byte[]> userAvatar(
      @PathVariable("userId") UUID userId,
      Principal principal,
      @RequestHeader(value = HttpHeaders.IF_NONE_MATCH, required = false) String ifNoneMatch) {
    AppUser viewer = authUsers.requireCurrentUser(principal);
    AppUser target = appUserRepository.findById(userId).orElse(null);
    if (target == null || !canViewAvatar(viewer, target)) {
      return ResponseEntity.notFound().build();
    }
    String logoUrl = target.getLogoUrl();
    if (logoUrl == null || logoUrl.isBlank()) {
      return ResponseEntity.notFound().build();
    }
    String trimmed = logoUrl.trim();
    if (trimmed.startsWith("http://") || trimmed.startsWith("https://")) {
      return ResponseEntity.status(HttpStatus.FOUND).location(URI.create(trimmed)).build();
    }
    return UserAvatarSupport.avatarResponse(userId, trimmed, ifNoneMatch);
  }

  /** Legacy URL — redirect so each user has a distinct cache key. */
  @GetMapping("/profile/avatar")
  ResponseEntity<Void> legacyProfileAvatar(Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    return ResponseEntity.status(HttpStatus.MOVED_PERMANENTLY)
        .location(URI.create("/users/" + user.getId() + "/avatar"))
        .build();
  }

  private boolean canViewAvatar(AppUser viewer, AppUser target) {
    if (viewer.getId().equals(target.getId())) {
      return true;
    }
    if ("AGENT".equalsIgnoreCase(target.getRole())) {
      if (target.getParentUserId() != null && target.getParentUserId().equals(viewer.getId())) {
        return true;
      }
      return authUsers.canManageAgents(viewer);
    }
    return false;
  }
}
