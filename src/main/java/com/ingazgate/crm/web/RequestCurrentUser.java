package com.ingazgate.crm.web;

import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

/** Resolves the logged-in user once per HTTP request (avoids repeated DB lookups from model advice). */
@Component
@Scope(value = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RequestCurrentUser {
  private final AppUserRepository appUserRepository;
  private boolean loaded;
  private AppUser user;

  public RequestCurrentUser(AppUserRepository appUserRepository) {
    this.appUserRepository = appUserRepository;
  }

  public AppUser get() {
    if (!loaded) {
      user = load();
      loaded = true;
    }
    return user;
  }

  private AppUser load() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication == null || authentication.getName() == null) {
      return null;
    }
    String email = authentication.getName().trim().toLowerCase();
    if (email.isEmpty() || "anonymousUser".equalsIgnoreCase(email)) {
      return null;
    }
    return appUserRepository.findByEmailIgnoreCase(email).orElse(null);
  }
}
