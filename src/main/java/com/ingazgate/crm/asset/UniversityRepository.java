package com.ingazgate.crm.asset;

import java.util.List;
import java.util.UUID;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UniversityRepository extends JpaRepository<University, UUID> {
  List<University> findAllByOrderByNameAsc();

  @Query(
      """
      select u from University u
      where lower(u.name) like lower(concat('%', :q, '%'))
         or lower(coalesce(u.country, '')) like lower(concat('%', :q, '%'))
      order by u.name asc
      """)
  List<University> searchByTerm(@Param("q") String q, Pageable pageable);
}

