package com.ingazgate.crm.feedback;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ComplaintRepository extends JpaRepository<Complaint, UUID> {
  @Query(
      "select c from Complaint c join fetch c.author order by c.createdAt desc, c.updatedAt desc")
  List<Complaint> findAllWithAuthor();

  @Query("select c from Complaint c join fetch c.author where c.id = :id")
  Optional<Complaint> findByIdWithAuthor(UUID id);

  @Query(
      """
      select count(c) from Complaint c
      where c.createdAt > :since
        and upper(coalesce(c.status, '')) = 'OPEN'
      """)
  long countOpenComplaintsSince(@Param("since") OffsetDateTime since);
}
