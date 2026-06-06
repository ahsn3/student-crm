package com.ingazgate.crm.web;

import com.ingazgate.crm.feedback.ComplaintCommentRepository;
import com.ingazgate.crm.feedback.ComplaintRepository;
import com.ingazgate.crm.feedback.NewsCommentRepository;
import com.ingazgate.crm.user.AdminNotificationRepository;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.NavSectionSeenService;
import com.ingazgate.crm.user.WorkspaceOwnershipService;
import java.time.OffsetDateTime;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NavBadgeService {
  private static final Logger log = LoggerFactory.getLogger(NavBadgeService.class);

  private final AuthUsers authUsers;
  private final WorkspaceOwnershipService workspaceOwnershipService;
  private final AdminNotificationRepository adminNotificationRepository;
  private final NewsCommentRepository newsCommentRepository;
  private final ComplaintRepository complaintRepository;
  private final ComplaintCommentRepository complaintCommentRepository;
  private final NavSectionSeenService navSectionSeenService;

  public NavBadgeService(
      AuthUsers authUsers,
      WorkspaceOwnershipService workspaceOwnershipService,
      AdminNotificationRepository adminNotificationRepository,
      NewsCommentRepository newsCommentRepository,
      ComplaintRepository complaintRepository,
      ComplaintCommentRepository complaintCommentRepository,
      NavSectionSeenService navSectionSeenService) {
    this.authUsers = authUsers;
    this.workspaceOwnershipService = workspaceOwnershipService;
    this.adminNotificationRepository = adminNotificationRepository;
    this.newsCommentRepository = newsCommentRepository;
    this.complaintRepository = complaintRepository;
    this.complaintCommentRepository = complaintCommentRepository;
    this.navSectionSeenService = navSectionSeenService;
  }

  /** Sidebar indicators disabled — always empty so list pages never run badge queries. */
  @Transactional(readOnly = true)
  public NavSidebarBadges badgesFor(AppUser user) {
    return NavSidebarBadges.empty();
  }
}
