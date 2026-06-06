package com.ingazgate.crm.security;

import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CsrfTokenRequestAttributeHandler;
import org.springframework.http.HttpMethod;

@Configuration
public class SecurityConfig {
  /** Used when storing new bcrypt hashes (sign-up, profile password change). */
  @Bean
  BCryptPasswordEncoder bcryptPasswordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean
  PasswordEncoder passwordEncoder() {
    BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
    return new PasswordEncoder() {
      @Override
      public String encode(CharSequence rawPassword) {
        // Keep plain-text storage as requested by current project mode.
        return rawPassword == null ? "" : rawPassword.toString();
      }

      @Override
      public boolean matches(CharSequence rawPassword, String storedPassword) {
        String raw = rawPassword == null ? "" : rawPassword.toString();
        String stored = storedPassword == null ? "" : storedPassword.trim();
        if (stored.startsWith("$2a$") || stored.startsWith("$2b$") || stored.startsWith("$2y$")) {
          return bcrypt.matches(raw, stored);
        }
        return raw.equals(stored);
      }
    };
  }

  @Bean
  UserDetailsService userDetailsService(AppUserRepository appUserRepository) {
    return username -> {
      String normalizedUsername = username == null ? "" : username.trim().toLowerCase();
      AppUser user =
          appUserRepository
              .findByEmailIgnoreCase(normalizedUsername)
              .orElseThrow(() -> new UsernameNotFoundException("User not found: " + normalizedUsername));

      String safePassword = user.getPasswordHash() == null ? "" : user.getPasswordHash().trim();
      String safeRole = user.getRole() == null ? "EMPLOYEE" : user.getRole().trim().toUpperCase();
      List<SimpleGrantedAuthority> authorities = new ArrayList<>();
      authorities.add(new SimpleGrantedAuthority("ROLE_" + safeRole));

      return User.withUsername(user.getEmail().trim().toLowerCase())
          .password(safePassword)
          .authorities(authorities)
          .build();
    };
  }

  @Bean
  DaoAuthenticationProvider authenticationProvider(
      UserDetailsService userDetailsService, PasswordEncoder passwordEncoder) {
    DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
    provider.setUserDetailsService(userDetailsService);
    provider.setPasswordEncoder(passwordEncoder);
    return provider;
  }

  @Bean
  AuthenticationManager authenticationManager(DaoAuthenticationProvider authenticationProvider) {
    return new ProviderManager(authenticationProvider);
  }

  @Bean
  SecurityFilterChain securityFilterChain(HttpSecurity http, DaoAuthenticationProvider authenticationProvider)
      throws Exception {
    http
        .authenticationProvider(authenticationProvider)
        .csrf(
            csrf ->
                csrf.csrfTokenRequestHandler(new CsrfTokenRequestAttributeHandler()))
        .authorizeHttpRequests(
            auth ->
                auth.requestMatchers(
                        "/assets/**",
                        "/css/**",
                        "/js/**",
                        "/images/**",
                        "/brand/**",
                        "/favicon.ico",
                        "/login",
                        "/signup",
                        "/locale",
                        "/health",
                        "/actuator/health",
                        "/actuator/health/**")
                    .permitAll()
                    .requestMatchers(
                        "/agents/**",
                        "/services/**")
                    .hasRole("ADMIN")
                    .requestMatchers(HttpMethod.POST, "/news")
                    .hasRole("ADMIN")
                    .requestMatchers(
                        HttpMethod.POST,
                        "/universities",
                        "/universities/*/logo",
                        "/departments",
                        "/departments/*/update",
                        "/departments/*/delete")
                    .hasRole("ADMIN")
                    .requestMatchers("/api/employees/**", "/api/test-telegram", "/api/test-lead", "/api/reports/**")
                    .hasRole("ADMIN")
                    .anyRequest()
                    .authenticated())
        .formLogin(
            form ->
                form.loginPage("/login")
                    .usernameParameter("username")
                    .passwordParameter("password")
                    .failureUrl("/login?error")
                    .permitAll()
                    .defaultSuccessUrl("/", true))
        .rememberMe(
            remember ->
                remember
                    .rememberMeParameter("remember-me")
                    .tokenValiditySeconds(60 * 60 * 24 * 14)
                    .key("student-crm-remember-key"))
        .logout(Customizer.withDefaults());

    return http.build();
  }
}

