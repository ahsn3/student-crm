package com.ingazgate.crm.web;

import com.ingazgate.crm.user.AdminNotificationService;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import java.security.Principal;
import java.time.OffsetDateTime;
import java.util.UUID;
import java.util.regex.Pattern;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AgentAdminController {
  private static final Pattern EMAIL_LOCAL =
      Pattern.compile("^[a-zA-Z0-9]([a-zA-Z0-9._-]{0,62}[a-zA-Z0-9])$");
  private static final Pattern DOMAIN_PATTERN =
      Pattern.compile("^[a-zA-Z0-9][a-zA-Z0-9.-]*\\.[a-zA-Z]{2,}$");

  private final AuthUsers authUsers;
  private final AppUserRepository appUserRepository;
  private final BCryptPasswordEncoder bcryptPasswordEncoder;
  private final AdminNotificationService adminNotificationService;

  public AgentAdminController(
      AuthUsers authUsers,
      AppUserRepository appUserRepository,
      BCryptPasswordEncoder bcryptPasswordEncoder,
      AdminNotificationService adminNotificationService) {
    this.authUsers = authUsers;
    this.appUserRepository = appUserRepository;
    this.bcryptPasswordEncoder = bcryptPasswordEncoder;
    this.adminNotificationService = adminNotificationService;
  }

  @PostMapping("/agents")
  String createAgent(
      Principal principal,
      @RequestParam("username") String username,
      @RequestParam("password") String password,
      RedirectAttributes redirectAttributes) {
    AppUser manager = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(manager)) {
      return "redirect:/";
    }

    ParsedAgent parsed = parseAgentUsername(username);
    if (parsed == null
        || password == null
        || password.trim().length() < 8) {
      redirectAttributes.addFlashAttribute(
          "agentError", "Enter username as person@office.com and a password (8+ characters).");
      return "redirect:/agents";
    }

    if (appUserRepository.existsByEmailIgnoreCase(parsed.email())) {
      redirectAttributes.addFlashAttribute("agentError", "This agent email already exists.");
      return "redirect:/agents";
    }

    AppUser user = new AppUser();
    user.setId(UUID.randomUUID());
    user.setEmail(parsed.email());
    user.setEmailDomain(parsed.emailDomain());
    user.setPasswordHash(bcryptPasswordEncoder.encode(password.trim()));
    user.setDisplayName(parsed.displayName());
    user.setOfficeName(parsed.officeName());
    user.setRole("AGENT");
    user.setCanManageAgents(false);
    user.setParentUserId(manager.getId());
    user.setCreatedAt(OffsetDateTime.now());
    appUserRepository.save(user);

    adminNotificationService.notifyIngazgateAdmins(
        "Admin " + manager.getDisplayName() + " added new agent " + parsed.officeName() + ".",
        manager.getId(),
        "/agents/" + user.getId());

    redirectAttributes.addFlashAttribute("agentSuccess", "Agent account created: " + parsed.email());
    return "redirect:/agents";
  }

  private record ParsedAgent(String email, String displayName, String officeName, String emailDomain) {}

  /** person@office.com → email, display name, office label, and domain. */
  private static ParsedAgent parseAgentUsername(String raw) {
    String value = norm(raw).toLowerCase();
    int at = value.indexOf('@');
    if (at <= 0 || at >= value.length() - 1) {
      return null;
    }
    String local = value.substring(0, at);
    String domain = value.substring(at + 1);
    if (!EMAIL_LOCAL.matcher(local).matches() || !DOMAIN_PATTERN.matcher(domain).matches()) {
      return null;
    }
    String email = local + "@" + domain;
    return new ParsedAgent(email, personNameFromLocal(local), officeNameFromDomain(domain), domain);
  }

  private static String personNameFromLocal(String local) {
    String[] parts = local.split("[._-]+");
    StringBuilder sb = new StringBuilder();
    for (String part : parts) {
      if (part.isEmpty()) {
        continue;
      }
      if (sb.length() > 0) {
        sb.append(' ');
      }
      sb.append(Character.toUpperCase(part.charAt(0)));
      if (part.length() > 1) {
        sb.append(part.substring(1).toLowerCase());
      }
    }
    return sb.toString();
  }

  private static String officeNameFromDomain(String domain) {
    int dot = domain.indexOf('.');
    String label = dot > 0 ? domain.substring(0, dot) : domain;
    if (label.isEmpty()) {
      return label;
    }
    return Character.toUpperCase(label.charAt(0))
        + (label.length() > 1 ? label.substring(1).toLowerCase() : "");
  }

  @PostMapping("/agents/{id}")
  String updateAgent(
      Principal principal,
      @org.springframework.web.bind.annotation.PathVariable("id") UUID id,
      @RequestParam("displayName") String displayName,
      @RequestParam(value = "officeName", required = false) String officeName,
      @RequestParam(value = "phone", required = false) String phone,
      @RequestParam("usernameLocal") String usernameLocal,
      @RequestParam("domain") String domain,
      @RequestParam(value = "newPassword", required = false) String newPassword,
      @RequestParam(value = "logoFile", required = false) MultipartFile logoFile,
      @RequestParam(value = "removeLogo", required = false) String removeLogo,
      RedirectAttributes redirectAttributes) {
    AppUser manager = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(manager)) {
      return "redirect:/";
    }
    AppUser agent =
        appUserRepository
            .findById(id)
            .filter(a -> "AGENT".equalsIgnoreCase(a.getRole()))
            .orElse(null);
    if (agent == null || !isManagedBy(manager, agent)) {
      redirectAttributes.addFlashAttribute("agentError", "Agent not found.");
      return "redirect:/agents";
    }

    String name = norm(displayName);
    String office = norm(officeName);
    String phoneNorm = norm(phone);
    String local = norm(usernameLocal).toLowerCase();
    String dm = norm(domain).toLowerCase();
    if (name.isEmpty() || !EMAIL_LOCAL.matcher(local).matches() || !DOMAIN_PATTERN.matcher(dm).matches()) {
      redirectAttributes.addFlashAttribute("agentError", "Please fill valid agent data.");
      return "redirect:/agents/" + id;
    }
    String email = local + "@" + dm;
    if (!email.equalsIgnoreCase(agent.getEmail())
        && appUserRepository.existsByEmailIgnoreCaseAndIdNot(email, agent.getId())) {
      redirectAttributes.addFlashAttribute("agentError", "This agent email already exists.");
      return "redirect:/agents/" + id;
    }

    if (phoneNorm.length() > 80) {
      redirectAttributes.addFlashAttribute("agentError", "Phone must be at most 80 characters.");
      return "redirect:/agents/" + id;
    }
    agent.setDisplayName(name);
    agent.setOfficeName(office.isEmpty() ? null : office);
    agent.setPhone(phoneNorm.isEmpty() ? null : phoneNorm);
    agent.setEmail(email);
    agent.setEmailDomain(dm);
    if (newPassword != null && !newPassword.isBlank()) {
      if (newPassword.trim().length() < 8) {
        redirectAttributes.addFlashAttribute("agentError", "Password must be at least 8 characters.");
        return "redirect:/agents/" + id;
      }
      agent.setPasswordHash(bcryptPasswordEncoder.encode(newPassword.trim()));
    }
    if ("true".equalsIgnoreCase(removeLogo)) {
      agent.setLogoUrl(null);
    } else if (logoFile != null && !logoFile.isEmpty()) {
      String logoError = applyAgentLogo(agent, logoFile);
      if (logoError != null) {
        redirectAttributes.addFlashAttribute("agentError", logoError);
        return "redirect:/agents/" + id;
      }
    }
    appUserRepository.save(agent);

    redirectAttributes.addFlashAttribute("agentSuccess", "Agent updated.");
    return "redirect:/agents/" + id;
  }

  @PostMapping("/agents/{id}/delete")
  String deleteAgent(
      Principal principal, @PathVariable("id") UUID id, RedirectAttributes redirectAttributes) {
    AppUser manager = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(manager)) {
      return "redirect:/";
    }
    AppUser agent =
        appUserRepository
            .findById(id)
            .filter(a -> "AGENT".equalsIgnoreCase(a.getRole()))
            .orElse(null);
    if (agent == null || !isManagedBy(manager, agent)) {
      redirectAttributes.addFlashAttribute("agentError", "Agent not found.");
      return "redirect:/agents";
    }
    if (manager.getId() != null && manager.getId().equals(agent.getId())) {
      redirectAttributes.addFlashAttribute("agentError", "You cannot delete your own account here.");
      return "redirect:/agents/" + id;
    }
    String label = agent.getDisplayName() != null ? agent.getDisplayName() : agent.getEmail();
    appUserRepository.delete(agent);
    redirectAttributes.addFlashAttribute("agentSuccess", "Agent deleted: " + label);
    return "redirect:/agents";
  }

  private static String norm(String value) {
    return value == null ? "" : value.trim();
  }

  private boolean isManagedBy(AppUser manager, AppUser agent) {
    if (agent == null || !"AGENT".equalsIgnoreCase(agent.getRole())) {
      return false;
    }
    if (authUsers.canManageAgents(manager)) {
      return true;
    }
    return agent.getParentUserId() != null && agent.getParentUserId().equals(manager.getId());
  }

  private static String applyAgentLogo(AppUser agent, MultipartFile logoFile) {
    if (!UserAvatarSupport.isSupportedLogo(logoFile.getContentType())
        || logoFile.getSize() > 1024L * 1024L) {
      return "Logo must be PNG/JPG/WEBP and up to 1 MB.";
    }
    try {
      agent.setLogoUrl(UserAvatarSupport.encodeLogoFile(logoFile));
      return null;
    } catch (Exception ex) {
      return "Could not read logo file.";
    }
  }
}
