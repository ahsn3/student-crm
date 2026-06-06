package com.ingazgate.crm.config;

import org.flywaydb.core.api.callback.Callback;
import org.flywaydb.core.api.callback.Context;
import org.flywaydb.core.api.callback.Event;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/** Logs Flyway progress so Railway deploy logs show migration is still running. */
@Component
public class FlywayStartupLogger implements Callback {
  private static final Logger log = LoggerFactory.getLogger(FlywayStartupLogger.class);

  @Override
  public boolean supports(Event event, Context context) {
    return event == Event.BEFORE_MIGRATE
        || event == Event.AFTER_MIGRATE
        || event == Event.AFTER_EACH_MIGRATE;
  }

  @Override
  public boolean canHandleInTransaction(Event event, Context context) {
    return true;
  }

  @Override
  public void handle(Event event, Context context) {
    switch (event) {
      case BEFORE_MIGRATE ->
          log.info("Flyway: starting database migrations (first deploy can take 15–30 minutes)...");
      case AFTER_EACH_MIGRATE ->
          log.info(
              "Flyway: applied {} ({})",
              context.getMigrationInfo().getVersion(),
              context.getMigrationInfo().getDescription());
      case AFTER_MIGRATE -> log.info("Flyway: all migrations complete — starting web server.");
      default -> {}
    }
  }

  @Override
  public String getCallbackName() {
    return "flywayStartupLogger";
  }
}
