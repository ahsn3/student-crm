(() => {
  document.addEventListener("DOMContentLoaded", () => {
    const page = document.getElementById("notificationsPage");
    if (!page) {
      return;
    }

    const csrf = document.querySelector('meta[name="csrf-token"]')?.getAttribute("content");
    const csrfHeader = document.querySelector('meta[name="csrf-header"]')?.getAttribute("content");
    const authHeaders = () => {
      const h = { Accept: "application/json" };
      if (csrf && csrfHeader) {
        h[csrfHeader] = csrf;
      }
      return h;
    };

    const fmtRelative = (iso) => {
      if (!iso) {
        return "";
      }
      const d = new Date(iso);
      if (Number.isNaN(d.getTime())) {
        return "";
      }
      const diffSec = Math.round((d.getTime() - Date.now()) / 1000);
      const abs = Math.abs(diffSec);
      const rtf = new Intl.RelativeTimeFormat(document.documentElement.lang || "en", {
        numeric: "auto",
      });
      if (abs < 60) {
        return rtf.format(diffSec, "second");
      }
      if (abs < 3600) {
        return rtf.format(Math.round(diffSec / 60), "minute");
      }
      if (abs < 86400) {
        return rtf.format(Math.round(diffSec / 3600), "hour");
      }
      return rtf.format(Math.round(diffSec / 86400), "day");
    };

    document.querySelectorAll(".notification-page-relative[data-created-at]").forEach((el) => {
      const iso = el.getAttribute("data-created-at");
      const rel = fmtRelative(iso);
      if (rel) {
        el.textContent = ` — ${rel}`;
      }
    });

    const activateItem = async (item) => {
      const id = item.getAttribute("data-notification-id");
      const url = item.getAttribute("data-link-url") || "";
      if (id) {
        try {
          await fetch(`/api/admin/notifications/${encodeURIComponent(id)}/read`, {
            method: "POST",
            headers: authHeaders(),
          });
        } catch {
          /* ignore */
        }
      }
      if (url) {
        window.location.href = url;
      }
    };

    page.querySelectorAll(".notification-page-item").forEach((item) => {
      item.setAttribute("tabindex", "0");
      item.setAttribute("role", "button");
      item.addEventListener("click", () => activateItem(item));
      item.addEventListener("keydown", (e) => {
        if (e.key === "Enter" || e.key === " ") {
          e.preventDefault();
          activateItem(item);
        }
      });
    });

    const markAllBtn = document.getElementById("notificationsMarkAllRead");
    markAllBtn?.addEventListener("click", async () => {
      markAllBtn.disabled = true;
      try {
        const r = await fetch("/api/admin/notifications/read-all", {
          method: "POST",
          headers: authHeaders(),
        });
        if (r.ok) {
          window.location.reload();
          return;
        }
        markAllBtn.disabled = false;
      } catch {
        markAllBtn.disabled = false;
      }
    });
  });
})();
