package com.ingazgate.crm.user;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AdminNotificationRepository extends JpaRepository<AdminNotification, UUID> {
  @Query(
      """
      select n from AdminNotification n
      where n.ownerUserId = :ownerUserId
      order by n.createdAt desc
      """)
  List<AdminNotification> findRecentForOwner(
      @Param("ownerUserId") UUID ownerUserId, Pageable pageable);

  @Query(
      value =
          "select count(*) from admin_notification where owner_user_id = :ownerUserId and is_read = false",
      nativeQuery = true)
  long countUnreadForOwner(@Param("ownerUserId") UUID ownerUserId);

  Optional<AdminNotification> findByIdAndOwnerUserId(UUID id, UUID ownerUserId);

  @Query(
      """
      select n from AdminNotification n
      where n.ownerUserId = :ownerUserId
      order by n.isRead asc, n.createdAt desc
      """)
  List<AdminNotification> findAllForOwnerUnreadFirst(@Param("ownerUserId") UUID ownerUserId);

  @Query(
      """
      select n from AdminNotification n
      where n.ownerUserId = :ownerUserId and n.isRead = false
      """)
  List<AdminNotification> findUnreadForOwner(@Param("ownerUserId") UUID ownerUserId);

  @Query(
      """
      select count(n) from AdminNotification n
      where n.ownerUserId = :ownerUserId
        and n.isRead = false
        and n.linkUrl is not null
        and lower(n.linkUrl) like lower(concat(:prefix, '%'))
      """)
  long countUnreadForOwnerAndLinkPrefix(
      @Param("ownerUserId") UUID ownerUserId, @Param("prefix") String prefix);
}
