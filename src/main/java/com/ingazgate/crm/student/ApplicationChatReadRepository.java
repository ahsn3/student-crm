package com.ingazgate.crm.student;

import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ApplicationChatReadRepository
    extends JpaRepository<ApplicationChatRead, ApplicationChatReadId> {
  Optional<ApplicationChatRead> findByApplicationIdAndUserId(UUID applicationId, UUID userId);
}
