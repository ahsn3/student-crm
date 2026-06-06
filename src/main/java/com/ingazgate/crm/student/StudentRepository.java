package com.ingazgate.crm.student;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface StudentRepository extends JpaRepository<Student, UUID> {
  Optional<Student> findByIdAndOwnerUser_Id(UUID id, UUID ownerUserId);

  @Query("select s from Student s join fetch s.ownerUser where s.id = :id")
  Optional<Student> findByIdWithOwner(@Param("id") UUID id);

  List<Student> findByOwnerUser_IdOrderByCreatedAtDesc(UUID ownerUserId);

  List<Student> findTop5ByOwnerUser_IdOrderByCreatedAtDesc(UUID ownerUserId);

  @Query(
      "select s from Student s join s.ownerUser o "
          + "where upper(coalesce(o.role, '')) <> 'AGENT' "
          + "order by s.createdAt desc")
  List<Student> findIngazgateWorkspaceStudents();

  @Query(
      "select s from Student s join s.ownerUser o "
          + "where upper(coalesce(o.role, '')) <> 'AGENT' "
          + "order by s.createdAt desc")
  List<Student> findTop5IngazgateWorkspaceStudents(Pageable pageable);

  @Query(
      "select s from Student s join s.ownerUser o "
          + "where upper(coalesce(o.role, '')) <> 'AGENT' "
          + "order by s.createdAt desc")
  List<Student> findTop5NonAgentWorkspaceStudents(Pageable pageable);

  @Query(
      "select s from Student s join s.ownerUser o "
          + "where upper(coalesce(o.role, '')) <> 'AGENT' "
          + "order by s.createdAt desc")
  List<Student> findNonAgentWorkspaceStudents();

  long countByOwnerUser_IdAndCreatedAtGreaterThanEqual(UUID ownerUserId, OffsetDateTime createdAt);

  @Query(
      "select count(s) from Student s join s.ownerUser o where s.createdAt >= :since "
          + "and upper(coalesce(o.role, '')) <> 'AGENT')")
  long countIngazgateWorkspaceStudentsCreatedSince(@Param("since") OffsetDateTime since);

  @Query(
      "select count(s) from Student s join s.ownerUser o where s.createdAt >= :since "
          + "and upper(coalesce(o.role, '')) <> 'AGENT'")
  long countNonAgentWorkspaceStudentsCreatedSince(@Param("since") OffsetDateTime since);

  @Query(
      """
      select s from Student s
      where s.ownerUser.id = :ownerId
        and (
          lower(s.fullName) like lower(concat('%', :q, '%'))
          or lower(coalesce(s.passportNo, '')) like lower(concat('%', :q, '%'))
          or lower(coalesce(s.email, '')) like lower(concat('%', :q, '%'))
          or lower(coalesce(s.phone, '')) like lower(concat('%', :q, '%'))
        )
      order by s.updatedAt desc
      """)
  List<Student> searchForOwner(
      @Param("ownerId") UUID ownerId, @Param("q") String q, Pageable pageable);

  @Query(
      """
      select s from Student s
      where (
        lower(s.fullName) like lower(concat('%', :q, '%'))
        or lower(coalesce(s.passportNo, '')) like lower(concat('%', :q, '%'))
        or lower(coalesce(s.email, '')) like lower(concat('%', :q, '%'))
        or lower(coalesce(s.phone, '')) like lower(concat('%', :q, '%'))
      )
      order by s.updatedAt desc
      """)
  List<Student> searchAllVisible(@Param("q") String q, Pageable pageable);
}
