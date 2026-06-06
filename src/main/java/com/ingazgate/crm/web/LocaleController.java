package com.ingazgate.crm.web;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URI;
import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

@Controller
public class LocaleController {

  private final LocaleResolver localeResolver;

  public LocaleController(LocaleResolver localeResolver) {
    this.localeResolver = localeResolver;
  }

  @GetMapping("/locale")
  public String switchLocale(
      @RequestParam("lang") String lang,
      HttpServletRequest request,
      HttpServletResponse response) {
    Locale locale =
        switch (lang == null ? "" : lang.trim().toLowerCase()) {
          case "ar" -> Locale.forLanguageTag("ar");
          default -> Locale.ENGLISH;
        };
    localeResolver.setLocale(request, response, locale);

    String referer = request.getHeader("Referer");
    if (referer != null && isSameSite(referer, request)) {
      return "redirect:" + referer;
    }
    return "redirect:/";
  }

  private static boolean isSameSite(String referer, HttpServletRequest request) {
    try {
      URI uri = URI.create(referer);
      String host = uri.getHost();
      if (host == null) {
        return false;
      }
      String scheme = uri.getScheme();
      if (scheme == null
          || !(scheme.equalsIgnoreCase("http") || scheme.equalsIgnoreCase("https"))) {
        return false;
      }
      return host.equalsIgnoreCase(request.getServerName());
    } catch (IllegalArgumentException e) {
      return false;
    }
  }
}
