package com.ingazgate.crm.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UniversitiesDataController {
  private final UniversitiesCatalogService universitiesCatalog;

  public UniversitiesDataController(UniversitiesCatalogService universitiesCatalog) {
    this.universitiesCatalog = universitiesCatalog;
  }

  @GetMapping("/api/universities/data")
  UniversitiesPageResponse listUniversities(
      @RequestParam(defaultValue = "1") int page,
      @RequestParam(defaultValue = "20") int size,
      @RequestParam(defaultValue = "") String search,
      @RequestParam(defaultValue = "") String country) {
    return universitiesCatalog.searchPage(search, country, page, size);
  }
}
