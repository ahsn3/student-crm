package com.ingazgate.crm.lead.telegram;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "telegram")
public record TelegramProperties(Bot bot, Test test) {
  public record Bot(String token) {}

  public record Test(String chatId) {}
}
