package com.ingazgate.crm.user;

import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NavSectionSeenRepository extends JpaRepository<NavSectionSeen, NavSectionSeenId> {
  Optional<NavSectionSeen> findByUserIdAndSection(UUID userId, String section);
}
