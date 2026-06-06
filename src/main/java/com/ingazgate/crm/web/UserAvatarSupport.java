package com.ingazgate.crm.web;

import java.util.Base64;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

final class UserAvatarSupport {
  private UserAvatarSupport() {}

  static ResponseEntity<byte[]> avatarResponse(
      UUID userId, String logoUrl, String ifNoneMatch) {
    if (logoUrl == null || logoUrl.isBlank()) {
      return ResponseEntity.notFound().build();
    }
    String trimmed = logoUrl.trim();
    ParsedAvatar parsed = parseDataUriAvatar(trimmed);
    if (parsed == null) {
      return ResponseEntity.notFound().build();
    }
    String etag = "\"" + userId + "-" + Integer.toHexString(trimmed.hashCode()) + "\"";
    if (etag.equals(ifNoneMatch)) {
      return ResponseEntity.status(HttpStatus.NOT_MODIFIED).eTag(etag).build();
    }
    return ResponseEntity.ok()
        .eTag(etag)
        .cacheControl(CacheControl.maxAge(7, TimeUnit.DAYS).cachePrivate())
        .contentType(MediaType.parseMediaType(parsed.contentType()))
        .body(parsed.bytes());
  }

  static ParsedAvatar parseDataUriAvatar(String logoUrl) {
    if (!logoUrl.startsWith("data:")) {
      return null;
    }
    int comma = logoUrl.indexOf(',');
    if (comma < 0 || comma >= logoUrl.length() - 1) {
      return null;
    }
    String meta = logoUrl.substring(5, comma);
    String contentType = meta.split(";", 2)[0].trim();
    if (contentType.isEmpty()) {
      contentType = "image/png";
    }
    try {
      byte[] bytes = Base64.getDecoder().decode(logoUrl.substring(comma + 1).trim());
      if (bytes.length == 0) {
        return null;
      }
      return new ParsedAvatar(contentType, bytes);
    } catch (IllegalArgumentException ex) {
      return null;
    }
  }

  static String encodeLogoFile(MultipartFile logoFile) throws java.io.IOException {
    byte[] bytes = logoFile.getBytes();
    return "data:"
        + logoFile.getContentType()
        + ";base64,"
        + Base64.getEncoder().encodeToString(bytes);
  }

  static boolean isSupportedLogo(String contentType) {
    if (contentType == null) {
      return false;
    }
    return contentType.equals("image/png")
        || contentType.equals("image/jpeg")
        || contentType.equals("image/jpg")
        || contentType.equals("image/webp");
  }

  record ParsedAvatar(String contentType, byte[] bytes) {}
}
