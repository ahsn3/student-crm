package com.ingazgate.crm.feedback;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface NewsPostRepository extends JpaRepository<NewsPost, UUID> {
  @Query(
      "select p from NewsPost p join fetch p.author order by p.createdAt desc, p.updatedAt desc")
  List<NewsPost> findAllWithAuthor();

  @Query("select p from NewsPost p join fetch p.author where p.id = :id")
  Optional<NewsPost> findByIdWithAuthor(UUID id);
}
