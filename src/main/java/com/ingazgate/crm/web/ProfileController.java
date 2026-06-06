package com.ingazgate.crm.web;

import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import java.security.Principal;
import java.util.regex.Pattern;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProfileController {
  static final String STAFF_EMAIL_DOMAIN = "local";
  private static final Pattern USERNAME =
      Pattern.compile("^[a-zA-Z0-9]([a-zA-Z0-9._-]{0,62}[a-zA-Z0-9])$");

  private final AppUserRepository appUserRepository;
  private final PasswordEncoder passwordEncoder;
  private final BCryptPasswordEncoder bcryptPasswordEncoder;
  private final UserDetailsService userDetailsService;

  public ProfileController(
      AppUserRepository appUserRepository,
      PasswordEncoder passwordEncoder,
      BCryptPasswordEncoder bcryptPasswordEncoder,
      UserDetailsService userDetailsService) {
    this.appUserRepository = appUserRepository;
    this.passwordEncoder = passwordEncoder;
    this.bcryptPasswordEncoder = bcryptPasswordEncoder;
    this.userDetailsService = userDetailsService;
  }

  @GetMapping("/profile")
  String profile(Model model, Principal principal) {
    AppUser user = requireCurrentUser(principal);
    boolean agent = isAgentAccount(user);
    model.addAttribute("pageTitleKey", "nav.account.editProfile");
    model.addAttribute("activeNav", "profile");
    model.addAttribute("contentTemplate", "pages/profile");
    model.addAttribute("profileName", user.getDisplayName());
    model.addAttribute("profileInitials", initialsFromName(user.getDisplayName()));
    model.addAttribute("profileUsername", usernameForDisplay(user));
    model.addAttribute("profileEmailLocal", localPartFromEmail(user.getEmail()));
    model.addAttribute("profileEmailDomain", "@" + emailDomain(user));
    model.addAttribute("profileRole", user.getRole());
    model.addAttribute("profileOfficeName", user.getOfficeName());
    model.addAttribute("profilePhone", user.getPhone());
    model.addAttribute("profileIsAgent", agent);
    String logoUrl = user.getLogoUrl();
    boolean hasPhoto = logoUrl != null && !logoUrl.isBlank();
    model.addAttribute("profileLogoUrl", logoUrl);
    model.addAttribute("profileHasPhoto", hasPhoto);
    model.addAttribute("profileUserId", user.getId());
    model.addAttribute("profileCanEditPhoto", true);
    return "layout/shell";
  }

  @GetMapping("/configuration")
  String configuration() {
    return "redirect:/profile";
  }

  @PostMapping("/profile")
  String updateProfile(
      Principal principal,
      @RequestParam("displayName") String displayName,
      @RequestParam("emailLocal") String emailLocal,
      @RequestParam(value = "officeName", required = false) String officeName,
      @RequestParam(value = "phone", required = false) String phone,
      @RequestParam(value = "logoFile", required = false) MultipartFile logoFile,
      RedirectAttributes redirectAttributes) {
    AppUser user = requireCurrentUser(principal);
    String normalizedName = displayName == null ? "" : displayName.trim();
    String username = emailLocal == null ? "" : emailLocal.trim().toLowerCase();

    if (normalizedName.isEmpty()) {
      redirectAttributes.addFlashAttribute("profileError", "Display name is required.");
      return "redirect:/profile";
    }
    if (username.isEmpty()) {
      redirectAttributes.addFlashAttribute("profileError", "Username is required.");
      return "redirect:/profile";
    }
    if (username.length() < 2
        || username.length() > 64
        || !USERNAME.matcher(username).matches()) {
      redirectAttributes.addFlashAttribute(
          "profileError",
          "Username may use letters, numbers, dots, underscores, and hyphens (2–64 characters).");
      return "redirect:/profile";
    }

    String newEmail = isAgentAccount(user) ? username + "@" + emailDomain(user) : username;
    String oldEmail = user.getEmail().trim().toLowerCase();
    if (!newEmail.equalsIgnoreCase(oldEmail)
        && appUserRepository.existsByEmailIgnoreCase(newEmail)) {
      redirectAttributes.addFlashAttribute("profileError", "That username is already in use.");
      return "redirect:/profile";
    }

    user.setDisplayName(normalizedName);
    user.setEmail(newEmail);
    if (!isAgentAccount(user)) {
      user.setEmailDomain(STAFF_EMAIL_DOMAIN);
    }
    if (officeName != null) {
      user.setOfficeName(emptyToNull(officeName.trim()));
    }
    if (isAgentAccount(user) && phone != null) {
      String normalizedPhone = phone.trim();
      if (normalizedPhone.length() > 80) {
        redirectAttributes.addFlashAttribute("profileError", "Phone must be at most 80 characters.");
        return "redirect:/profile";
      }
      user.setPhone(emptyToNull(normalizedPhone));
    }
    if (logoFile != null && !logoFile.isEmpty()) {
      if (!UserAvatarSupport.isSupportedLogo(logoFile.getContentType())
          || logoFile.getSize() > 1024L * 1024L) {
        redirectAttributes.addFlashAttribute(
            "profileError", "Logo must be PNG/JPG/WEBP and up to 1 MB.");
        return "redirect:/profile";
      }
      try {
        user.setLogoUrl(UserAvatarSupport.encodeLogoFile(logoFile));
      } catch (Exception ex) {
        redirectAttributes.addFlashAttribute("profileError", "Could not read logo file.");
        return "redirect:/profile";
      }
    }
    appUserRepository.save(user);

    if (!newEmail.equalsIgnoreCase(oldEmail)) {
      refreshAuthentication(newEmail);
    }

    redirectAttributes.addFlashAttribute("profileSuccess", "Profile saved.");
    return "redirect:/profile";
  }

  @PostMapping("/profile/remove-photo")
  String removeProfilePhoto(Principal principal, RedirectAttributes redirectAttributes) {
    AppUser user = requireCurrentUser(principal);
    user.setLogoUrl(null);
    appUserRepository.save(user);
    redirectAttributes.addFlashAttribute("profileSuccess", "Profile photo removed.");
    return "redirect:/profile";
  }

  @PostMapping("/profile/password")
  String updatePassword(
      Principal principal,
      @RequestParam("currentPassword") String currentPassword,
      @RequestParam("newPassword") String newPassword,
      @RequestParam("confirmPassword") String confirmPassword,
      RedirectAttributes redirectAttributes) {
    AppUser user = requireCurrentUser(principal);
    String cur = currentPassword == null ? "" : currentPassword;
    String np = newPassword == null ? "" : newPassword;
    String cp = confirmPassword == null ? "" : confirmPassword;

    if (np.isEmpty() && cp.isEmpty() && cur.isEmpty()) {
      redirectAttributes.addFlashAttribute(
          "passwordError", "Fill in current password and new password twice to change your password.");
      return "redirect:/profile";
    }
    if (cur.isEmpty()) {
      redirectAttributes.addFlashAttribute("passwordError", "Enter your current password.");
      return "redirect:/profile";
    }
    if (!passwordEncoder.matches(cur, user.getPasswordHash())) {
      redirectAttributes.addFlashAttribute("passwordError", "Current password is incorrect.");
      return "redirect:/profile";
    }
    if (np.length() < 8 || np.length() > 72) {
      redirectAttributes.addFlashAttribute("passwordError", "New password must be 8–72 characters.");
      return "redirect:/profile";
    }
    if (!np.equals(cp)) {
      redirectAttributes.addFlashAttribute("passwordError", "New password and confirmation do not match.");
      return "redirect:/profile";
    }

    user.setPasswordHash(bcryptPasswordEncoder.encode(np));
    appUserRepository.save(user);

    refreshAuthentication(user.getEmail().trim().toLowerCase());

    redirectAttributes.addFlashAttribute("passwordSuccess", "Password updated.");
    return "redirect:/profile";
  }

  private void refreshAuthentication(String email) {
    UserDetails details = userDetailsService.loadUserByUsername(email);
    UsernamePasswordAuthenticationToken auth =
        new UsernamePasswordAuthenticationToken(details, null, details.getAuthorities());
    Authentication existing = SecurityContextHolder.getContext().getAuthentication();
    if (existing != null) {
      auth.setDetails(existing.getDetails());
    }
    SecurityContextHolder.getContext().setAuthentication(auth);
  }

  private static String usernameForDisplay(AppUser user) {
    if (user == null || user.getEmail() == null) {
      return "";
    }
    String email = user.getEmail().trim().toLowerCase();
    if (isAgentAccount(user)) {
      return localPartFromEmail(email);
    }
    if (email.endsWith("@local")) {
      return email.substring(0, email.length() - "@local".length());
    }
    int at = email.indexOf('@');
    if (at > 0) {
      return email.substring(0, at);
    }
    return email;
  }

  private static String localPartFromEmail(String email) {
    if (email == null) {
      return "";
    }
    String e = email.trim().toLowerCase();
    int at = e.indexOf('@');
    if (at > 0) {
      return e.substring(0, at);
    }
    return e;
  }

  private static String emailDomain(AppUser user) {
    if (user.getEmailDomain() == null || user.getEmailDomain().isBlank()) {
      return STAFF_EMAIL_DOMAIN;
    }
    return user.getEmailDomain().trim().toLowerCase();
  }

  private static boolean isAgentAccount(AppUser user) {
    return user != null && "AGENT".equalsIgnoreCase(user.getRole());
  }

  private static String emptyToNull(String value) {
    return value == null || value.isBlank() ? null : value;
  }

  private static String initialsFromName(String name) {
    if (name == null || name.isBlank()) {
      return "U";
    }
    String[] parts = name.trim().split("\\s+");
    if (parts.length >= 2 && !parts[0].isEmpty() && !parts[1].isEmpty()) {
      return ("" + Character.toUpperCase(parts[0].charAt(0))
              + Character.toUpperCase(parts[1].charAt(0)));
    }
    return Character.toUpperCase(name.trim().charAt(0)) + "";
  }

  private AppUser requireCurrentUser(Principal principal) {
    if (principal == null || principal.getName() == null) {
      throw new IllegalStateException("No authenticated user.");
    }
    String email = principal.getName().trim().toLowerCase();
    return appUserRepository
        .findByEmailIgnoreCase(email)
        .orElseThrow(() -> new IllegalStateException("User not found in database."));
  }
}
