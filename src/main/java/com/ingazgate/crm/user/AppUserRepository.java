package com.ingazgate.crm.user;

import java.util.Optional;
import java.util.UUID;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AppUserRepository extends JpaRepository<AppUser, UUID> {
  Optional<AppUser> findByEmailIgnoreCase(String email);

  boolean existsByEmailIgnoreCase(String email);

  boolean existsByEmailIgnoreCaseAndIdNot(String email, UUID id);

  @Query(
      """
      select u from AppUser u
      where u.role = 'AGENT' and u.parentUserId = :managerId
      order by u.createdAt desc
      """)
  List<AppUser> findManagedAgents(@Param("managerId") UUID managerId);

  @Query(
      """
      select u from AppUser u
      where upper(coalesce(u.role, '')) = 'ADMIN'
      order by u.createdAt asc
      """)
  List<AppUser> findStaffAdmins();

  default List<AppUser> findIngazgateAdmins() {
    return findStaffAdmins();
  }

  @Query(
      """
      select u from AppUser u
      where u.role = 'AGENT'
      order by u.createdAt desc
      """)
  List<AppUser> findAllAgents();

  @Query(
      """
      select u from AppUser u
      where u.role = 'AGENT'
        and lower(coalesce(u.emailDomain, '')) = lower(:domain)
      order by u.createdAt asc
      """)
  List<AppUser> findAgentsByEmailDomain(@Param("domain") String domain);

  @Query(
      """
      select u from AppUser u
      where u.role = 'AGENT'
        and (
          lower(coalesce(u.displayName, '')) like lower(concat('%', :q, '%'))
          or lower(coalesce(u.officeName, '')) like lower(concat('%', :q, '%'))
          or lower(u.email) like lower(concat('%', :q, '%'))
        )
      order by u.createdAt desc
      """)
  List<AppUser> searchAgents(@Param("q") String q, Pageable pageable);
}

