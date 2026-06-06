package com.ingazgate.crm.feedback;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface NewsCommentRepository extends JpaRepository<NewsComment, UUID> {
  @Query(
      "select c from NewsComment c join fetch c.author where c.post.id = :postId order by c.createdAt asc")
  List<NewsComment> findForPostWithAuthor(@Param("postId") UUID postId);

  /** New comments on news from agents (for IngazGate admin sidebar badge). */
  @Query(
      """
      select count(c) from NewsComment c join c.author a
      where c.createdAt > :since
        and upper(coalesce(a.role, '')) = 'AGENT'
      """)
  long countAgentCommentsSince(@Param("since") OffsetDateTime since);

  /** New comments from IngazGate staff (for agent sidebar badge). */
  @Query(
      """
      select count(c) from NewsComment c join c.author a
      where c.createdAt > :since
        and a.id <> :viewerId
        and upper(coalesce(a.role, '')) <> 'AGENT'
      """)
  long countIngazgateCommentsSince(
      @Param("since") OffsetDateTime since, @Param("viewerId") UUID viewerId);
}
