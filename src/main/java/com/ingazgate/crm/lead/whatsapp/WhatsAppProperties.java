package com.ingazgate.crm.lead.whatsapp;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "whatsapp")
public record WhatsAppProperties(Api api, Webhook webhook, Test test) {
  public record Api(
      String accessToken,
      String phoneNumberId,
      String businessAccountId,
      String displayPhone,
      String graphVersion) {}

  public record Webhook(String verifyToken) {}

  public record Test(String phone) {}
}
