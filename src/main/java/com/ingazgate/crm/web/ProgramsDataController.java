package com.ingazgate.crm.web;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProgramsDataController {
  private final ProgramsCatalogService programsCatalog;

  public ProgramsDataController(ProgramsCatalogService programsCatalog) {
    this.programsCatalog = programsCatalog;
  }

  @GetMapping("/api/programs/data")
  ProgramsPageResponse listPrograms(
      @RequestParam(defaultValue = "1") int page,
      @RequestParam(defaultValue = "20") int size,
      @RequestParam(defaultValue = "") String search,
      @RequestParam(required = false) List<String> university,
      @RequestParam(defaultValue = "") String degree,
      @RequestParam(defaultValue = "") String language,
      @RequestParam(defaultValue = "") String country) {
    return programsCatalog.searchPage(search, university, degree, language, country, page, size);
  }
}
