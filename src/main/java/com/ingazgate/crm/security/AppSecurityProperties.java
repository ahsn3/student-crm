package com.ingazgate.crm.security;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "app.security")
public record AppSecurityProperties(
    String bootstrapAdminEmail,
    String bootstrapAdminPassword,
    String seedUsers,
    String seedUsersPassword) {}

