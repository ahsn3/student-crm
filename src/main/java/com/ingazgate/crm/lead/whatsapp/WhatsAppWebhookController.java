package com.ingazgate.crm.lead.whatsapp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/whatsapp/webhook")
public class WhatsAppWebhookController {
  private static final Logger log = LoggerFactory.getLogger(WhatsAppWebhookController.class);

  private final WhatsAppProperties properties;

  public WhatsAppWebhookController(WhatsAppProperties properties) {
    this.properties = properties;
  }

  @GetMapping
  ResponseEntity<String> verifyWebhook(
      @RequestParam(name = "hub.mode", required = false) String mode,
      @RequestParam(name = "hub.verify_token", required = false) String verifyToken,
      @RequestParam(name = "hub.challenge", required = false) String challenge) {
    String expected =
        properties.webhook() != null ? properties.webhook().verifyToken() : null;
    if ("subscribe".equals(mode)
        && StringUtils.hasText(expected)
        && expected.equals(verifyToken)
        && StringUtils.hasText(challenge)) {
      log.info("WhatsApp webhook verified");
      return ResponseEntity.ok(challenge);
    }
    log.warn("WhatsApp webhook verification failed mode={}", mode);
    return ResponseEntity.status(403).body("Forbidden");
  }

  @PostMapping
  ResponseEntity<Void> receiveWebhook(@RequestBody(required = false) String payload) {
    if (StringUtils.hasText(payload)) {
      log.info("WhatsApp webhook event received ({} bytes)", payload.length());
      log.debug("WhatsApp webhook payload: {}", payload);
    } else {
      log.info("WhatsApp webhook event received with empty body");
    }
    return ResponseEntity.ok().build();
  }
}
