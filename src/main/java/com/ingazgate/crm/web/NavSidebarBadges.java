package com.ingazgate.crm.web;

/** Unread / new-action counts for sidebar navigation (0 = hide badge). */
public class NavSidebarBadges {
  private final long students;
  private final long applications;
  private final long agents;
  private final long news;
  private final long complaints;

  public NavSidebarBadges(long students, long applications, long agents, long news, long complaints) {
    this.students = students;
    this.applications = applications;
    this.agents = agents;
    this.news = news;
    this.complaints = complaints;
  }

  public static NavSidebarBadges empty() {
    return new NavSidebarBadges(0, 0, 0, 0, 0);
  }

  public long getStudents() {
    return students;
  }

  public long getApplications() {
    return applications;
  }

  public long getAgents() {
    return agents;
  }

  public long getNews() {
    return news;
  }

  public long getComplaints() {
    return complaints;
  }

  public String label(long value) {
    if (value <= 0) {
      return "";
    }
    return value > 99 ? "99+" : String.valueOf(value);
  }
}
