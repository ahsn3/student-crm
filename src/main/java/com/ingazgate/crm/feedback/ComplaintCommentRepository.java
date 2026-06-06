package com.ingazgate.crm.feedback;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ComplaintCommentRepository extends JpaRepository<ComplaintComment, UUID> {
  @Query(
      "select c from ComplaintComment c join fetch c.author where c.complaint.id = :complaintId order by c.createdAt asc")
  List<ComplaintComment> findForComplaintWithAuthor(@Param("complaintId") UUID complaintId);

  @Query(
      """
      select count(c) from ComplaintComment c join c.author a
      where c.createdAt > :since
        and a.id <> :viewerId
        and upper(coalesce(a.role, '')) = 'AGENT'
      """)
  long countNonIngazgateCommentsSince(
      @Param("since") OffsetDateTime since, @Param("viewerId") UUID viewerId);

  @Query(
      """
      select count(c) from ComplaintComment c
      join c.complaint co
      join c.author a
      where c.createdAt > :since
        and co.author.id = :agentId
        and a.id <> :agentId
        and upper(coalesce(a.role, '')) <> 'AGENT'
      """)
  long countIngazgateCommentsOnAgentComplaintsSince(
      @Param("since") OffsetDateTime since, @Param("agentId") UUID agentId);
}
