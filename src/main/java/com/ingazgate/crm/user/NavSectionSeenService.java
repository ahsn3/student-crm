package com.ingazgate.crm.user;

import java.time.OffsetDateTime;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NavSectionSeenService {
  private static final Logger log = LoggerFactory.getLogger(NavSectionSeenService.class);
  private static final OffsetDateTime EPOCH = OffsetDateTime.parse("1970-01-01T00:00:00Z");
  public static final String SECTION_STUDENTS = "students";
  public static final String SECTION_APPLICATIONS = "applications";
  public static final String SECTION_AGENTS = "agents";
  public static final String SECTION_NEWS = "news";
  public static final String SECTION_COMPLAINTS = "complaints";

  private final NavSectionSeenRepository navSectionSeenRepository;

  public NavSectionSeenService(NavSectionSeenRepository navSectionSeenRepository) {
    this.navSectionSeenRepository = navSectionSeenRepository;
  }

  @Transactional(readOnly = true)
  public OffsetDateTime lastSeenAt(UUID userId, String section) {
    if (userId == null || section == null || section.isBlank()) {
      return EPOCH;
    }
    try {
      return navSectionSeenRepository
          .findByUserIdAndSection(userId, section)
          .map(NavSectionSeen::getLastSeenAt)
          .orElse(EPOCH);
    } catch (RuntimeException ex) {
      log.warn("nav_section_seen unavailable for lastSeenAt (run Flyway V43/V44)", ex);
      return EPOCH;
    }
  }

  @Transactional
  public void markSeen(UUID userId, String section) {
    if (userId == null || section == null || section.isBlank()) {
      return;
    }
    try {
      OffsetDateTime now = OffsetDateTime.now();
      NavSectionSeen row =
          navSectionSeenRepository
              .findByUserIdAndSection(userId, section)
              .orElseGet(
                  () -> {
                    NavSectionSeen created = new NavSectionSeen();
                    created.setUserId(userId);
                    created.setSection(section);
                    return created;
                  });
      row.setLastSeenAt(now);
      navSectionSeenRepository.save(row);
    } catch (RuntimeException ex) {
      log.warn("nav_section_seen unavailable for markSeen (run Flyway V43/V44)", ex);
    }
  }
}
