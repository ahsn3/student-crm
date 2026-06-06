package com.ingazgate.crm.lead.telegram;

import com.ingazgate.crm.lead.exception.TelegramDeliveryException;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

@Service
public class TelegramService {
  private static final Logger log = LoggerFactory.getLogger(TelegramService.class);

  private final TelegramProperties properties;
  private final WebClient telegramWebClient;

  public TelegramService(TelegramProperties properties, WebClient telegramWebClient) {
    this.properties = properties;
    this.telegramWebClient = telegramWebClient;
  }

  public void sendMessage(Long chatId, String message) {
    if (chatId == null) {
      log.warn("Skipping Telegram message: chatId is null");
      return;
    }
    if (!StringUtils.hasText(message)) {
      log.warn("Skipping Telegram message to {}: message is blank", chatId);
      return;
    }

    String token = properties.bot() != null ? properties.bot().token() : null;
    if (!StringUtils.hasText(token)) {
      throw new TelegramDeliveryException("Telegram bot token is not configured");
    }

    String uri = "/bot" + token.trim() + "/sendMessage";
    Map<String, Object> body =
        Map.of(
            "chat_id", chatId,
            "text", message,
            "disable_web_page_preview", true);

    try {
      telegramWebClient
          .post()
          .uri(uri)
          .contentType(MediaType.APPLICATION_JSON)
          .bodyValue(body)
          .retrieve()
          .bodyToMono(String.class)
          .block();

      log.info("Telegram message sent to chatId={}", chatId);
    } catch (WebClientResponseException ex) {
      log.error(
          "Telegram API error for chatId={}: status={} body={}",
          chatId,
          ex.getStatusCode(),
          ex.getResponseBodyAsString(),
          ex);
      throw new TelegramDeliveryException(
          "Telegram API returned " + ex.getStatusCode().value() + ": " + ex.getResponseBodyAsString(),
          ex);
    } catch (Exception ex) {
      log.error("Failed to send Telegram message to chatId={}", chatId, ex);
      throw new TelegramDeliveryException("Failed to send Telegram message", ex);
    }
  }

  public void sendTestMessage(String message) {
    String chatIdRaw = properties.test() != null ? properties.test().chatId() : null;
    if (!StringUtils.hasText(chatIdRaw)) {
      throw new TelegramDeliveryException("telegram.test.chat-id is not configured");
    }
    Long chatId = Long.parseLong(chatIdRaw.trim());
    sendMessage(chatId, message);
  }
}
