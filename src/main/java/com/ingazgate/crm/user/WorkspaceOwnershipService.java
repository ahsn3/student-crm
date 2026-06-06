package com.ingazgate.crm.user;

import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;

@Service
public class WorkspaceOwnershipService {
  static final String STAFF_OWNER_JPQL =
      "upper(coalesce(o.role, '')) = 'ADMIN' or upper(coalesce(o.role, '')) = 'EMPLOYEE'";

  private final AppUserRepository appUserRepository;

  public WorkspaceOwnershipService(AppUserRepository appUserRepository) {
    this.appUserRepository = appUserRepository;
  }

  /**
   * User id stored on students/applications/services as {@code owner_user_id}.
   * Agents own their own rows; staff share the canonical admin workspace id.
   */
  public UUID dataOwnerId(AppUser currentUser) {
    if (currentUser == null || currentUser.getId() == null) {
      throw new IllegalStateException("Current user is required.");
    }
    if (isAgent(currentUser)) {
      return currentUser.getId();
    }
    if (isStaffUser(currentUser)) {
      UUID workspaceOwner = staffWorkspaceOwnerId(currentUser);
      if (workspaceOwner != null) {
        return workspaceOwner;
      }
    }
    return currentUser.getId();
  }

  /** @deprecated Use {@link #dataOwnerId}; kept for existing call sites. */
  public UUID workspaceOwnerId(AppUser currentUser) {
    return dataOwnerId(currentUser);
  }

  /** Canonical staff workspace owner id; never throws. */
  public UUID staffWorkspaceOwnerId(AppUser currentUser) {
    List<AppUser> admins = appUserRepository.findStaffAdmins();
    if (!admins.isEmpty() && admins.get(0).getId() != null) {
      return admins.get(0).getId();
    }
    if (currentUser != null && currentUser.getId() != null) {
      return currentUser.getId();
    }
    return null;
  }

  /** @deprecated Use {@link #staffWorkspaceOwnerId}. */
  public UUID ingazgateWorkspaceOwnerId(AppUser currentUser) {
    return staffWorkspaceOwnerId(currentUser);
  }

  public boolean isAgent(AppUser user) {
    return user != null && "AGENT".equalsIgnoreCase(user.getRole());
  }

  public boolean isStaffUser(AppUser user) {
    if (user == null) {
      return false;
    }
    String role = user.getRole();
    if (role == null) {
      return false;
    }
    String normalized = role.trim().toUpperCase();
    return "ADMIN".equals(normalized) || "EMPLOYEE".equals(normalized);
  }

  /** @deprecated Use {@link #isStaffUser}. */
  public boolean isIngazgateUser(AppUser user) {
    return isStaffUser(user);
  }

  /** Staff admin may view data owned by the staff workspace or by any agent account. */
  public boolean canStaffAdminViewOwner(AppUser dataOwner) {
    if (dataOwner == null || dataOwner.getId() == null) {
      return false;
    }
    if (isStaffUser(dataOwner)) {
      return true;
    }
    return isAgent(dataOwner);
  }

  /** @deprecated Use {@link #canStaffAdminViewOwner}. */
  public boolean canIngazgateAdminViewOwner(AppUser dataOwner) {
    return canStaffAdminViewOwner(dataOwner);
  }
}
