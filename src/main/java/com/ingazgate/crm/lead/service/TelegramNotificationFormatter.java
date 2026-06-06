package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.entity.Lead;
import com.ingazgate.crm.lead.entity.LeadType;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class TelegramNotificationFormatter {
  private static final DateTimeFormatter DISPLAY_FMT =
      DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

  private final ZoneId displayZone;

  public TelegramNotificationFormatter(
      @Value("${app.display-timezone:Europe/Istanbul}") String displayTimezone) {
    this.displayZone = ZoneId.of(displayTimezone);
  }

  public String formatNewLead(Lead lead, OffsetDateTime assignedAt) {
    StringBuilder sb = new StringBuilder();
    sb.append("🚨 NEW LEAD\n\n");
    sb.append("Type: ").append(formatType(lead.getLeadType())).append('\n');
    sb.append("Name: ").append(safe(lead.getStudentName())).append('\n');
    sb.append("Phone: ").append(safe(lead.getPhone())).append('\n');
    sb.append("Email: ").append(safe(lead.getEmail())).append('\n');
    sb.append("Nationality: ").append(safe(lead.getNationality())).append("\n\n");
    sb.append("Target University:\n");
    sb.append(safe(lead.getTargetUniversity())).append("\n\n");
    sb.append("Desired Major:\n");
    sb.append(safe(lead.getDesiredMajor())).append("\n\n");
    sb.append("Notes:\n");
    sb.append(safe(lead.getNotes())).append("\n\n");

    String waLink = whatsAppLink(lead.getPhone());
    if (waLink != null) {
      sb.append("Contact:\n").append(waLink).append("\n\n");
    }

    OffsetDateTime when = assignedAt != null ? assignedAt : OffsetDateTime.now();
    sb.append("Assigned Time:\n");
    sb.append(when.atZoneSameInstant(displayZone).format(DISPLAY_FMT));

    return sb.toString();
  }

  private static String formatType(LeadType type) {
    if (type == null) {
      return "—";
    }
    return type.name().replace('_', ' ');
  }

  private static String safe(String value) {
    return StringUtils.hasText(value) ? value.trim() : "—";
  }

  static String whatsAppLink(String phone) {
    if (!StringUtils.hasText(phone)) {
      return null;
    }
    String digits = phone.replaceAll("\\D", "");
    if (digits.isEmpty()) {
      return null;
    }
    return "https://wa.me/" + digits;
  }
}
