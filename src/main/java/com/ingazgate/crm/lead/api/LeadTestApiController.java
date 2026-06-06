package com.ingazgate.crm.lead.api;

import com.ingazgate.crm.lead.dto.LeadResponse;
import com.ingazgate.crm.lead.service.LeadService;
import com.ingazgate.crm.lead.telegram.TelegramService;
import java.util.Map;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class LeadTestApiController {
  private final TelegramService telegramService;
  private final LeadService leadService;

  public LeadTestApiController(TelegramService telegramService, LeadService leadService) {
    this.telegramService = telegramService;
    this.leadService = leadService;
  }

  @GetMapping("/test-telegram")
  ResponseEntity<Map<String, String>> testTelegram() {
    telegramService.sendTestMessage(
        "✅ Student CRM Telegram test\n\nIf you received this, the bot is configured correctly.");
    return ResponseEntity.ok(Map.of("status", "sent", "message", "Test Telegram message sent"));
  }

  @PostMapping("/test-lead")
  ResponseEntity<LeadResponse> testLead() {
    LeadResponse lead = leadService.createSampleLead();
    return ResponseEntity.ok(lead);
  }
}
