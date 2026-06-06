package com.ingazgate.crm.web;

import com.ingazgate.crm.user.UserRegistrationService;
import jakarta.validation.Valid;
import java.util.Locale;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {
  private final UserRegistrationService registrationService;
  private final MessageSource messageSource;

  public AuthController(UserRegistrationService registrationService, MessageSource messageSource) {
    this.registrationService = registrationService;
    this.messageSource = messageSource;
  }

  @GetMapping("/login")
  String login(Model model) {
    model.addAttribute("pageTitleKey", "page.login.title");
    return "auth/login";
  }

  @GetMapping("/signup")
  String signupForm(Model model) {
    model.addAttribute("pageTitleKey", "page.signup.title");
    if (!model.containsAttribute("signupForm")) {
      model.addAttribute("signupForm", new SignupForm());
    }
    return "auth/signup";
  }

  @PostMapping("/signup")
  String signup(
      @Valid @ModelAttribute("signupForm") SignupForm form,
      BindingResult binding,
      Model model,
      RedirectAttributes redirectAttributes) {
    model.addAttribute("pageTitleKey", "page.signup.title");
    Locale locale = LocaleContextHolder.getLocale();
    if (binding.hasErrors()) {
      form.setPassword("");
      form.setConfirmPassword("");
      return "auth/signup";
    }
    boolean ok =
        registrationService.registerIfAvailable(
            form.getEmail(), form.getPassword(), form.getDisplayName());
    if (!ok) {
      form.setPassword("");
      form.setConfirmPassword("");
      binding.rejectValue("email", "email.taken");
      return "auth/signup";
    }
    redirectAttributes.addFlashAttribute(
        "success", messageSource.getMessage("auth.flash.accountCreated", null, locale));
    return "redirect:/login";
  }
}
