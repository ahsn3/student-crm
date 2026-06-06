package com.ingazgate.crm.student;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ApplicationMessageRepository extends JpaRepository<ApplicationMessage, UUID> {

  @Query(
      """
      select m from ApplicationMessage m
      join fetch m.sender
      where m.application.id = :applicationId
      order by m.createdAt asc
      """)
  List<ApplicationMessage> findForApplicationOrderByCreatedAtAsc(
      @Param("applicationId") UUID applicationId);

  @Query(
      """
      select m from ApplicationMessage m
      join fetch m.application a
      join fetch m.sender
      where m.id = :messageId and a.id = :applicationId
      """)
  Optional<ApplicationMessage> findByIdAndApplication_Id(
      @Param("messageId") UUID messageId, @Param("applicationId") UUID applicationId);

  @Query(
      """
      select m.application.id, count(m)
      from ApplicationMessage m
      left join ApplicationChatRead r
        on r.applicationId = m.application.id and r.userId = :viewerId
      where m.application.id in :applicationIds
        and m.sender.id <> :viewerId
        and (r.lastReadAt is null or m.createdAt > r.lastReadAt)
      group by m.application.id
      """)
  List<Object[]> countUnreadByApplicationIds(
      @Param("applicationIds") Collection<UUID> applicationIds,
      @Param("viewerId") UUID viewerId);

  @Query(
      """
      select count(m)
      from ApplicationMessage m
      left join ApplicationChatRead r
        on r.applicationId = m.application.id and r.userId = :viewerId
      where m.application.id = :applicationId
        and m.sender.id <> :viewerId
        and (r.lastReadAt is null or m.createdAt > r.lastReadAt)
      """)
  long countUnreadForApplication(
      @Param("applicationId") UUID applicationId, @Param("viewerId") UUID viewerId);

  /** Unread chat messages (incl. file uploads) grouped by application workspace owner (agent). */
  @Query(
      """
      select m.ownerUser.id, count(m)
      from ApplicationMessage m
      left join ApplicationChatRead r
        on r.applicationId = m.application.id and r.userId = :viewerId
      where m.ownerUser.id in :ownerUserIds
        and m.sender.id <> :viewerId
        and (r.lastReadAt is null or m.createdAt > r.lastReadAt)
      group by m.ownerUser.id
      """)
  List<Object[]> countUnreadByOwnerUserIds(
      @Param("ownerUserIds") Collection<UUID> ownerUserIds, @Param("viewerId") UUID viewerId);
}
