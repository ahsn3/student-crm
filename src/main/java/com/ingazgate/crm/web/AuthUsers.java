package com.ingazgate.crm.web;

import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import java.security.Principal;
import org.springframework.stereotype.Component;

@Component
public class AuthUsers {
  private final AppUserRepository appUserRepository;

  public AuthUsers(AppUserRepository appUserRepository) {
    this.appUserRepository = appUserRepository;
  }

  public AppUser requireCurrentUser(Principal principal) {
    if (principal == null || principal.getName() == null) {
      throw new IllegalStateException("No authenticated user.");
    }
    String email = principal.getName().trim().toLowerCase();
    return appUserRepository
        .findByEmailIgnoreCase(email)
        .orElseThrow(() -> new IllegalStateException("User not found in database."));
  }

  public void requireAgentManager(Principal principal) {
    AppUser user = requireCurrentUser(principal);
    if (!canManageAgents(user)) {
      throw new IllegalStateException("This action requires administrator access.");
    }
  }

  public boolean canManageAgents(AppUser user) {
    if (user == null) {
      return false;
    }
    if (user.isCanManageAgents()) {
      return true;
    }
    return "ADMIN".equalsIgnoreCase(user.getRole());
  }
}
