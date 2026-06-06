package com.ingazgate.crm.lead.api;

import com.ingazgate.crm.lead.dto.LeadResponse;
import com.ingazgate.crm.lead.service.LeadService;
import com.ingazgate.crm.lead.telegram.TelegramService;
import com.ingazgate.crm.lead.whatsapp.WhatsAppService;
import java.util.LinkedHashMap;
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
  private final WhatsAppService whatsAppService;
  private final LeadService leadService;

  public LeadTestApiController(
      TelegramService telegramService, WhatsAppService whatsAppService, LeadService leadService) {
    this.telegramService = telegramService;
    this.whatsAppService = whatsAppService;
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

  @GetMapping("/test-whatsapp")
  ResponseEntity<Map<String, Object>> testWhatsApp() {
    Map<String, Object> result = new LinkedHashMap<>(whatsAppService.configStatus());
    result.put("apiCheck", whatsAppService.verifyConnection());
    return ResponseEntity.ok(result);
  }

  @PostMapping("/test-whatsapp/send")
  ResponseEntity<Map<String, String>> sendTestWhatsApp() {
    whatsAppService.sendTestMessage(
        "✅ Student CRM WhatsApp test\n\nIf you received this, Meta Cloud API is configured correctly.");
    return ResponseEntity.ok(Map.of("status", "sent", "message", "Test WhatsApp message sent"));
  }
}
