package com.ingazgate.crm.config;

import com.zaxxer.hikari.HikariDataSource;
import jakarta.annotation.Nullable;
import java.net.URI;
import java.net.URISyntaxException;
import javax.sql.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.util.StringUtils;

@Configuration
public class RailwayDatabaseUrlConfig {
  @Bean
  DataSource dataSource(Environment environment) {
    String rawDatabaseUrl = environment.getProperty("DATABASE_URL");
    if (!StringUtils.hasText(rawDatabaseUrl)) {
      String host = environment.getProperty("DB_HOST", "localhost");
      String port = environment.getProperty("DB_PORT", "5432");
      String name = environment.getProperty("DB_NAME", "student_crm");
      String user = environment.getProperty("DB_USER", "postgres");
      String pass = environment.getProperty("DB_PASSWORD", "postgres");
      rawDatabaseUrl = "jdbc:postgresql://" + host + ":" + port + "/" + name;
      return buildDataSource(rawDatabaseUrl, user, pass);
    }

    ParsedJdbc parsed = parseDatabaseUrl(rawDatabaseUrl);
    return buildDataSource(parsed.jdbcUrl(), parsed.username(), parsed.password());
  }

  private DataSource buildDataSource(String jdbcUrl, @Nullable String username, @Nullable String password) {
    HikariDataSource dataSource = new HikariDataSource();
    dataSource.setJdbcUrl(jdbcUrl);
    dataSource.setUsername(username);
    dataSource.setPassword(password);
    return dataSource;
  }

  private ParsedJdbc parseDatabaseUrl(String raw) {
    if (raw.startsWith("jdbc:postgresql://")) {
      return new ParsedJdbc(raw, "", "");
    }

    String normalized = raw;
    if (raw.startsWith("postgres://")) {
      normalized = "postgresql://" + raw.substring("postgres://".length());
    }

    if (!normalized.startsWith("postgresql://")) {
      throw new IllegalStateException("Unsupported DATABASE_URL format.");
    }

    try {
      URI uri = new URI(normalized);
      String userInfo = uri.getUserInfo() == null ? "" : uri.getUserInfo();
      String[] userParts = userInfo.split(":", 2);
      String username = userParts.length > 0 ? userParts[0] : "";
      String password = userParts.length > 1 ? userParts[1] : "";

      String host = uri.getHost();
      int port = uri.getPort() == -1 ? 5432 : uri.getPort();
      String dbName = uri.getPath() == null ? "" : uri.getPath().replaceFirst("^/", "");
      String query = uri.getQuery();

      String jdbcUrl = "jdbc:postgresql://" + host + ":" + port + "/" + dbName;
      if (StringUtils.hasText(query)) {
        jdbcUrl += "?" + query;
      }

      return new ParsedJdbc(jdbcUrl, username, password);
    } catch (URISyntaxException ex) {
      throw new IllegalStateException("Invalid DATABASE_URL format.", ex);
    }
  }

  private record ParsedJdbc(String jdbcUrl, @Nullable String username, @Nullable String password) {}
}

