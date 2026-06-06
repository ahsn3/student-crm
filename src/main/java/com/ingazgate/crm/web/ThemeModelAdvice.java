package com.ingazgate.crm.web;

import com.ingazgate.crm.theme.ThemeRamaService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class ThemeModelAdvice {
  private final ThemeRamaService themeRamaService;

  public ThemeModelAdvice(ThemeRamaService themeRamaService) {
    this.themeRamaService = themeRamaService;
  }

  @ModelAttribute("ramaThemeEligible")
  boolean ramaThemeEligible() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    if (auth == null
        || !auth.isAuthenticated()
        || auth.getName() == null
        || "anonymousUser".equals(auth.getPrincipal())) {
      return false;
    }
    return themeRamaService.isRamaUser(auth.getName());
  }
}
