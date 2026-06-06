package com.ingazgate.crm.security;

import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import java.time.OffsetDateTime;
import java.util.UUID;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class BootstrapAdminUserConfig {
  @Bean
  @ConditionalOnBean(AppUserRepository.class)
  CommandLineRunner bootstrapAdminUser(
      AppSecurityProperties properties,
      AppUserRepository appUserRepository,
      BCryptPasswordEncoder bcryptPasswordEncoder) {
    return args -> {
      String email = trimToNull(properties.bootstrapAdminEmail());
      String password = trimToNull(properties.bootstrapAdminPassword());

      if (email == null || password == null) {
        return;
      }

      if (appUserRepository.findByEmailIgnoreCase(email).isPresent()) {
        return;
      }

      AppUser admin = new AppUser();
      admin.setId(UUID.randomUUID());
      admin.setEmail(email);
      admin.setPasswordHash(bcryptPasswordEncoder.encode(password));
      admin.setDisplayName("Administrator");
      admin.setRole("ADMIN");
      admin.setEmailDomain(extractDomain(email));
      admin.setCanManageAgents(true);
      admin.setCreatedAt(OffsetDateTime.now());
      appUserRepository.save(admin);
    };
  }

  private static String trimToNull(String value) {
    if (value == null) {
      return null;
    }
    String trimmed = value.trim();
    return trimmed.isEmpty() ? null : trimmed;
  }

  private static String extractDomain(String email) {
    int at = email.indexOf('@');
    if (at <= 0 || at >= email.length() - 1) {
      return "local";
    }
    return email.substring(at + 1).trim().toLowerCase();
  }
}

