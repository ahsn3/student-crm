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
  private static final Resource LOGO = new ClassPathResource("static/images/logo.svg");

  @GetMapping("/favicon.ico")
  ResponseEntity<Resource> favicon() {
    return ResponseEntity.ok()
        .contentType(MediaType.parseMediaType("image/svg+xml"))
        .cacheControl(CacheControl.noCache())
        .body(LOGO);
  }
}
