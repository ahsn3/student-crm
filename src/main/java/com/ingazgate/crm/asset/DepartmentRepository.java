package com.ingazgate.crm.asset;

import java.util.Collection;
import java.util.List;
import java.util.UUID;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DepartmentRepository extends JpaRepository<Department, UUID> {
  @EntityGraph(attributePaths = "university")
  List<Department> findAllByOrderByNameAsc();

  @Query(
      """
      SELECT DISTINCT TRIM(d.degree) FROM Department d
      WHERE d.degree IS NOT NULL AND TRIM(d.degree) <> ''
      ORDER BY TRIM(d.degree)
      """)
  List<String> findDistinctDegreeNames();

  @Query(
      """
      SELECT DISTINCT TRIM(d.language) FROM Department d
      WHERE d.language IS NOT NULL AND TRIM(d.language) <> ''
      ORDER BY TRIM(d.language)
      """)
  List<String> findDistinctLanguageNames();

  @Query(
      """
      SELECT DISTINCT TRIM(u.country) FROM Department d
      JOIN d.university u
      WHERE u.country IS NOT NULL AND TRIM(u.country) <> ''
      ORDER BY TRIM(u.country)
      """)
  List<String> findDistinctUniversityCountries();

  @EntityGraph(attributePaths = "university")
  List<Department> findByUniversity_IdOrderByNameAsc(UUID universityId);

  @EntityGraph(attributePaths = "university")
  @Query("SELECT d FROM Department d WHERE d.id IN :ids")
  List<Department> findAllByIdInWithUniversity(@Param("ids") Collection<UUID> ids);

  @Query(
      """
      select count(d) > 0 from Department d
      where d.university.id = :universityId
        and lower(trim(d.name)) = lower(trim(:name))
        and lower(coalesce(trim(d.degree), '')) = lower(coalesce(trim(:degree), ''))
        and lower(coalesce(trim(d.language), '')) = lower(coalesce(trim(:language), ''))
      """)
  boolean existsDuplicateForUniversity(
      @Param("universityId") UUID universityId,
      @Param("name") String name,
      @Param("degree") String degree,
      @Param("language") String language);

  @Query(
      value =
          """
          SELECT d FROM Department d
          JOIN d.university u
          WHERE (
            :q = ''
            OR lower(trim(d.name)) LIKE lower(concat('%', :q, '%'))
            OR lower(trim(coalesce(d.nameAr, ''))) LIKE lower(concat('%', :q, '%'))
            OR lower(trim(coalesce(d.degree, ''))) LIKE lower(concat('%', :q, '%'))
            OR lower(trim(coalesce(d.language, ''))) LIKE lower(concat('%', :q, '%'))
          )
          AND (:degree = '' OR trim(coalesce(d.degree, '')) = :degree)
          AND (:language = '' OR trim(coalesce(d.language, '')) = :language)
          AND (:country = '' OR trim(coalesce(u.country, '')) = :country)
          AND (:uniFilter = false OR u.name IN :universityNames)
          """,
      countQuery =
          """
          SELECT count(d) FROM Department d
          JOIN d.university u
          WHERE (
            :q = ''
            OR lower(trim(d.name)) LIKE lower(concat('%', :q, '%'))
            OR lower(trim(coalesce(d.nameAr, ''))) LIKE lower(concat('%', :q, '%'))
            OR lower(trim(coalesce(d.degree, ''))) LIKE lower(concat('%', :q, '%'))
            OR lower(trim(coalesce(d.language, ''))) LIKE lower(concat('%', :q, '%'))
          )
          AND (:degree = '' OR trim(coalesce(d.degree, '')) = :degree)
          AND (:language = '' OR trim(coalesce(d.language, '')) = :language)
          AND (:country = '' OR trim(coalesce(u.country, '')) = :country)
          AND (:uniFilter = false OR u.name IN :universityNames)
          """)
  @EntityGraph(attributePaths = "university")
  Page<Department> searchPrograms(
      @Param("q") String q,
      @Param("degree") String degree,
      @Param("language") String language,
      @Param("country") String country,
      @Param("uniFilter") boolean uniFilter,
      @Param("universityNames") List<String> universityNames,
      Pageable pageable);
}

