package com.ingazgate.crm.web;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class SignupForm {

  @NotBlank(message = "Email is required")
  @Email(message = "Enter a valid email")
  @Size(max = 254)
  private String email = "";

  @NotBlank(message = "Password is required")
  @Size(min = 8, max = 72, message = "Password must be 8–72 characters")
  private String password = "";

  @NotBlank(message = "Name is required")
  @Size(max = 120)
  private String displayName = "";

  @NotBlank(message = "Please re-enter your password")
  @Size(min = 8, max = 72, message = "Password must be 8–72 characters")
  private String confirmPassword = "";

  @AssertTrue(message = "Passwords must match")
  public boolean isPasswordMatching() {
    if (password == null || confirmPassword == null) {
      return true;
    }
    return password.equals(confirmPassword);
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getDisplayName() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }

  public String getConfirmPassword() {
    return confirmPassword;
  }

  public void setConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
  }
}
