package com.ingazgate.crm.web;

import com.ingazgate.crm.asset.Department;
import com.ingazgate.crm.asset.DepartmentRepository;
import java.time.OffsetDateTime;
import com.ingazgate.crm.support.DisplayTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class ProgramsCatalogService {
  static final int MAX_PDF_EXPORT_ROWS = 10_000;
  private static final long CACHE_TTL_MS = 5 * 60 * 1000L;
  private static final DateTimeFormatter UPDATED_FMT =
      DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

  private final DepartmentRepository departmentRepository;
  private volatile List<ProgramListItem> cached;
  private volatile long cachedAt;
  private volatile ProgramFilterOptions filterOptionsCached;
  private volatile long filterOptionsCachedAt;

  public ProgramsCatalogService(DepartmentRepository departmentRepository) {
    this.departmentRepository = departmentRepository;
  }

  public List<ProgramListItem> listAll() {
    List<ProgramListItem> hit = cached;
    long now = System.currentTimeMillis();
    if (hit != null && now - cachedAt < CACHE_TTL_MS) {
      return hit;
    }
    synchronized (this) {
      hit = cached;
      if (hit != null && now - cachedAt < CACHE_TTL_MS) {
        return hit;
      }
      List<ProgramListItem> fresh = loadFromDb();
      cached = fresh;
      cachedAt = System.currentTimeMillis();
      return fresh;
    }
  }

  public void invalidate() {
    cached = null;
    cachedAt = 0L;
    filterOptionsCached = null;
    filterOptionsCachedAt = 0L;
  }

  public ProgramFilterOptions filterOptions() {
    ProgramFilterOptions hit = filterOptionsCached;
    long now = System.currentTimeMillis();
    if (hit != null && now - filterOptionsCachedAt < CACHE_TTL_MS) {
      return hit;
    }
    synchronized (this) {
      hit = filterOptionsCached;
      if (hit != null && now - filterOptionsCachedAt < CACHE_TTL_MS) {
        return hit;
      }
      ProgramFilterOptions fresh =
          new ProgramFilterOptions(
              List.copyOf(departmentRepository.findDistinctDegreeNames()),
              List.copyOf(departmentRepository.findDistinctLanguageNames()),
              List.copyOf(departmentRepository.findDistinctUniversityCountries()));
      filterOptionsCached = fresh;
      filterOptionsCachedAt = System.currentTimeMillis();
      return fresh;
    }
  }

  public ProgramsPageResponse searchPage(
      String search,
      List<String> universityNames,
      String degree,
      String language,
      String country,
      int page,
      int size) {
    String q = search == null ? "" : search.trim().toLowerCase();
    String deg = degree == null ? "" : degree.trim();
    String lang = language == null ? "" : language.trim();
    String ctry = country == null ? "" : country.trim();
    List<String> unis =
        universityNames == null
            ? List.of()
            : universityNames.stream().filter(s -> s != null && !s.isBlank()).toList();
    boolean uniFilter = !unis.isEmpty();
    int safePage = Math.max(page, 1);
    int safeSize = Math.min(Math.max(size, 1), 100);
    if (q.isEmpty() && !uniFilter && deg.isEmpty() && lang.isEmpty() && ctry.isEmpty()) {
      List<ProgramListItem> all = listAll();
      long total = all.size();
      int from = Math.max(0, (safePage - 1) * safeSize);
      if (from >= all.size()) {
        return new ProgramsPageResponse(List.of(), total, safePage, safeSize);
      }
      int to = Math.min(all.size(), from + safeSize);
      return new ProgramsPageResponse(new ArrayList<>(all.subList(from, to)), total, safePage, safeSize);
    }
    Page<Department> result =
        departmentRepository.searchPrograms(
            q,
            deg,
            lang,
            ctry,
            uniFilter,
            uniFilter ? unis : List.of(""),
            PageRequest.of(
                safePage - 1,
                safeSize,
                Sort.by("name").ascending().and(Sort.by("id").ascending())));
    List<ProgramListItem> items = result.getContent().stream().map(ProgramsCatalogService::toItem).toList();
    return new ProgramsPageResponse(items, result.getTotalElements(), safePage, safeSize);
  }

  /** All programs matching filters (for PDF export), up to {@link #MAX_PDF_EXPORT_ROWS}. */
  public List<Department> searchAllForExport(
      String search, List<String> universityNames, String degree, String language, String country) {
    String q = search == null ? "" : search.trim().toLowerCase();
    String deg = degree == null ? "" : degree.trim();
    String lang = language == null ? "" : language.trim();
    String ctry = country == null ? "" : country.trim();
    List<String> unis =
        universityNames == null
            ? List.of()
            : universityNames.stream().filter(s -> s != null && !s.isBlank()).toList();
    boolean uniFilter = !unis.isEmpty();
    Page<Department> result =
        departmentRepository.searchPrograms(
            q,
            deg,
            lang,
            ctry,
            uniFilter,
            uniFilter ? unis : List.of(""),
            PageRequest.of(
                0,
                MAX_PDF_EXPORT_ROWS,
                Sort.by("name").ascending().and(Sort.by("id").ascending())));
    return result.getContent();
  }

  public long countMatching(
      String search, List<String> universityNames, String degree, String language, String country) {
    return searchPage(search, universityNames, degree, language, country, 1, 1).total();
  }

  private List<ProgramListItem> loadFromDb() {
    return departmentRepository.findAllByOrderByNameAsc().stream()
        .map(ProgramsCatalogService::toItem)
        .toList();
  }

  static ProgramListItem toItem(Department d) {
    var u = d.getUniversity();
    String currency = u != null && u.getCurrency() != null ? u.getCurrency() : "USD";
    return new ProgramListItem(
        d.getId(),
        d.getName(),
        d.getNameAr(),
        d.isAvailable(),
        d.getDegree(),
        d.getLanguage(),
        d.getYears(),
        d.getBeforeDiscount(),
        d.getCost(),
        d.getCashPrice(),
        u != null ? u.getId() : null,
        u != null ? u.getName() : null,
        u != null ? u.getCountry() : null,
        u != null ? u.getLogoUrl() : null,
        currency,
        formatUpdatedAt(d.getUpdatedAt() != null ? d.getUpdatedAt() : d.getCreatedAt()));
  }

  private static String formatUpdatedAt(OffsetDateTime value) {
    if (value == null) {
      return null;
    }
    return UPDATED_FMT.format(value.atZoneSameInstant(DisplayTime.ZONE));
  }
}
