package com.ingazgate.crm.security;

import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class DatabaseUserDetailsService implements UserDetailsService {
  private final AppUserRepository appUserRepository;

  public DatabaseUserDetailsService(AppUserRepository appUserRepository) {
    this.appUserRepository = appUserRepository;
  }

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    String normalizedUsername = username == null ? "" : username.trim().toLowerCase();
    AppUser user =
        appUserRepository
            .findByEmailIgnoreCase(normalizedUsername)
            .orElseThrow(() -> new UsernameNotFoundException("User not found: " + normalizedUsername));

    String safePassword = user.getPasswordHash() == null ? "" : user.getPasswordHash().trim();
    String safeRole = user.getRole() == null ? "EMPLOYEE" : user.getRole().trim().toUpperCase();

    return User.withUsername(user.getEmail().trim().toLowerCase())
        .password(safePassword)
        .authorities(new SimpleGrantedAuthority("ROLE_" + safeRole))
        .build();
  }
}

