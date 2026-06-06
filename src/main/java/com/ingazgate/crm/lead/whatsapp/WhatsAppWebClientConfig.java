package com.ingazgate.crm.lead.whatsapp;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration
public class WhatsAppWebClientConfig {
  @Bean
  WebClient whatsAppWebClient(WhatsAppProperties properties) {
    String version =
        properties.api() != null && properties.api().graphVersion() != null
            ? properties.api().graphVersion().trim()
            : "v21.0";
    return WebClient.builder().baseUrl("https://graph.facebook.com/" + version).build();
  }
}
