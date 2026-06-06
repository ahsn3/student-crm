package com.ingazgate.crm.lead.whatsapp;

import com.ingazgate.crm.lead.exception.WhatsAppDeliveryException;
import java.util.LinkedHashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

@Service
public class WhatsAppService {
  private static final Logger log = LoggerFactory.getLogger(WhatsAppService.class);

  private final WhatsAppProperties properties;
  private final WebClient whatsAppWebClient;

  public WhatsAppService(WhatsAppProperties properties, WebClient whatsAppWebClient) {
    this.properties = properties;
    this.whatsAppWebClient = whatsAppWebClient;
  }

  public boolean isConfigured() {
    return StringUtils.hasText(accessToken()) && StringUtils.hasText(phoneNumberId());
  }

  public Map<String, Object> configStatus() {
    Map<String, Object> status = new LinkedHashMap<>();
    status.put("configured", isConfigured());
    status.put("phoneNumberId", mask(phoneNumberId()));
    status.put("businessAccountId", mask(businessAccountId()));
    status.put("displayPhone", displayPhone());
    status.put("graphVersion", graphVersion());
    status.put("webhookVerifyTokenConfigured", StringUtils.hasText(webhookVerifyToken()));
    return status;
  }

  public void sendTextMessage(String toPhone, String message) {
    if (!StringUtils.hasText(toPhone)) {
      log.warn("Skipping WhatsApp message: recipient phone is blank");
      return;
    }
    if (!StringUtils.hasText(message)) {
      log.warn("Skipping WhatsApp message to {}: message is blank", toPhone);
      return;
    }
    if (!isConfigured()) {
      throw new WhatsAppDeliveryException("WhatsApp Cloud API is not configured");
    }

    String recipient = normalizePhone(toPhone);
    Map<String, Object> body =
        Map.of(
            "messaging_product", "whatsapp",
            "recipient_type", "individual",
            "to", recipient,
            "type", "text",
            "text", Map.of("preview_url", false, "body", message.trim()));

    postMessages(body, recipient);
  }

  public void sendTestMessage(String message) {
    String testPhone = properties.test() != null ? properties.test().phone() : null;
    if (!StringUtils.hasText(testPhone)) {
      throw new WhatsAppDeliveryException("whatsapp.test.phone is not configured");
    }
    sendTextMessage(testPhone.trim(), message);
  }

  public String verifyConnection() {
    if (!isConfigured()) {
      throw new WhatsAppDeliveryException("WhatsApp Cloud API is not configured");
    }

    try {
      return whatsAppWebClient
          .get()
          .uri("/{phoneNumberId}", phoneNumberId().trim())
          .header(HttpHeaders.AUTHORIZATION, bearerToken())
          .retrieve()
          .bodyToMono(String.class)
          .block();
    } catch (WebClientResponseException ex) {
      log.error(
          "WhatsApp API verify failed: status={} body={}",
          ex.getStatusCode(),
          ex.getResponseBodyAsString(),
          ex);
      throw new WhatsAppDeliveryException(
          "WhatsApp API returned "
              + ex.getStatusCode().value()
              + ": "
              + ex.getResponseBodyAsString(),
          ex);
    } catch (Exception ex) {
      log.error("Failed to verify WhatsApp configuration", ex);
      throw new WhatsAppDeliveryException("Failed to verify WhatsApp configuration", ex);
    }
  }

  private void postMessages(Map<String, Object> body, String recipient) {
    try {
      whatsAppWebClient
          .post()
          .uri("/{phoneNumberId}/messages", phoneNumberId().trim())
          .header(HttpHeaders.AUTHORIZATION, bearerToken())
          .contentType(MediaType.APPLICATION_JSON)
          .bodyValue(body)
          .retrieve()
          .bodyToMono(String.class)
          .block();

      log.info("WhatsApp message sent to recipient={}", recipient);
    } catch (WebClientResponseException ex) {
      log.error(
          "WhatsApp API error for recipient={}: status={} body={}",
          recipient,
          ex.getStatusCode(),
          ex.getResponseBodyAsString(),
          ex);
      throw new WhatsAppDeliveryException(
          "WhatsApp API returned "
              + ex.getStatusCode().value()
              + ": "
              + ex.getResponseBodyAsString(),
          ex);
    } catch (Exception ex) {
      log.error("Failed to send WhatsApp message to recipient={}", recipient, ex);
      throw new WhatsAppDeliveryException("Failed to send WhatsApp message", ex);
    }
  }

  static String normalizePhone(String phone) {
    if (!StringUtils.hasText(phone)) {
      return "";
    }
    String digits = phone.replaceAll("\\D", "");
    if (digits.startsWith("00")) {
      return digits.substring(2);
    }
    return digits;
  }

  private String accessToken() {
    return properties.api() != null ? properties.api().accessToken() : null;
  }

  private String phoneNumberId() {
    return properties.api() != null ? properties.api().phoneNumberId() : null;
  }

  private String businessAccountId() {
    return properties.api() != null ? properties.api().businessAccountId() : null;
  }

  private String displayPhone() {
    return properties.api() != null ? properties.api().displayPhone() : null;
  }

  private String graphVersion() {
    if (properties.api() != null && StringUtils.hasText(properties.api().graphVersion())) {
      return properties.api().graphVersion().trim();
    }
    return "v21.0";
  }

  private String webhookVerifyToken() {
    return properties.webhook() != null ? properties.webhook().verifyToken() : null;
  }

  private String bearerToken() {
    return "Bearer " + accessToken().trim();
  }

  private static String mask(String value) {
    if (!StringUtils.hasText(value)) {
      return null;
    }
    String trimmed = value.trim();
    if (trimmed.length() <= 4) {
      return "****";
    }
    return trimmed.substring(0, 4) + "…" + trimmed.substring(trimmed.length() - 4);
  }
}
