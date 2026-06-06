package com.ingazgate.crm.config;

import com.zaxxer.hikari.HikariDataSource;
import jakarta.annotation.Nullable;
import java.net.URI;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import javax.sql.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.util.StringUtils;

@Configuration
public class RailwayDatabaseUrlConfig {
  private static final Logger log = LoggerFactory.getLogger(RailwayDatabaseUrlConfig.class);

  @Bean
  DataSource dataSource(Environment environment) {
    String pgHost = trim(environment.getProperty("PGHOST"));
    if (StringUtils.hasText(pgHost)) {
      String port = defaultIfBlank(environment.getProperty("PGPORT"), "5432");
      String database = defaultIfBlank(environment.getProperty("PGDATABASE"), "railway");
      String user = defaultIfBlank(environment.getProperty("PGUSER"), "postgres");
      String password = environment.getProperty("PGPASSWORD", "");
      String jdbcUrl = buildJdbcUrl(pgHost, port, database);
      log.info("Connecting to Postgres via PGHOST at {}:{}/{}", pgHost, port, database);
      return buildDataSource(jdbcUrl, user, password);
    }

    String rawDatabaseUrl = trim(environment.getProperty("DATABASE_URL"));
    if (StringUtils.hasText(rawDatabaseUrl)) {
      ParsedJdbc parsed = parseDatabaseUrl(rawDatabaseUrl);
      log.info("Connecting to Postgres via DATABASE_URL");
      return buildDataSource(parsed.jdbcUrl(), parsed.username(), parsed.password());
    }

    String host = defaultIfBlank(environment.getProperty("DB_HOST"), "localhost");
    String port = defaultIfBlank(environment.getProperty("DB_PORT"), "5432");
    String name = defaultIfBlank(environment.getProperty("DB_NAME"), "student_crm");
    String user = defaultIfBlank(environment.getProperty("DB_USER"), "postgres");
    String pass = environment.getProperty("DB_PASSWORD", "postgres");
    String jdbcUrl = buildJdbcUrl(host, port, name);
    log.info("Connecting to Postgres via DB_* vars at {}:{}/{}", host, port, name);
    return buildDataSource(jdbcUrl, user, pass);
  }

  private static String buildJdbcUrl(String host, String port, String database) {
    String jdbcUrl = "jdbc:postgresql://" + host + ":" + port + "/" + database;
    if (!host.contains("railway.internal") && !host.equals("localhost") && !host.equals("127.0.0.1")) {
      jdbcUrl += "?sslmode=require";
    }
    return jdbcUrl;
  }

  private DataSource buildDataSource(String jdbcUrl, @Nullable String username, @Nullable String password) {
    HikariDataSource dataSource = new HikariDataSource();
    dataSource.setJdbcUrl(jdbcUrl);
    dataSource.setUsername(username == null ? "" : username);
    dataSource.setPassword(password == null ? "" : password);
    dataSource.setMaximumPoolSize(3);
    dataSource.setMinimumIdle(1);
    dataSource.setConnectionTimeout(30_000);
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
      String username =
          userParts.length > 0 ? decodeComponent(userParts[0]) : "";
      String password =
          userParts.length > 1 ? decodeComponent(userParts[1]) : "";

      String host = uri.getHost();
      int port = uri.getPort() == -1 ? 5432 : uri.getPort();
      String dbName = uri.getPath() == null ? "" : uri.getPath().replaceFirst("^/", "");
      String query = uri.getQuery();

      String jdbcUrl = buildJdbcUrl(host, String.valueOf(port), dbName);
      if (StringUtils.hasText(query)) {
        jdbcUrl += (jdbcUrl.contains("?") ? "&" : "?") + query;
      }

      return new ParsedJdbc(jdbcUrl, username, password);
    } catch (Exception ex) {
      throw new IllegalStateException("Invalid DATABASE_URL format.", ex);
    }
  }

  private static String decodeComponent(String value) {
    return URLDecoder.decode(value, StandardCharsets.UTF_8);
  }

  private static String trim(String value) {
    return value == null ? null : value.trim();
  }

  private static String defaultIfBlank(String value, String fallback) {
    return StringUtils.hasText(value) ? value.trim() : fallback;
  }

  private record ParsedJdbc(String jdbcUrl, @Nullable String username, @Nullable String password) {}
}
