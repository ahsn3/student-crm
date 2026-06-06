package com.ingazgate.crm.student;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ApplicationAttachmentRepository extends JpaRepository<ApplicationAttachment, UUID> {
  List<ApplicationAttachment> findByOwnerUser_IdAndApplication_IdOrderByCreatedAtDesc(
      UUID ownerUserId, UUID applicationId);

  List<ApplicationAttachment> findByApplication_IdOrderByCreatedAtDesc(UUID applicationId);

  Optional<ApplicationAttachment> findByIdAndOwnerUser_Id(UUID id, UUID ownerUserId);

  Optional<ApplicationAttachment> findByIdAndApplication_Id(UUID id, UUID applicationId);
}
