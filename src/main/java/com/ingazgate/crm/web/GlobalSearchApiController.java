package com.ingazgate.crm.web;

import com.ingazgate.crm.user.AppUser;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/search")
public class GlobalSearchApiController {
  private final AuthUsers authUsers;
  private final GlobalSearchService globalSearchService;

  public GlobalSearchApiController(AuthUsers authUsers, GlobalSearchService globalSearchService) {
    this.authUsers = authUsers;
    this.globalSearchService = globalSearchService;
  }

  @GetMapping
  ResponseEntity<Map<String, Object>> search(
      Principal principal, @RequestParam(value = "q", defaultValue = "") String q) {
    AppUser user = authUsers.requireCurrentUser(principal);
    List<GlobalSearchHit> hits = globalSearchService.search(user, q);
    List<Map<String, String>> items =
        hits.stream()
            .map(
                h -> {
                  Map<String, String> row = new HashMap<>();
                  row.put("type", h.type());
                  row.put("typeLabel", h.typeLabel());
                  row.put("title", h.title());
                  row.put("subtitle", h.subtitle());
                  row.put("url", h.url());
                  return row;
                })
            .toList();
    Map<String, Object> body = new HashMap<>();
    body.put("items", items);
    return ResponseEntity.ok(body);
  }
}
