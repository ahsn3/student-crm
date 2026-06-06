package com.ingazgate.crm.user;

import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.UUID;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserRegistrationService {
  private final AppUserRepository appUserRepository;
  private final BCryptPasswordEncoder bcryptPasswordEncoder;

  public UserRegistrationService(
      AppUserRepository appUserRepository, BCryptPasswordEncoder bcryptPasswordEncoder) {
    this.appUserRepository = appUserRepository;
    this.bcryptPasswordEncoder = bcryptPasswordEncoder;
  }

  /**
   * @return true if the user was created; false if the email is already taken
   */
  @Transactional
  public boolean registerIfAvailable(String email, String rawPassword, String displayName) {
    String normalized = email == null ? "" : email.trim().toLowerCase();
    if (normalized.isEmpty() || appUserRepository.existsByEmailIgnoreCase(normalized)) {
      return false;
    }
    String name = displayName == null ? "" : displayName.trim();
    if (name.isEmpty()) {
      return false;
    }
    AppUser user = new AppUser();
    user.setId(UUID.randomUUID());
    user.setEmail(normalized);
    user.setPasswordHash(bcryptPasswordEncoder.encode(rawPassword));
    user.setDisplayName(name);
    user.setRole("EMPLOYEE");
    user.setEmailDomain(extractDomain(normalized));
    user.setCanManageAgents(false);
    user.setParentUserId(null);
    user.setCreatedAt(OffsetDateTime.now(ZoneOffset.UTC));
    appUserRepository.save(user);
    return true;
  }

  private static String extractDomain(String email) {
    int at = email.indexOf('@');
    if (at <= 0 || at >= email.length() - 1) {
      return "local";
    }
    return email.substring(at + 1).trim().toLowerCase();
  }
}
