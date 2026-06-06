package com.ingazgate.crm.student;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface StudentApplicationRepository extends JpaRepository<StudentApplication, UUID> {
  @Query(
      "select a from StudentApplication a "
          + "join fetch a.student "
          + "left join fetch a.department d "
          + "left join fetch d.university "
          + "where a.ownerUser.id = :ownerId "
          + "and (:status is null or a.status = :status) "
          + "and (:semester is null or :semester = '' or a.semester = :semester) "
          + "and (:universityId is null or (d is not null and d.university is not null and d.university.id = :universityId)) "
          + "and (:programId is null or (d is not null and d.id = :programId)) "
          + "order by a.updatedAt desc, a.createdAt desc")
  List<StudentApplication> findForOwnerFiltered(
      @Param("ownerId") UUID ownerId,
      @Param("status") String status,
      @Param("semester") String semester,
      @Param("universityId") UUID universityId,
      @Param("programId") UUID programId);

  default List<StudentApplication> findAllForOwner(UUID ownerId) {
    return findForOwnerFiltered(ownerId, null, null, null, null);
  }

  /** IngazGate workspace applications only (excludes agent-owned rows). */
  @Query(
      "select a from StudentApplication a "
          + "join fetch a.student "
          + "join a.ownerUser ow "
          + "left join fetch a.department d "
          + "left join fetch d.university "
          + "where upper(coalesce(ow.role, '')) <> 'AGENT' "
          + "and (:status is null or a.status = :status) "
          + "and (:semester is null or :semester = '' or a.semester = :semester) "
          + "and (:universityId is null or (d is not null and d.university is not null and d.university.id = :universityId)) "
          + "and (:programId is null or (d is not null and d.id = :programId)) "
          + "order by a.updatedAt desc, a.createdAt desc")
  List<StudentApplication> findIngazgateApplicationsFiltered(
      @Param("status") String status,
      @Param("semester") String semester,
      @Param("universityId") UUID universityId,
      @Param("programId") UUID programId);

  @Query(
      "select a from StudentApplication a "
          + "join fetch a.student "
          + "join a.ownerUser ow "
          + "left join fetch a.department d "
          + "left join fetch d.university "
          + "where upper(coalesce(ow.role, '')) <> 'AGENT' "
          + "and (:status is null or a.status = :status) "
          + "and (:semester is null or :semester = '' or a.semester = :semester) "
          + "and (:universityId is null or (d is not null and d.university is not null and d.university.id = :universityId)) "
          + "and (:programId is null or (d is not null and d.id = :programId)) "
          + "order by a.updatedAt desc, a.createdAt desc")
  List<StudentApplication> findAllApplicationsFiltered(
      @Param("status") String status,
      @Param("semester") String semester,
      @Param("universityId") UUID universityId,
      @Param("programId") UUID programId);

  @Query(
      "select a from StudentApplication a "
          + "join fetch a.student "
          + "left join fetch a.department d "
          + "left join fetch d.university "
          + "where a.ownerUser.id = :ownerId "
          + "order by a.updatedAt desc, a.createdAt desc")
  List<StudentApplication> findRecentForOwner(@Param("ownerId") UUID ownerId, Pageable pageable);

  @Query(
      "select a from StudentApplication a "
          + "join fetch a.student "
          + "join a.ownerUser ow "
          + "left join fetch a.department d "
          + "left join fetch d.university "
          + "where upper(coalesce(ow.role, '')) <> 'AGENT' "
          + "order by a.updatedAt desc, a.createdAt desc")
  List<StudentApplication> findRecentIngazgate(Pageable pageable);

  @Query(
      "select a from StudentApplication a "
          + "join fetch a.student "
          + "join a.ownerUser ow "
          + "left join fetch a.department d "
          + "left join fetch d.university "
          + "where upper(coalesce(ow.role, '')) <> 'AGENT' "
          + "order by a.updatedAt desc, a.createdAt desc")
  List<StudentApplication> findRecentAll(Pageable pageable);

  long countByOwnerUser_IdAndCreatedAtGreaterThanEqual(UUID ownerUserId, OffsetDateTime createdAt);

  @Query(
      "select count(a) from StudentApplication a join a.ownerUser ow "
          + "where a.createdAt >= :since "
          + "and upper(coalesce(ow.role, '')) <> 'AGENT')")
  long countIngazgateApplicationsCreatedSince(@Param("since") OffsetDateTime since);

  @Query(
      "select count(a) from StudentApplication a join a.ownerUser ow "
          + "where a.createdAt >= :since and upper(coalesce(ow.role, '')) <> 'AGENT'")
  long countNonAgentApplicationsCreatedSince(@Param("since") OffsetDateTime since);

  Optional<StudentApplication> findByIdAndOwnerUser_Id(UUID id, UUID ownerUserId);

  @Query(
      "select a from StudentApplication a "
          + "join fetch a.student "
          + "left join fetch a.department d "
          + "left join fetch d.university "
          + "where a.id = :id and a.ownerUser.id = :ownerId")
  Optional<StudentApplication> findByIdAndOwnerUser_IdForEdit(
      @Param("id") UUID id, @Param("ownerId") UUID ownerUserId);

  @Query(
      "select a from StudentApplication a "
          + "join fetch a.ownerUser "
          + "join fetch a.student "
          + "left join fetch a.department d "
          + "left join fetch d.university "
          + "where a.id = :id")
  Optional<StudentApplication> findByIdWithGraph(@Param("id") UUID id);

  @Query(value = "SELECT nextval('application_number_seq')", nativeQuery = true)
  long nextApplicationNumber();

  @Query("select a.student.id, count(a) from StudentApplication a where a.ownerUser.id = :owner group by a.student.id")
  List<Object[]> countApplicationsPerStudent(@Param("owner") UUID ownerId);

  @Query(
      "select a from StudentApplication a "
          + "left join fetch a.department d "
          + "left join fetch d.university "
          + "where a.ownerUser.id = :ownerId and a.student.id = :studentId "
          + "order by a.updatedAt desc, a.createdAt desc")
  List<StudentApplication> findForOwnerAndStudent(
      @Param("ownerId") UUID ownerId, @Param("studentId") UUID studentId);

  @Query(
      "select distinct a.semester from StudentApplication a where a.ownerUser.id = :owner and a.semester is not null and a.semester <> '' order by a.semester")
  List<String> findDistinctSemestersForOwner(@Param("owner") UUID ownerId);

  @Query(
      "select distinct a.semester from StudentApplication a join a.ownerUser ow "
          + "where upper(coalesce(ow.role, '')) <> 'AGENT' "
          + "and a.semester is not null and a.semester <> '' order by a.semester")
  List<String> findDistinctSemestersIngazgate();

  @Query(
      "select distinct a.semester from StudentApplication a join a.ownerUser ow "
          + "where upper(coalesce(ow.role, '')) <> 'AGENT' "
          + "and a.semester is not null and a.semester <> '' order by a.semester")
  List<String> findDistinctSemestersAll();

  @Query(
      "select a.id from StudentApplication a join a.ownerUser ow "
          + "where upper(coalesce(ow.role, '')) <> 'AGENT'")
  List<UUID> findIngazgateApplicationIds();

  @Query(
      "select a.id from StudentApplication a join a.ownerUser ow "
          + "where upper(coalesce(ow.role, '')) = 'AGENT'")
  List<UUID> findAgentOwnedApplicationIds();

  @Query("select a.id from StudentApplication a where a.ownerUser.id = :ownerId")
  List<UUID> findApplicationIdsByOwner(@Param("ownerId") UUID ownerId);

  @Query(
      """
      select a from StudentApplication a
      join fetch a.student s
      left join fetch a.department d
      left join fetch d.university
      where a.ownerUser.id = :ownerId
        and (
          lower(a.applicationNumber) like lower(concat('%', :q, '%'))
          or lower(s.fullName) like lower(concat('%', :q, '%'))
          or lower(coalesce(a.notes, '')) like lower(concat('%', :q, '%'))
        )
      order by a.updatedAt desc
      """)
  List<StudentApplication> searchForOwner(
      @Param("ownerId") UUID ownerId, @Param("q") String q, Pageable pageable);

  @Query(
      """
      select a from StudentApplication a
      join fetch a.student s
      left join fetch a.department d
      left join fetch d.university
      where (
        lower(a.applicationNumber) like lower(concat('%', :q, '%'))
        or lower(s.fullName) like lower(concat('%', :q, '%'))
        or lower(coalesce(a.notes, '')) like lower(concat('%', :q, '%'))
      )
      order by a.updatedAt desc
      """)
  List<StudentApplication> searchAllVisible(@Param("q") String q, Pageable pageable);
}
