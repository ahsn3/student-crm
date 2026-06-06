package com.ingazgate.crm.student;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface StudentServiceRecordRepository extends JpaRepository<StudentServiceRecord, UUID> {
  /** Lists service rows without text search; {@code join fetch} initializes student for mapping. */
  @Query(
      """
      select r from StudentServiceRecord r
      join fetch r.student s
      where r.ownerUser.id = :ownerUserId and r.serviceKey = :serviceKey
      order by r.updatedAt desc
      """)
  List<StudentServiceRecord> listForOwnerAndServiceKey(
      @Param("ownerUserId") UUID ownerUserId, @Param("serviceKey") String serviceKey);

  @Query(
      """
      select r from StudentServiceRecord r
      join fetch r.student s
      where r.ownerUser.id = :ownerUserId
        and r.serviceKey = :serviceKey
        and r.status = :status
      order by r.updatedAt desc
      """)
  List<StudentServiceRecord> listForOwnerServiceKeyAndStatus(
      @Param("ownerUserId") UUID ownerUserId,
      @Param("serviceKey") String serviceKey,
      @Param("status") String status);

  @Query(
      """
      select r
      from StudentServiceRecord r
      join fetch r.student s
      where r.ownerUser.id = :ownerUserId
        and r.serviceKey = :serviceKey
        and (:statusFilter is null or r.status = :statusFilter)
        and (
          lower(s.fullName) like lower(concat('%', :searchFilter, '%'))
          or lower(coalesce(s.passportNo, '')) like lower(concat('%', :searchFilter, '%'))
          or lower(coalesce(s.phone, '')) like lower(concat('%', :searchFilter, '%'))
        )
      order by r.updatedAt desc
      """)
  List<StudentServiceRecord> findForOwnerFilteredWithSearch(
      @Param("ownerUserId") UUID ownerUserId,
      @Param("serviceKey") String serviceKey,
      @Param("statusFilter") String statusFilter,
      @Param("searchFilter") String searchFilter);

  @Query(
      """
      select r
      from StudentServiceRecord r
      join fetch r.student s
      where r.ownerUser.id = :ownerUserId
        and r.serviceKey = :serviceKey
        and r.endDate is not null
        and r.endDate >= :fromDate
        and r.endDate <= :throughDate
        and r.status <> 'CANCELLED'
      order by r.endDate asc
      """)
  List<StudentServiceRecord> findExpiringBetween(
      @Param("ownerUserId") UUID ownerUserId,
      @Param("serviceKey") String serviceKey,
      @Param("fromDate") LocalDate fromDate,
      @Param("throughDate") LocalDate throughDate);

  @Query(
      """
      select r from StudentServiceRecord r
      join fetch r.student s
      where r.ownerUser.id = :ownerUserId and s.id = :studentId
      order by r.updatedAt desc
      """)
  List<StudentServiceRecord> listForOwnerAndStudent(
      @Param("ownerUserId") UUID ownerUserId, @Param("studentId") UUID studentId);
}
