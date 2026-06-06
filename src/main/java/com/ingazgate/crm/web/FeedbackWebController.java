package com.ingazgate.crm.web;

import com.ingazgate.crm.feedback.Complaint;
import com.ingazgate.crm.feedback.ComplaintComment;
import com.ingazgate.crm.feedback.ComplaintCommentRepository;
import com.ingazgate.crm.feedback.ComplaintRepository;
import com.ingazgate.crm.feedback.NewsComment;
import com.ingazgate.crm.feedback.NewsCommentRepository;
import com.ingazgate.crm.feedback.NewsPost;
import com.ingazgate.crm.feedback.NewsPostRepository;
import com.ingazgate.crm.user.AdminNotificationService;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import com.ingazgate.crm.user.WorkspaceOwnershipService;
import java.security.Principal;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FeedbackWebController {
  private final AuthUsers authUsers;
  private final AppUserRepository appUserRepository;
  private final NewsPostRepository newsPostRepository;
  private final NewsCommentRepository newsCommentRepository;
  private final ComplaintRepository complaintRepository;
  private final ComplaintCommentRepository complaintCommentRepository;
  private final AdminNotificationService adminNotificationService;
  private final WorkspaceOwnershipService workspaceOwnershipService;

  public FeedbackWebController(
      AuthUsers authUsers,
      AppUserRepository appUserRepository,
      NewsPostRepository newsPostRepository,
      NewsCommentRepository newsCommentRepository,
      ComplaintRepository complaintRepository,
      ComplaintCommentRepository complaintCommentRepository,
      AdminNotificationService adminNotificationService,
      WorkspaceOwnershipService workspaceOwnershipService) {
    this.authUsers = authUsers;
    this.appUserRepository = appUserRepository;
    this.newsPostRepository = newsPostRepository;
    this.newsCommentRepository = newsCommentRepository;
    this.complaintRepository = complaintRepository;
    this.complaintCommentRepository = complaintCommentRepository;
    this.adminNotificationService = adminNotificationService;
    this.workspaceOwnershipService = workspaceOwnershipService;
  }

  @GetMapping("/news")
  String newsList(Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    model.addAttribute("pageTitleKey", "page.news.title");
    model.addAttribute("activeNav", "news");
    model.addAttribute("contentTemplate", "pages/news");
    model.addAttribute("newsPosts", newsPostRepository.findAllWithAuthor());
    return "layout/shell";
  }

  @GetMapping("/news/{id}")
  String newsDetail(@PathVariable UUID id, Model model) {
    NewsPost post =
        newsPostRepository
            .findByIdWithAuthor(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    model.addAttribute("pageTitle", post.getTitle());
    model.addAttribute("activeNav", "news");
    model.addAttribute("contentTemplate", "pages/news-detail");
    model.addAttribute("newsPost", post);
    model.addAttribute("newsComments", newsCommentRepository.findForPostWithAuthor(id));
    return "layout/shell";
  }

  @PostMapping("/news")
  String createNews(
      Principal principal,
      @RequestParam("title") String title,
      @RequestParam(value = "body", required = false) String body,
      RedirectAttributes redirectAttributes) {
    authUsers.requireAgentManager(principal);
    String t = trim(title);
    if (t.isEmpty()) {
      redirectAttributes.addFlashAttribute("newsErrorKey", "news.flash.titleRequired");
      return "redirect:/news";
    }
    AppUser author = authUsers.requireCurrentUser(principal);
    OffsetDateTime now = OffsetDateTime.now();
    NewsPost post = new NewsPost();
    post.setId(UUID.randomUUID());
    post.setAuthor(appUserRepository.getReferenceById(author.getId()));
    post.setTitle(t);
    post.setBody(emptyToNull(trim(body)));
    post.setPublished(true);
    post.setCreatedAt(now);
    post.setUpdatedAt(now);
    newsPostRepository.save(post);
    redirectAttributes.addFlashAttribute("newsSuccessKey", "news.flash.created");
    return "redirect:/news/" + post.getId();
  }

  @PostMapping("/news/{id}/comments")
  String addNewsComment(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam("body") String body,
      RedirectAttributes redirectAttributes) {
    NewsPost post =
        newsPostRepository
            .findById(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    String text = trim(body);
    if (text.isEmpty()) {
      redirectAttributes.addFlashAttribute("newsErrorKey", "news.flash.commentRequired");
      return "redirect:/news/" + id;
    }
    AppUser author = authUsers.requireCurrentUser(principal);
    NewsComment comment = new NewsComment();
    comment.setId(UUID.randomUUID());
    comment.setPost(post);
    comment.setAuthor(appUserRepository.getReferenceById(author.getId()));
    comment.setBody(text);
    comment.setCreatedAt(OffsetDateTime.now());
    newsCommentRepository.save(comment);
    if (workspaceOwnershipService.isAgent(author)) {
      adminNotificationService.notifyIngazgateAdmins(
          author.getDisplayName() + " commented on news.",
          author.getId(),
          "/news/" + id);
    } else if (workspaceOwnershipService.isIngazgateUser(author)) {
      appUserRepository.findAllAgents().stream()
          .filter(a -> a.getId() != null)
          .forEach(
              agent ->
                  adminNotificationService.notifyUser(
                      agent.getId(),
                      "An administrator replied on news.",
                      author.getId(),
                      "/news/" + id));
    }
    redirectAttributes.addFlashAttribute("newsSuccessKey", "news.flash.commentAdded");
    return "redirect:/news/" + id;
  }

  @GetMapping("/complaints")
  String complaintsList(Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    List<Complaint> complaints;
    List<Complaint> allComplaints = complaintRepository.findAllWithAuthor();
    if (authUsers.canManageAgents(user)) {
      complaints = allComplaints;
    } else {
      complaints =
          allComplaints.stream()
              .filter(c -> c.getAuthor() != null && user.getId().equals(c.getAuthor().getId()))
              .toList();
    }
    model.addAttribute("pageTitleKey", "page.complaints.title");
    model.addAttribute("activeNav", "complaints");
    model.addAttribute("contentTemplate", "pages/complaints");
    model.addAttribute("complaints", complaints);
    return "layout/shell";
  }

  @GetMapping("/complaints/{id}")
  String complaintDetail(@PathVariable UUID id, Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    Complaint complaint =
        complaintRepository
            .findByIdWithAuthor(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    if (!authUsers.canManageAgents(user)
        && (complaint.getAuthor() == null || !user.getId().equals(complaint.getAuthor().getId()))) {
      throw new ResponseStatusException(HttpStatus.FORBIDDEN);
    }
    model.addAttribute("pageTitle", complaint.getSubject());
    model.addAttribute("activeNav", "complaints");
    model.addAttribute("contentTemplate", "pages/complaint-detail");
    model.addAttribute("complaint", complaint);
    model.addAttribute("complaintComments", complaintCommentRepository.findForComplaintWithAuthor(id));
    return "layout/shell";
  }

  @PostMapping("/complaints")
  String createComplaint(
      Principal principal,
      @RequestParam("subject") String subject,
      @RequestParam(value = "body", required = false) String body,
      RedirectAttributes redirectAttributes) {
    String s = trim(subject);
    if (s.isEmpty()) {
      redirectAttributes.addFlashAttribute("complaintErrorKey", "complaints.flash.subjectRequired");
      return "redirect:/complaints";
    }
    AppUser author = authUsers.requireCurrentUser(principal);
    OffsetDateTime now = OffsetDateTime.now();
    Complaint row = new Complaint();
    row.setId(UUID.randomUUID());
    row.setAuthor(appUserRepository.getReferenceById(author.getId()));
    row.setSubject(s);
    row.setBody(emptyToNull(trim(body)));
    row.setStatus("OPEN");
    row.setCreatedAt(now);
    row.setUpdatedAt(now);
    complaintRepository.save(row);
    if (workspaceOwnershipService.isAgent(author)) {
      adminNotificationService.notifyIngazgateAdmins(
          author.getDisplayName() + " filed a complaint: " + s + ".",
          author.getId(),
          "/complaints/" + row.getId());
    }
    redirectAttributes.addFlashAttribute("complaintSuccessKey", "complaints.flash.created");
    return "redirect:/complaints/" + row.getId();
  }

  @PostMapping("/complaints/{id}/comments")
  String addComplaintComment(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam("body") String body,
      RedirectAttributes redirectAttributes) {
    Complaint complaint =
        complaintRepository
            .findById(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    AppUser user = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(user)
        && (complaint.getAuthor() == null || !user.getId().equals(complaint.getAuthor().getId()))) {
      throw new ResponseStatusException(HttpStatus.FORBIDDEN);
    }
    String text = trim(body);
    if (text.isEmpty()) {
      redirectAttributes.addFlashAttribute("complaintErrorKey", "complaints.flash.commentRequired");
      return "redirect:/complaints/" + id;
    }
    ComplaintComment comment = new ComplaintComment();
    comment.setId(UUID.randomUUID());
    comment.setComplaint(complaint);
    comment.setAuthor(appUserRepository.getReferenceById(user.getId()));
    comment.setBody(text);
    comment.setCreatedAt(OffsetDateTime.now());
    complaintCommentRepository.save(comment);
    if (workspaceOwnershipService.isIngazgateUser(user)
        && complaint.getAuthor() != null
        && complaint.getAuthor().getId() != null) {
      adminNotificationService.notifyUser(
          complaint.getAuthor().getId(),
          "An administrator replied on your complaint.",
          user.getId(),
          "/complaints/" + id);
    } else if (workspaceOwnershipService.isAgent(user)) {
      adminNotificationService.notifyIngazgateAdmins(
          user.getDisplayName() + " replied on a complaint.",
          user.getId(),
          "/complaints/" + id);
    }
    redirectAttributes.addFlashAttribute("complaintSuccessKey", "complaints.flash.commentAdded");
    return "redirect:/complaints/" + id;
  }

  private static String trim(String value) {
    return value == null ? "" : value.trim();
  }

  private static String emptyToNull(String value) {
    return value == null || value.isEmpty() ? null : value;
  }
}
