package com.ingazgate.crm.web;

import com.ingazgate.crm.asset.University;
import com.ingazgate.crm.asset.UniversityRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class UniversitiesCatalogService {
  private static final long CACHE_TTL_MS = 5 * 60 * 1000L;

  private final UniversityRepository universityRepository;
  private volatile List<UniversityListItem> cached;
  private volatile long cachedAt;

  public UniversitiesCatalogService(UniversityRepository universityRepository) {
    this.universityRepository = universityRepository;
  }

  public void invalidate() {
    cached = null;
    cachedAt = 0L;
  }

  public UniversitiesPageResponse searchPage(String search, String country, int page, int size) {
    String q = search == null ? "" : search.trim().toLowerCase();
    String c = country == null ? "" : country.trim();
    int safePage = Math.max(page, 1);
    int safeSize = Math.min(Math.max(size, 1), 500);
    List<UniversityListItem> filtered =
        listAll().stream()
            .filter(
                u -> {
                  boolean okCountry = c.isEmpty() || c.equals(u.country());
                  if (!okCountry) {
                    return false;
                  }
                  if (q.isEmpty()) {
                    return true;
                  }
                  String hay =
                      ((u.name() != null ? u.name() : "")
                              + " "
                              + (u.website() != null ? u.website() : ""))
                          .toLowerCase();
                  return hay.contains(q);
                })
            .toList();
    long total = filtered.size();
    int from = (safePage - 1) * safeSize;
    int to = Math.min(from + safeSize, filtered.size());
    List<UniversityListItem> slice = from >= filtered.size() ? List.of() : filtered.subList(from, to);
    return new UniversitiesPageResponse(slice, total, safePage, safeSize);
  }

  public List<UniversityListItem> listAll() {
    List<UniversityListItem> hit = cached;
    long now = System.currentTimeMillis();
    if (hit != null && now - cachedAt < CACHE_TTL_MS) {
      return hit;
    }
    synchronized (this) {
      hit = cached;
      if (hit != null && now - cachedAt < CACHE_TTL_MS) {
        return hit;
      }
      List<UniversityListItem> fresh =
          universityRepository.findAllByOrderByNameAsc().stream()
              .map(UniversitiesCatalogService::toItem)
              .toList();
      cached = fresh;
      cachedAt = System.currentTimeMillis();
      return fresh;
    }
  }

  static UniversityListItem toItem(University u) {
    return new UniversityListItem(
        u.getId(),
        u.getName(),
        u.getCountry(),
        u.getCurrency(),
        u.getProgramsCount(),
        u.getCampusesCount(),
        u.getWebsite(),
        u.getLogoUrl());
  }
}
