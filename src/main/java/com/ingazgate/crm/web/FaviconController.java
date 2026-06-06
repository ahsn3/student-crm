package com.ingazgate.crm.web;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.CacheControl;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FaviconController {
  private static final Resource FAVICON =
      new ClassPathResource("static" + BrandSupport.FAVICON_ICO_PATH);

  @GetMapping("/favicon.ico")
  ResponseEntity<Resource> favicon() {
    return ResponseEntity.ok()
        .contentType(MediaType.parseMediaType("image/x-icon"))
        .cacheControl(CacheControl.noCache())
        .body(FAVICON);
  }
}
