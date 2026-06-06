package com.ingazgate.crm.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/** Lightweight health for Railway when actuator probes are unavailable. */
@RestController
public class HealthController {
  @GetMapping("/health")
  ResponseEntity<String> health() {
    return ResponseEntity.ok("OK");
  }
}
