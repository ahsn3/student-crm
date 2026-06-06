package com.ingazgate.crm.lead.telegram;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration
public class TelegramWebClientConfig {
  @Bean
  WebClient telegramWebClient() {
    return WebClient.builder().baseUrl("https://api.telegram.org").build();
  }
}
