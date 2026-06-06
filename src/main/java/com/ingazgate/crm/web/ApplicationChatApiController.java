package com.ingazgate.crm.web;

import com.ingazgate.crm.student.ApplicationChatService;
import com.ingazgate.crm.student.ApplicationMessage;
import com.ingazgate.crm.user.AppUser;
import java.security.Principal;
import java.util.Map;
import java.util.UUID;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/applications")
public class ApplicationChatApiController {
  private final AuthUsers authUsers;
  private final ApplicationChatService applicationChatService;

  public ApplicationChatApiController(
      AuthUsers authUsers, ApplicationChatService applicationChatService) {
    this.authUsers = authUsers;
    this.applicationChatService = applicationChatService;
  }

  @GetMapping("/{applicationId}/messages")
  ResponseEntity<Map<String, Object>> listMessages(
      @PathVariable UUID applicationId, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    try {
      return ResponseEntity.ok(applicationChatService.listMessages(applicationId, user, true));
    } catch (IllegalArgumentException ex) {
      return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }
  }

  @PostMapping(value = "/{applicationId}/messages", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
  ResponseEntity<Map<String, Object>> postMessage(
      @PathVariable UUID applicationId,
      Principal principal,
      @RequestParam(value = "body", required = false) String body,
      @RequestParam(value = "file", required = false) MultipartFile file) {
    AppUser user = authUsers.requireCurrentUser(principal);
    try {
      applicationChatService.postMessage(applicationId, user, body, file);
      return ResponseEntity.ok(Map.of("ok", true));
    } catch (IllegalArgumentException ex) {
      String code = ex.getMessage() != null ? ex.getMessage() : "error";
      if ("Application not found".equals(code)) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
      }
      if ("empty".equals(code) || "fileTooLarge".equals(code) || "uploadFailed".equals(code)) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", code));
      }
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "error"));
    }
  }

  @PostMapping("/{applicationId}/messages/read")
  ResponseEntity<Void> markRead(@PathVariable UUID applicationId, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (applicationChatService.findAuthorizedApplication(applicationId, user).isEmpty()) {
      return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }
    if (user.getId() != null) {
      applicationChatService.markRead(applicationId, user.getId(), java.time.OffsetDateTime.now());
    }
    return ResponseEntity.noContent().build();
  }

  @GetMapping("/{applicationId}/messages/{messageId}/download")
  ResponseEntity<ByteArrayResource> download(
      @PathVariable UUID applicationId,
      @PathVariable UUID messageId,
      Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    var row = applicationChatService.findMessageForDownload(applicationId, messageId, user);
    if (row.isEmpty() || row.get().getContent() == null || row.get().getContent().length == 0) {
      return ResponseEntity.notFound().build();
    }
    ApplicationMessage m = row.get();
    String ct =
        m.getContentType() == null || m.getContentType().isBlank()
            ? MediaType.APPLICATION_OCTET_STREAM_VALUE
            : m.getContentType();
    String fn = m.getFileName() == null ? "attachment.bin" : m.getFileName().replace("\"", "");
    return ResponseEntity.ok()
        .contentType(MediaType.parseMediaType(ct))
        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fn + "\"")
        .body(new ByteArrayResource(m.getContent()));
  }
}
