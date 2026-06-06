package com.ingazgate.crm.config;

import org.springframework.boot.autoconfigure.flyway.FlywayMigrationStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FlywayRepairConfig {
  @Bean
  FlywayMigrationStrategy flywayMigrationStrategy() {
    return flyway -> {
      // Repair is expensive; only run when explicitly requested (one-off ops).
      if ("true".equalsIgnoreCase(System.getenv("FLYWAY_REPAIR"))) {
        flyway.repair();
      }
      flyway.migrate();
    };
  }
}
