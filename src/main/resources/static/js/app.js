/* Clear legacy page-transition state (was leaving content invisible). */
(() => {
  try {
    sessionStorage.removeItem("ingaz-page-transition");
  } catch {
    /* ignore */
  }
  document.documentElement?.classList.remove("page-transition-pending");
  document.body?.classList.remove("page-leaving-left", "page-enter-from-right");
})();

(() => {
  const markReady = () => {
    if (!document.body) return;
    if (document.body.classList.contains("is-ready")) return;
    window.requestAnimationFrame(() => {
      document.body.classList.add("is-ready");
    });
  };
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", markReady, { once: true });
  } else {
    markReady();
  }
  // BFCache restores can skip DOMContentLoaded on some browsers.
  window.addEventListener("pageshow", markReady);
})();

(() => {
  const sidebar = document.getElementById("sidebar");
  const overlay = document.getElementById("mobileOverlay");
  const hamburger = document.getElementById("hamburgerBtn");

  if (!sidebar || !overlay || !hamburger) {
    return;
  }

  const syncChrome = () => window.ingazgateTheme?.updateChromeColor?.();

  const closeSidebar = () => {
    sidebar.classList.remove("open");
    overlay.classList.remove("show");
    document.body.classList.remove("nav-open");
    syncChrome();
  };

  const openSidebar = () => {
    sidebar.classList.add("open");
    overlay.classList.add("show");
    document.body.classList.add("nav-open");
    syncChrome();
  };

  hamburger.addEventListener("click", () => {
    if (sidebar.classList.contains("open")) {
      closeSidebar();
      return;
    }
    openSidebar();
  });

  overlay.addEventListener("click", closeSidebar);

  sidebar.querySelectorAll(".sidebar-nav a[href]").forEach((link) => {
    link.addEventListener("click", () => {
      if (window.innerWidth <= 980) {
        closeSidebar();
      }
    });
  });

  window.addEventListener("resize", () => {
    if (window.innerWidth > 980) {
      closeSidebar();
    }
  });
})();

(() => {
  const toggle = document.getElementById("topbarSearchToggle");
  const slot = document.getElementById("topbarSearchSlot");
  const panel = document.getElementById("topbarSearchPanel");
  const input = document.getElementById("topbarSearchInput");
  if (!toggle || !slot || !panel || !input) {
    return;
  }

  let backdrop = document.getElementById("topbarSearchBackdrop");
  if (!backdrop) {
    backdrop = document.createElement("div");
    backdrop.id = "topbarSearchBackdrop";
    backdrop.className = "topbar-search-backdrop";
    backdrop.setAttribute("aria-hidden", "true");
    document.body.appendChild(backdrop);
  }

  const media = window.matchMedia("(max-width: 980px)");

  const close = () => {
    slot.classList.remove("topbar-search-slot--open");
    toggle.setAttribute("aria-expanded", "false");
    backdrop.classList.remove("is-visible");
    document.body.classList.remove("topbar-search-open");
  };

  const open = () => {
    if (!media.matches) {
      return;
    }
    slot.classList.add("topbar-search-slot--open");
    toggle.setAttribute("aria-expanded", "true");
    backdrop.classList.add("is-visible");
    document.body.classList.add("topbar-search-open");
    input.focus();
  };

  toggle.addEventListener("click", (e) => {
    e.stopPropagation();
    if (!media.matches) {
      return;
    }
    if (slot.classList.contains("topbar-search-slot--open")) {
      close();
    } else {
      open();
    }
  });

  backdrop.addEventListener("click", close);

  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && slot.classList.contains("topbar-search-slot--open")) {
      close();
    }
  });

  media.addEventListener("change", () => {
    close();
  });
})();

(() => {
  const slot = document.getElementById("topbarSearchSlot");
  const input = document.getElementById("topbarSearchInput");
  const results = document.getElementById("topbarSearchResults");
  if (!slot || !input || !results) {
    return;
  }

  const emptyMsg = slot.dataset.msgSearchEmpty || "Type to search…";
  const noResultsMsg = slot.dataset.msgSearchNoResults || "No results found.";
  let debounceTimer = 0;
  let searchSeq = 0;
  let activeIdx = -1;

  const esc = (s) =>
    String(s || "")
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/"/g, "&quot;");

  const setOpen = (open) => {
    input.setAttribute("aria-expanded", open ? "true" : "false");
    results.hidden = !open;
  };

  const closeResults = () => {
    setOpen(false);
    activeIdx = -1;
    results.querySelectorAll(".topbar-search-hit").forEach((el) => {
      el.classList.remove("is-active");
    });
  };

  const renderResults = (items) => {
    if (!items.length) {
      results.innerHTML = `<p class="topbar-search-results-empty subtle">${esc(noResultsMsg)}</p>`;
      setOpen(true);
      return;
    }
    results.innerHTML = items
      .map(
        (it, idx) => `<a class="topbar-search-hit" role="option" href="${esc(it.url)}" data-idx="${idx}">
          <span class="topbar-search-hit-type topbar-search-hit-type--${esc(it.type)}">${esc(it.typeLabel)}</span>
          <span class="topbar-search-hit-body">
            <span class="topbar-search-hit-title">${esc(it.title)}</span>
            ${it.subtitle ? `<span class="topbar-search-hit-sub subtle">${esc(it.subtitle)}</span>` : ""}
          </span>
        </a>`
      )
      .join("");
    setOpen(true);
    activeIdx = -1;
  };

  const runSearch = async () => {
    const q = (input.value || "").trim();
    if (q.length < 2) {
      results.innerHTML = `<p class="topbar-search-results-empty subtle">${esc(emptyMsg)}</p>`;
      setOpen(q.length > 0);
      return;
    }
    const seq = ++searchSeq;
    try {
      const r = await fetch(`/api/search?q=${encodeURIComponent(q)}`, {
        headers: { Accept: "application/json" },
      });
      if (seq !== searchSeq || !r.ok) {
        return;
      }
      const data = await r.json();
      if (seq !== searchSeq) {
        return;
      }
      renderResults(Array.isArray(data.items) ? data.items : []);
    } catch {
      /* ignore */
    }
  };

  input.addEventListener("input", () => {
    window.clearTimeout(debounceTimer);
    debounceTimer = window.setTimeout(runSearch, 220);
  });

  input.addEventListener("focus", () => {
    const q = (input.value || "").trim();
    if (q.length >= 2) {
      runSearch();
    } else if (q.length > 0) {
      results.innerHTML = `<p class="topbar-search-results-empty subtle">${esc(emptyMsg)}</p>`;
      setOpen(true);
    }
  });

  input.addEventListener("keydown", (e) => {
    const hits = [...results.querySelectorAll(".topbar-search-hit")];
    if (!hits.length) {
      return;
    }
    if (e.key === "ArrowDown") {
      e.preventDefault();
      activeIdx = Math.min(activeIdx + 1, hits.length - 1);
    } else if (e.key === "ArrowUp") {
      e.preventDefault();
      activeIdx = Math.max(activeIdx - 1, 0);
    } else if (e.key === "Enter" && activeIdx >= 0) {
      e.preventDefault();
      hits[activeIdx].click();
      return;
    } else if (e.key === "Escape") {
      closeResults();
      return;
    } else {
      return;
    }
    hits.forEach((el, i) => el.classList.toggle("is-active", i === activeIdx));
    hits[activeIdx]?.scrollIntoView({ block: "nearest" });
  });

  document.addEventListener("click", (e) => {
    if (!slot.contains(e.target)) {
      closeResults();
    }
  });
})();

(() => {
  const PAGE_SIZE = 20;

  const initUniversitiesPage = () => {
    const root = document.getElementById("universitiesPage");
    if (!root) {
      return;
    }

    const msgPagerNone = root.dataset.msgPagerNone || "";
    const msgPagerRange = root.dataset.msgPagerRange || "";
    const fmtPager = (template, shown, from, to, total) =>
      String(template)
        .replace(/\{0\}/g, String(shown))
        .replace(/\{1\}/g, String(from))
        .replace(/\{2\}/g, String(to))
        .replace(/\{3\}/g, String(total));

    const searchInput = document.getElementById("uniSearch");
    const countrySelect = document.getElementById("uniCountryFilter");
    const tbody = document.getElementById("uniTbody");
    const noResults = document.getElementById("uniNoResults");
    const emptyRow = document.getElementById("uniEmptyRow");
    const meta = document.getElementById("uniFooterMeta");
    const pager = document.getElementById("uniPager");
    const modal = document.getElementById("addUniversityModal");
    const openBtn = document.getElementById("openAddUniversityModal");

    const allRows = Array.from(tbody?.querySelectorAll("tr.uni-data-row") || []);
    let currentPage = 1;

    const matchesFilters = (row) => {
      const q = (searchInput?.value || "").trim().toLowerCase();
      const country = (countrySelect?.value || "").trim();
      const hay = (row.dataset.search || "").toLowerCase();
      const rowCountry = (row.dataset.country || "").trim();
      if (q && !hay.includes(q)) {
        return false;
      }
      if (country && rowCountry !== country) {
        return false;
      }
      return true;
    };

    const render = () => {
      const matched = allRows.filter(matchesFilters);
      const total = matched.length;

      allRows.forEach((row) => {
        row.hidden = true;
      });

      if (total === 0) {
        if (noResults) {
          noResults.hidden = allRows.length === 0;
        }
        if (emptyRow) {
          emptyRow.hidden = allRows.length !== 0;
        }
        if (meta) {
          meta.textContent = msgPagerNone;
        }
        if (pager) {
          pager.innerHTML = "";
        }
        root.classList.add("is-ready");
        return;
      }

      if (noResults) {
        noResults.hidden = true;
      }
      if (emptyRow) {
        emptyRow.hidden = true;
      }

      const pages = Math.max(1, Math.ceil(total / PAGE_SIZE));
      if (currentPage > pages) {
        currentPage = pages;
      }
      const fromIdx = (currentPage - 1) * PAGE_SIZE;
      const slice = matched.slice(fromIdx, fromIdx + PAGE_SIZE);
      slice.forEach((row) => {
        row.hidden = false;
      });

      const from = fromIdx + 1;
      const to = fromIdx + slice.length;
      if (meta) {
        meta.textContent = fmtPager(msgPagerRange, slice.length, from, to, total);
      }

      if (pager) {
        pager.innerHTML = "";
        const addNavBtn = (label, targetPage, disabled) => {
          const b = document.createElement("button");
          b.type = "button";
          b.className = "pager-btn";
          b.textContent = label;
          b.disabled = disabled;
          if (!disabled) {
            b.addEventListener("click", () => {
              currentPage = targetPage;
              render();
            });
          }
          return b;
        };
        const visiblePages = (cur, pageCount) => {
          if (pageCount <= 9) {
            return Array.from({ length: pageCount }, (_, i) => i + 1);
          }
          const set = new Set([1, pageCount]);
          for (let d = -2; d <= 2; d++) {
            const p = cur + d;
            if (p >= 1 && p <= pageCount) {
              set.add(p);
            }
          }
          const sorted = [...set].sort((a, b) => a - b);
          const out = [];
          for (let i = 0; i < sorted.length; i++) {
            if (i > 0 && sorted[i] - sorted[i - 1] > 1) {
              out.push("…");
            }
            out.push(sorted[i]);
          }
          return out;
        };
        pager.appendChild(addNavBtn("‹", currentPage - 1, currentPage <= 1));
        for (const item of visiblePages(currentPage, pages)) {
          if (item === "…") {
            const ell = document.createElement("span");
            ell.className = "pager-ellipsis";
            ell.setAttribute("aria-hidden", "true");
            ell.textContent = "…";
            pager.appendChild(ell);
            continue;
          }
          const p = item;
          const b = document.createElement("button");
          b.type = "button";
          b.className = "pager-btn" + (p === currentPage ? " active" : "");
          b.textContent = String(p);
          b.addEventListener("click", () => {
            currentPage = p;
            render();
          });
          pager.appendChild(b);
        }
        pager.appendChild(addNavBtn("›", currentPage + 1, currentPage >= pages));
      }
      root.classList.add("is-ready");
    };

    const debounce = (fn, ms = 200) => {
      let t = 0;
      return (...args) => {
        window.clearTimeout(t);
        t = window.setTimeout(() => fn(...args), ms);
      };
    };

    searchInput?.addEventListener("input", debounce(() => {
      currentPage = 1;
      render();
    }));
    countrySelect?.addEventListener("change", () => {
      currentPage = 1;
      render();
    });

    const closeModal = () => modal?.classList.remove("is-open");
    openBtn?.addEventListener("click", () => modal?.classList.add("is-open"));
    modal?.querySelectorAll("[data-close-modal]").forEach((el) => {
      el.addEventListener("click", closeModal);
    });
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape" && modal?.classList.contains("is-open")) {
        closeModal();
      }
    });

    render();
  };

  document.addEventListener("DOMContentLoaded", initUniversitiesPage);
})();

(() => {
  const initUniversityDetail = () => {
    const root = document.getElementById("universityDetailPage");
    if (!root) {
      return;
    }
    const input = document.getElementById("uniProgramSearch");
    const rows = Array.from(root.querySelectorAll(".uni-program-row"));
    if (!input || rows.length === 0) {
      return;
    }
    const apply = () => {
      const q = input.value.trim().toLowerCase();
      rows.forEach((row) => {
        const hay = (row.dataset.search || "").toLowerCase();
        row.style.display = !q || hay.includes(q) ? "" : "none";
      });
    };
    input.addEventListener("input", apply);
  };

  document.addEventListener("DOMContentLoaded", initUniversityDetail);
})();

(() => {
  document.addEventListener("DOMContentLoaded", () => {
    const btn = document.getElementById("notificationBtn");
    const panel = document.getElementById("notificationPanel");
    if (!btn || !panel) {
      return;
    }

    const wrap = btn.closest(".notifications-wrap");
    const live = wrap?.dataset?.notificationsLive === "true";
    const listHost = document.getElementById("notificationListHost");
    const badge = document.getElementById("notificationUnreadBadge");
    const clearAllBtn = document.getElementById("notificationClearAll");
    const showAllBtn = document.getElementById("notificationShowAll");
    const csrf = document.querySelector('meta[name="csrf-token"]')?.getAttribute("content");
    const csrfHeader = document.querySelector('meta[name="csrf-header"]')?.getAttribute("content");
    const emptyMsg = wrap?.dataset?.msgEmpty || "";
    const dismissLabel = wrap?.dataset?.msgDismiss || "Remove";
    const userId = (wrap?.dataset?.userId || "").trim();
    const dismissedKey = userId
      ? `ingazgate.notificationDismissed.${userId}`
      : "ingazgate.notificationDismissed";

    const open = () => {
      window.ingazgateTheme?.closeThemeMenus?.();
      panel.hidden = false;
      btn.setAttribute("aria-expanded", "true");
    };

    const close = () => {
      panel.hidden = true;
      btn.setAttribute("aria-expanded", "false");
    };

    const isOpen = () => !panel.hidden;

    if (window.ingazgateTheme) {
      window.ingazgateTheme.closeNotifications = close;
    }

    btn.addEventListener("click", (e) => {
      e.stopPropagation();
      if (isOpen()) {
        close();
      } else {
        open();
      }
    });

    document.addEventListener("click", (e) => {
      if (!isOpen() || !wrap) {
        return;
      }
      if (!wrap.contains(e.target)) {
        close();
      }
    });

    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape" && isOpen()) {
        close();
      }
    });

    if (!live || !listHost) {
      return;
    }

    const authHeaders = () => {
      const h = { Accept: "application/json" };
      if (csrf && csrfHeader) {
        h[csrfHeader] = csrf;
      }
      return h;
    };

    const getDismissed = () => {
      try {
        const raw = localStorage.getItem(dismissedKey);
        const parsed = raw ? JSON.parse(raw) : [];
        return Array.isArray(parsed) ? new Set(parsed.map(String)) : new Set();
      } catch {
        return new Set();
      }
    };

    const saveDismissed = (set) => {
      try {
        localStorage.setItem(dismissedKey, JSON.stringify([...set]));
      } catch {
        /* ignore */
      }
    };

    let dismissed = getDismissed();
    let lastItems = [];

    const fmtTime = (iso) => {
      if (!iso) {
        return "";
      }
      const d = new Date(iso);
      if (Number.isNaN(d.getTime())) {
        return iso;
      }
      const parts = new Intl.DateTimeFormat("en-GB", {
        timeZone: "Europe/Istanbul",
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
        hour12: false,
      }).formatToParts(d);
      const pick = (t) => parts.find((p) => p.type === t)?.value || "";
      return `${pick("year")}-${pick("month")}-${pick("day")} ${pick("hour")}:${pick("minute")}`;
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

    const esc = (s) =>
      String(s || "")
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/"/g, "&quot;");

    const setBadge = (n) => {
      if (!badge) {
        return;
      }
      const v = Number(n) || 0;
      badge.textContent = v > 99 ? "99+" : String(v);
      badge.classList.toggle("notification-badge--visible", v > 0);
    };

    const tagForLink = (link) => {
      if (!link) {
        return "";
      }
      if (link.startsWith("/applications")) {
        return "Applications";
      }
      if (link.startsWith("/students")) {
        return "Students";
      }
      if (link.startsWith("/news") || link.startsWith("/complaints")) {
        return "Updates";
      }
      return "";
    };

    const visibleItems = () => lastItems.filter((it) => !dismissed.has(String(it.id || "")));

    const handleNotificationCardActivate = async (card) => {
      const id = card.getAttribute("data-notification-id");
      const url = card.getAttribute("data-link-url") || "";
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
      } else {
        close();
        fetchAndRender();
      }
    };

    const renderList = (items) => {
      lastItems = items || [];
      const visible = visibleItems();
      if (!visible.length) {
        listHost.innerHTML = `<p class="subtle notification-panel-empty">${emptyMsg}</p>`;
        return;
      }
      listHost.innerHTML = visible
        .map((it) => {
          const id = it.id || "";
          const link = it.linkUrl || "";
          const unread = it.read === false || it.read === "false";
          const cls = unread
            ? "notification-card notification-card--unread"
            : "notification-card";
          const tag = tagForLink(link);
          const rel = fmtRelative(it.createdAt);
          const timeLine = rel
            ? `${esc(fmtTime(it.createdAt))} — ${esc(rel)}`
            : esc(fmtTime(it.createdAt));
          return `<div class="${cls}">
            <button type="button" class="notification-card-main" data-notification-id="${esc(id)}" data-link-url="${esc(
              link
            )}">
              ${tag ? `<span class="notification-card-tag">${esc(tag)}</span>` : ""}
              <div class="notification-card-message">${esc(it.message)}</div>
              <div class="notification-card-meta subtle">${timeLine}</div>
            </button>
            <button type="button" class="notification-card-dismiss" data-notification-dismiss="${esc(
              id
            )}" aria-label="${esc(dismissLabel)}" title="${esc(dismissLabel)}">
              <svg viewBox="0 0 24 24" width="16" height="16" aria-hidden="true"><path d="M3 6h18M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2m3 0v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6h14Z" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"/><path d="M10 11v6M14 11v6" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"/></svg>
            </button>
          </div>`;
        })
        .join("");
    };

    listHost.addEventListener("click", async (e) => {
      const dismissBtn = e.target.closest("[data-notification-dismiss]");
      if (dismissBtn) {
        e.preventDefault();
        e.stopPropagation();
        const id = dismissBtn.getAttribute("data-notification-dismiss");
        if (id) {
          dismissed.add(String(id));
          saveDismissed(dismissed);
          renderList(lastItems);
        }
        return;
      }
      const card = e.target.closest(".notification-card-main");
      if (!card) {
        return;
      }
      e.preventDefault();
      await handleNotificationCardActivate(card);
    });

    clearAllBtn?.addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();
      visibleItems().forEach((it) => {
        if (it.id) {
          dismissed.add(String(it.id));
        }
      });
      saveDismissed(dismissed);
      renderList(lastItems);
    });

    showAllBtn?.addEventListener("click", () => {
      close();
    });

    const fetchAndRender = async () => {
      try {
        const r = await fetch("/api/admin/notifications", { headers: { Accept: "application/json" } });
        if (!r.ok) {
          return;
        }
        const data = await r.json();
        setBadge(data.unreadCount);
        renderList(data.items || []);
      } catch {
        /* ignore */
      }
    };

    fetchAndRender();
    window.setInterval(() => {
      if (document.visibilityState === "visible") {
        fetchAndRender();
      }
    }, 60000);
  });
})();

(() => {
  const initApplicationsProgramFilter = () => {
    const input = document.getElementById("appProgramFilterInput");
    const hidden = document.getElementById("appProgramFilterId");
    const menu = document.getElementById("appProgramFilterMenu");
    if (!input || !hidden || !menu) {
      return;
    }

    let searchSeq = 0;
    let debounceTimer = 0;

    const closeMenu = () => {
      menu.hidden = true;
      menu.innerHTML = "";
    };

    const pick = (id, label) => {
      hidden.value = id || "";
      input.value = label || "";
      closeMenu();
    };

    const renderOptions = (items) => {
      menu.innerHTML = "";
      if (!items || items.length === 0) {
        closeMenu();
        return;
      }
      items.forEach((p) => {
        const btn = document.createElement("button");
        btn.type = "button";
        btn.className = "app-program-filter-option";
        btn.setAttribute("role", "option");
        const uni = p.universityName || "";
        const name = p.name || "";
        const label = uni && name ? `${uni} — ${name}` : name || uni;
        btn.textContent = label;
        btn.addEventListener("click", () => pick(p.id, label));
        menu.appendChild(btn);
      });
      menu.hidden = false;
    };

    const searchPrograms = async () => {
      const q = input.value.trim();
      if (!q) {
        pick("", "");
        return;
      }
      const seq = ++searchSeq;
      try {
        const res = await fetch(
          `/api/programs/data?search=${encodeURIComponent(q)}&page=1&size=20`,
          { headers: { Accept: "application/json" } }
        );
        if (seq !== searchSeq || !res.ok) {
          return;
        }
        const body = await res.json();
        if (seq !== searchSeq) {
          return;
        }
        renderOptions(Array.isArray(body.items) ? body.items : []);
      } catch {
        closeMenu();
      }
    };

    input.addEventListener("input", () => {
      window.clearTimeout(debounceTimer);
      debounceTimer = window.setTimeout(searchPrograms, 250);
    });

    input.addEventListener("focus", () => {
      if (window.closeAllIngazgateProgUniPickers) {
        window.closeAllIngazgateProgUniPickers();
      }
      if (input.value.trim()) {
        searchPrograms();
      }
    });

    window.addEventListener("ingazgate:close-prog-uni-panels", closeMenu);

    document.addEventListener("mousedown", (e) => {
      if (!e.target.closest(".app-program-filter")) {
        closeMenu();
      }
    });
  };

  document.addEventListener("DOMContentLoaded", initApplicationsProgramFilter);
})();

(() => {
  document.addEventListener("DOMContentLoaded", () => {
    const accountRoot = document.getElementById("sidebarAccount");
    const accountTrigger = document.getElementById("sidebarAccountTrigger");
    const accountMenu = document.getElementById("sidebarAccountMenu");
    const openBtn = document.getElementById("logoutOpenBtn");
    const modal = document.getElementById("logoutConfirmModal");
    const form = document.getElementById("logoutForm");
    const confirmBtn = document.getElementById("logoutConfirmBtn");

    const closeAccountMenu = () => {
      if (!accountRoot || !accountTrigger || !accountMenu) {
        return;
      }
      accountRoot.classList.remove("is-open");
      accountTrigger.setAttribute("aria-expanded", "false");
      accountMenu.setAttribute("aria-hidden", "true");
    };

    const openAccountMenu = () => {
      if (!accountRoot || !accountTrigger || !accountMenu) {
        return;
      }
      accountRoot.classList.add("is-open");
      accountTrigger.setAttribute("aria-expanded", "true");
      accountMenu.setAttribute("aria-hidden", "false");
    };

    const toggleAccountMenu = () => {
      if (!accountRoot?.classList.contains("is-open")) {
        openAccountMenu();
        return;
      }
      closeAccountMenu();
    };

    accountTrigger?.addEventListener("click", (e) => {
      e.stopPropagation();
      toggleAccountMenu();
    });

    accountMenu?.querySelector('a[href*="/profile"]')?.addEventListener("click", () => {
      closeAccountMenu();
      const sidebar = document.getElementById("sidebar");
      const overlay = document.getElementById("mobileOverlay");
      if (sidebar?.classList.contains("open")) {
        sidebar.classList.remove("open");
        overlay?.classList.remove("show");
        document.body.classList.remove("nav-open");
        window.ingazgateTheme?.updateChromeColor?.();
      }
    });

    document.addEventListener("click", (e) => {
      if (!accountRoot?.classList.contains("is-open")) {
        return;
      }
      if (!accountRoot.contains(e.target)) {
        closeAccountMenu();
      }
    });

    if (!openBtn || !modal || !form) {
      return;
    }

    const closeLogoutModal = () => {
      modal.classList.remove("is-open");
    };

    const openLogoutModal = () => {
      closeAccountMenu();
      modal.classList.add("is-open");
    };

    openBtn.addEventListener("click", (e) => {
      e.stopPropagation();
      openLogoutModal();
    });

    modal.querySelectorAll("[data-logout-cancel]").forEach((el) => {
      el.addEventListener("click", closeLogoutModal);
    });

    confirmBtn?.addEventListener("click", () => {
      form.submit();
    });

    document.addEventListener("keydown", (e) => {
      if (e.key !== "Escape") {
        return;
      }
      if (accountRoot?.classList.contains("is-open")) {
        closeAccountMenu();
        return;
      }
      if (modal.classList.contains("is-open")) {
        closeLogoutModal();
      }
    });
  });
})();

(() => {
  const matchesWords = (label, query) => {
    const q = (query || "").trim().toLowerCase();
    if (!q) {
      return true;
    }
    const hay = (label || "").toLowerCase();
    return q
      .split(/\s+/)
      .filter(Boolean)
      .every((w) => hay.includes(w));
  };

  const setupCombobox = (root) => {
    const hidden = root.querySelector('input[type="hidden"]');
    const input = root.querySelector(".crm-combobox-input");
    const list = root.querySelector(".crm-combobox-panel");
    if (!hidden || !input || !list) {
      return;
    }
    const options = Array.from(list.querySelectorAll('[role="option"]'));

    let open = false;
    let activeIdx = -1;

    const visibleOptions = () => options.filter((li) => li.style.display !== "none");

    const setOpen = (v) => {
      open = v;
      list.hidden = !v;
      input.setAttribute("aria-expanded", v ? "true" : "false");
      if (!v) {
        activeIdx = -1;
        options.forEach((li) => li.removeAttribute("aria-selected"));
      }
    };

    const filter = () => {
      const q = input.value;
      options.forEach((li) => {
        const label = li.getAttribute("data-label") || li.textContent || "";
        li.style.display = matchesWords(label, q) ? "" : "none";
      });
    };

    const highlight = (idx) => {
      const vis = visibleOptions();
      vis.forEach((li) => li.removeAttribute("aria-selected"));
      if (idx < 0 || idx >= vis.length) {
        activeIdx = -1;
        return;
      }
      activeIdx = idx;
      vis[idx].setAttribute("aria-selected", "true");
      vis[idx].scrollIntoView({ block: "nearest" });
    };

    const choose = (li) => {
      const id = li.getAttribute("data-value");
      const label = li.getAttribute("data-label") || li.textContent || "";
      hidden.value = id || "";
      input.value = label;
      setOpen(false);
    };

    input.addEventListener("focus", () => {
      filter();
      setOpen(true);
    });

    input.addEventListener("input", () => {
      hidden.value = "";
      filter();
      setOpen(true);
      const vis = visibleOptions();
      highlight(vis.length > 0 ? 0 : -1);
    });

    input.addEventListener("click", () => {
      filter();
      setOpen(true);
    });

    list.addEventListener("mousedown", (e) => {
      e.preventDefault();
      const li = e.target.closest('[role="option"]');
      if (!li || li.style.display === "none") {
        return;
      }
      choose(li);
    });

    input.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        setOpen(false);
        return;
      }
      const vis = visibleOptions();
      if (e.key === "ArrowDown") {
        e.preventDefault();
        if (!open) {
          filter();
          setOpen(true);
        }
        if (vis.length === 0) {
          return;
        }
        const next = activeIdx < 0 ? 0 : Math.min(activeIdx + 1, vis.length - 1);
        highlight(next);
      } else if (e.key === "ArrowUp") {
        e.preventDefault();
        if (!open) {
          filter();
          setOpen(true);
        }
        if (vis.length === 0) {
          return;
        }
        const next = activeIdx <= 0 ? 0 : activeIdx - 1;
        highlight(next);
      } else if (e.key === "Enter") {
        if (!open || vis.length === 0) {
          return;
        }
        e.preventDefault();
        if (activeIdx >= 0 && vis[activeIdx]) {
          choose(vis[activeIdx]);
        } else if (vis.length === 1) {
          choose(vis[0]);
        }
      }
    });

    document.addEventListener("click", (e) => {
      if (!root.contains(e.target)) {
        setOpen(false);
      }
    });

    const normId = (v) => (v == null ? "" : String(v).trim().toLowerCase());
    if (hidden.value) {
      const hv = normId(hidden.value);
      const found = options.find((li) => normId(li.getAttribute("data-value")) === hv);
      if (found) {
        input.value = found.getAttribute("data-label") || found.textContent || "";
      }
    }
  };

  const bind = (page, form, clientErrId, requireStudent) => {
    if (!page || !form) {
      return;
    }
    const clientErr = document.getElementById(clientErrId);
    const msgStudent = page.dataset.msgStudentRequired || "";
    const msgProgram = page.dataset.msgProgramRequired || "";

    form.querySelectorAll("[data-combobox]").forEach(setupCombobox);

    form.addEventListener("submit", (e) => {
      if (requireStudent) {
        const sid = document.getElementById("studentIdHidden")?.value?.trim();
        if (!sid) {
          e.preventDefault();
          if (clientErr) {
            clientErr.textContent = msgStudent;
            clientErr.hidden = false;
          }
          return;
        }
      }
      if (form.id === "applicationNewForm") {
        const msgDegree = page.dataset.msgDegreeRequired || "";
        const deg = document.getElementById("appProgramDegreeNative")?.value?.trim();
        if (!deg) {
          e.preventDefault();
          if (clientErr) {
            clientErr.textContent = msgDegree;
            clientErr.hidden = false;
          }
          return;
        }
        const msgLang = page.dataset.msgLanguageRequired || "";
        const lh = document.getElementById("programLanguageHidden")?.value?.trim();
        if (!lh) {
          e.preventDefault();
          if (clientErr) {
            clientErr.textContent = msgLang;
            clientErr.hidden = false;
          }
          return;
        }
        const pname = document.getElementById("appProgramNameNative")?.value?.trim();
        if (!pname) {
          e.preventDefault();
          if (clientErr) {
            clientErr.textContent = msgProgram;
            clientErr.hidden = false;
          }
          return;
        }
        if (typeof window.__ingazgateResolveApplicationProgramId === "function") {
          window.__ingazgateResolveApplicationProgramId();
        }
      }
      const pid = form.querySelector('[name="programId"]')?.value?.trim();
      if (!pid) {
        e.preventDefault();
        if (clientErr) {
          const msgUni = page.dataset.msgUniversityRequired || "";
          const uniField = document.getElementById("appUniversityPickField");
          const useUniMsg = form.id === "applicationNewForm" && msgUni;
          clientErr.textContent = useUniMsg ? msgUni : msgProgram;
          clientErr.hidden = false;
        }
        return;
      }
      if (clientErr) {
        clientErr.hidden = true;
      }
    });
  };

  document.addEventListener("DOMContentLoaded", () => {
    bind(
      document.getElementById("applicationNewPage"),
      document.getElementById("applicationNewForm"),
      "applicationNewClientError",
      true
    );
    bind(
      document.getElementById("applicationEditPage"),
      document.getElementById("applicationEditForm"),
      "applicationEditClientError",
      false
    );
    document
      .querySelectorAll("#studentNewForm [data-combobox], #studentEditForm [data-combobox]")
      .forEach(setupCombobox);
  });
})();

(() => {
  /**
   * Single-select picker using the same shell as Programs → University filter (prog-uni-*).
   */
  const progUniPickerRegistry = new Map();
  let progUniOutsideCloseLock = 0;

  const lockProgUniOutsideClose = () => {
    progUniOutsideCloseLock = Date.now() + 320;
  };

  const isProgUniOutsideCloseLocked = () => Date.now() < progUniOutsideCloseLock;

  const closeAllProgUniPickers = (exceptWrap = null) => {
    progUniPickerRegistry.forEach((entry) => {
      if (entry.wrap !== exceptWrap && entry.wrap.classList.contains("is-open")) {
        entry.close();
      }
    });
    window.dispatchEvent(new CustomEvent("ingazgate:close-prog-uni-panels"));
  };

  if (!window.__ingazgateProgUniDocBound) {
    window.__ingazgateProgUniDocBound = true;
    document.addEventListener(
      "mousedown",
      (e) => {
        if (isProgUniOutsideCloseLocked()) {
          return;
        }
        const inside = [...progUniPickerRegistry.values()].some(
          ({ wrap, dropdown }) => wrap.contains(e.target) || dropdown.contains(e.target)
        );
        if (!inside) {
          closeAllProgUniPickers();
        }
      },
      true
    );
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        closeAllProgUniPickers();
      }
    });
  }

  window.closeAllIngazgateProgUniPickers = closeAllProgUniPickers;

  const initProgUniStyleSingleSelect = (nativeSelect, opts) => {
    const noResultsText = (opts && opts.noResultsText) || "No matches";
    if (!nativeSelect || nativeSelect.multiple) {
      return {
        refresh() {},
        destroy() {},
      };
    }
    const field = nativeSelect.closest(".programs-filter-select");
    if (!field || field.querySelector(".prog-uni-multi")) {
      return {
        refresh() {},
        destroy() {},
      };
    }

    const placeholder =
      nativeSelect.getAttribute("data-placeholder") || nativeSelect.dataset.placeholder || "";
    nativeSelect.classList.add("prog-uni-native");

    const wrap = document.createElement("div");
    wrap.className = "prog-uni-multi prog-uni-multi--single";
    const control = document.createElement("div");
    control.className = "prog-uni-control";
    control.setAttribute("role", "combobox");
    control.setAttribute("tabindex", "0");
    control.setAttribute("aria-expanded", "false");

    const input = document.createElement("input");
    input.type = "text";
    input.className = "prog-uni-input";
    input.setAttribute("autocomplete", "off");
    input.setAttribute("placeholder", placeholder);

    const clearBtn = document.createElement("button");
    clearBtn.type = "button";
    clearBtn.className = "prog-uni-clear";
    clearBtn.setAttribute("aria-label", "Clear");
    clearBtn.textContent = "×";

    const chev = document.createElement("span");
    chev.className = "prog-uni-chevron";
    chev.setAttribute("aria-hidden", "true");

    const actions = document.createElement("div");
    actions.className = "prog-uni-actions";
    actions.append(clearBtn, chev);

    control.append(input, actions);

    const dropdown = document.createElement("div");
    dropdown.className = "prog-uni-dropdown";
    const list = document.createElement("ul");
    list.className = "prog-uni-list";
    dropdown.appendChild(list);
    wrap.append(control, dropdown);
    field.appendChild(wrap);

    const getOptions = () => Array.from(nativeSelect.options);

    const updateClearVis = () => {
      const has = !!(nativeSelect.value && String(nativeSelect.value).trim());
      clearBtn.hidden = !has;
    };

    const syncInputClosed = () => {
      const val = (nativeSelect.value || "").trim();
      const sel = nativeSelect.selectedOptions[0];
      const lab = sel ? (sel.textContent || "").trim() : "";
      input.value = val ? lab : lab || "";
      if (!val) {
        input.placeholder = placeholder;
      }
      updateClearVis();
    };

    const positionDropdown = () => {
      const r = control.getBoundingClientRect();
      dropdown.style.left = `${Math.round(r.left)}px`;
      dropdown.style.top = `${Math.round(r.bottom + 6)}px`;
      dropdown.style.width = `${Math.round(r.width)}px`;
    };

    const portalDropdown = () => {
      if (dropdown.parentElement !== document.body) {
        document.body.appendChild(dropdown);
      }
      dropdown.classList.add("prog-uni-dropdown--portal", "prog-uni-dropdown--fixed");
      positionDropdown();
    };

    const unportalDropdown = () => {
      dropdown.classList.remove("prog-uni-dropdown--portal", "prog-uni-dropdown--fixed");
      dropdown.style.left = "";
      dropdown.style.top = "";
      dropdown.style.width = "";
      if (dropdown.parentElement !== wrap) {
        wrap.appendChild(dropdown);
      }
    };

    const close = () => {
      if (!wrap.classList.contains("is-open")) {
        return;
      }
      wrap.classList.remove("is-open");
      control.setAttribute("aria-expanded", "false");
      dropdown.classList.remove("is-open");
      unportalDropdown();
      syncInputClosed();
      progUniPickerRegistry.delete(pickerRegistryEntry);
    };

    const open = () => {
      lockProgUniOutsideClose();
      closeAllProgUniPickers(wrap);
      wrap.classList.add("is-open");
      control.setAttribute("aria-expanded", "true");
      input.value = "";
      input.placeholder = placeholder;
      portalDropdown();
      dropdown.classList.add("is-open");
      renderOptions();
      input.focus();
      progUniPickerRegistry.set(pickerRegistryEntry, pickerRegistryEntry);
    };

    const pickerRegistryEntry = { wrap, dropdown, close };

    const renderOptions = () => {
      const q = input.value.trim().toLowerCase();
      list.innerHTML = "";
      const filtered = getOptions().filter((o) => {
        const val = (o.value || "").trim();
        const t = (o.textContent || "").trim().toLowerCase();
        if (!val) {
          return !q;
        }
        return !q || t.includes(q);
      });
      filtered.forEach((o) => {
        const li = document.createElement("li");
        const btn = document.createElement("button");
        btn.type = "button";
        btn.className = "prog-uni-option";
        btn.textContent = (o.textContent || "").trim() || "—";
        if (o.value && o.value === nativeSelect.value) {
          btn.classList.add("is-selected");
        }
        btn.addEventListener("mousedown", (e) => {
          e.preventDefault();
          e.stopPropagation();
        });
        btn.addEventListener("click", (e) => {
          e.preventDefault();
          e.stopPropagation();
          nativeSelect.value = o.value;
          nativeSelect.dispatchEvent(new Event("change", { bubbles: true }));
          close();
        });
        li.appendChild(btn);
        list.appendChild(li);
      });
      if (!list.children.length) {
        const li = document.createElement("li");
        li.className = "prog-uni-no-results";
        li.textContent = noResultsText;
        list.appendChild(li);
      }
    };

    const onViewportChange = () => {
      if (dropdown.classList.contains("is-open")) {
        positionDropdown();
      }
    };
    window.addEventListener("resize", onViewportChange);
    window.addEventListener("scroll", onViewportChange, true);

    control.addEventListener("mousedown", (e) => {
      if (e.button !== 0) {
        return;
      }
      if (clearBtn.contains(e.target)) {
        return;
      }
      e.preventDefault();
      e.stopPropagation();
      lockProgUniOutsideClose();
      if (wrap.classList.contains("is-open")) {
        input.focus();
        return;
      }
      open();
    });
    control.addEventListener("keydown", (e) => {
      if (e.key === "Enter" || e.key === " " || e.key === "ArrowDown") {
        e.preventDefault();
        if (!wrap.classList.contains("is-open")) {
          open();
        }
      }
      if (e.key === "Escape") {
        close();
      }
    });
    clearBtn.addEventListener("click", (e) => {
      e.stopPropagation();
      nativeSelect.value = "";
      nativeSelect.dispatchEvent(new Event("change", { bubbles: true }));
      updateClearVis();
      if (wrap.classList.contains("is-open")) {
        renderOptions();
      } else {
        syncInputClosed();
      }
      input.focus();
    });
    input.addEventListener("mousedown", (e) => {
      e.stopPropagation();
      if (e.button !== 0) {
        return;
      }
      e.preventDefault();
      lockProgUniOutsideClose();
      if (!wrap.classList.contains("is-open")) {
        open();
      } else {
        input.focus();
      }
    });
    input.addEventListener("click", (e) => {
      e.stopPropagation();
    });
    input.addEventListener("input", () => {
      if (!wrap.classList.contains("is-open")) {
        open();
        return;
      }
      renderOptions();
    });

    nativeSelect.addEventListener("change", () => {
      if (!wrap.classList.contains("is-open")) {
        syncInputClosed();
      }
      updateClearVis();
    });

    syncInputClosed();
    updateClearVis();

    return {
      refresh() {
        if (!wrap.classList.contains("is-open")) {
          syncInputClosed();
        } else {
          renderOptions();
        }
        updateClearVis();
      },
      destroy() {
        window.removeEventListener("resize", onViewportChange);
        window.removeEventListener("scroll", onViewportChange, true);
        progUniPickerRegistry.delete(pickerRegistryEntry);
        unportalDropdown();
        wrap.remove();
      },
    };
  };

  window.initIngazgateSingleSelect = initProgUniStyleSingleSelect;

  const initIngazgatePageSelects = (root, opts) => {
    if (!root) {
      return [];
    }
    const noResultsText = (opts && opts.noResultsText) || "No matches";
    const pickers = [];
    root.querySelectorAll(".programs-filter-select select").forEach((sel) => {
      if (sel.multiple) {
        return;
      }
      pickers.push(initProgUniStyleSingleSelect(sel, { noResultsText }));
    });
    return pickers;
  };
  window.initIngazgatePageSelects = initIngazgatePageSelects;

  const initApplicationMetaSelects = (root, opts) => {
    if (!root) {
      return [];
    }
    const noResultsText = (opts && opts.noResultsText) || "No matches";
    const defaultById = {
      applicationStatus: "NEW",
      applicationType: "NEW",
      statusEdit: null,
      typeEdit: null,
    };
    const pickers = [];
    root.querySelectorAll("select[data-application-meta-select]").forEach((select) => {
      const field = select.closest(".programs-filter-select");
      if (!field || field.querySelector(".prog-uni-multi")) {
        return;
      }
      const picker = initProgUniStyleSingleSelect(select, { noResultsText });
      const preferred = defaultById[select.id];
      if (preferred) {
        const match = [...select.options].find((o) => o.value === preferred);
        if (match) {
          select.value = preferred;
        }
      } else if (!select.value) {
        const first = [...select.options].find((o) => o.value);
        if (first) {
          select.value = first.value;
        }
      }
      picker.refresh();
      pickers.push(picker);
    });
    return pickers;
  };
  window.initApplicationMetaSelects = initApplicationMetaSelects;

  document.addEventListener("DOMContentLoaded", () => {
    const noMatchDefault = "No matches";
    document.querySelectorAll(".applications-filters-card").forEach((card) => {
      initIngazgatePageSelects(card, { noResultsText: noMatchDefault });
    });
    const leadsPage = document.getElementById("myLeadsPage");
    if (leadsPage) {
      initIngazgatePageSelects(leadsPage, { noResultsText: noMatchDefault });
    }
    const leadDetailPage = document.querySelector(".lead-detail-page");
    if (leadDetailPage) {
      initIngazgatePageSelects(leadDetailPage, { noResultsText: noMatchDefault });
    }
    const editPage = document.getElementById("applicationEditPage");
    if (editPage) {
      const noMatch = editPage.dataset.msgNoMatch || noMatchDefault;
      initApplicationMetaSelects(editPage, { noResultsText: noMatch });
      initIngazgatePageSelects(editPage, { noResultsText: noMatch });
    }

    const page = document.getElementById("applicationNewPage");
    const form = document.getElementById("applicationNewForm");
    if (page && form) {
      initApplicationMetaSelects(form, {
        noResultsText: page.dataset.msgNoMatch || noMatchDefault,
      });
    }
    const degreeNative = document.getElementById("appProgramDegreeNative");
    const langNative = document.getElementById("appProgramLanguageNative");
    const langHidden = document.getElementById("programLanguageHidden");
    const nameNative = document.getElementById("appProgramNameNative");
    const uniNative = document.getElementById("appUniversityNative");
    const programIdHidden = document.getElementById("appProgramIdHidden");
    if (!form || !langNative || !nameNative || !uniNative || !langHidden || !programIdHidden) {
      return;
    }

    if (!degreeNative) {
      return;
    }

    const noResultsText = (page && page.dataset.msgNoMatch) || "No matches";
    const pickerOpts = { noResultsText };

    const parseProgramOptions = () => {
      const el = document.getElementById("programOptionsJson");
      if (!el) {
        return [];
      }
      try {
        const parsed = JSON.parse(el.textContent || "[]");
        return Array.isArray(parsed) ? parsed : [];
      } catch (err) {
        console.error("programOptionsJson parse failed", err);
        return [];
      }
    };
    const allProgramOptions = parseProgramOptions();

    const ensurePlaceholderOption = (select) => {
      if (!select) {
        return;
      }
      const ph = select.getAttribute("data-placeholder") || "Select…";
      let emptyOpt = [...select.options].find((o) => o.value === "");
      if (!emptyOpt) {
        emptyOpt = document.createElement("option");
        emptyOpt.value = "";
        select.insertBefore(emptyOpt, select.firstChild);
      }
      emptyOpt.textContent = ph;
    };

    [degreeNative, langNative, nameNative, uniNative].forEach((sel) => {
      if (sel) {
        ensurePlaceholderOption(sel);
      }
    });
    if (degreeNative) {
      degreeNative.value = "";
    }
    if (langNative) {
      langNative.value = "";
    }
    langHidden.value = "";

    const degreePicker = degreeNative
      ? initProgUniStyleSingleSelect(degreeNative, pickerOpts)
      : null;
    const langPicker = initProgUniStyleSingleSelect(langNative, pickerOpts);
    const namePicker = initProgUniStyleSingleSelect(nameNative, pickerOpts);
    const uniPicker = initProgUniStyleSingleSelect(uniNative, pickerOpts);

    const norm = (s) => (s == null ? "" : String(s).trim());
    const uniqueSorted = (values) =>
      [...new Set(values.map((v) => norm(v)).filter(Boolean))].sort((a, b) =>
        a.localeCompare(b, undefined, { sensitivity: "base" })
      );
    const matchesDegree = (row, deg) => norm(row.degree) === deg;
    const normId = (v) => (v == null ? "" : String(v).trim());
    const matchesUniversity = (row, uniId) => normId(row.universityId) === uniId;
    const fillSelect = (select, values, valueKey, labelKey, preserveValue = false) => {
      if (!select) {
        return;
      }
      const prev = preserveValue ? select.value : "";
      const ph = select.getAttribute("data-placeholder") || "Select…";
      select.innerHTML = "";
      const empty = document.createElement("option");
      empty.value = "";
      empty.textContent = ph;
      select.appendChild(empty);
      values.forEach((item) => {
        const opt = document.createElement("option");
        if (typeof item === "string") {
          opt.value = item;
          opt.textContent = item;
        } else {
          opt.value = String(item[valueKey] ?? "");
          opt.textContent = norm(item[labelKey]) || "—";
        }
        select.appendChild(opt);
      });
      if (preserveValue && prev && [...select.options].some((o) => o.value === prev)) {
        select.value = prev;
      } else {
        select.value = "";
      }
    };

    const uniRowsFrom = (rows) => {
      const seen = new Map();
      rows.forEach((o) => {
        const uid = normId(o.universityId);
        if (!uid) {
          return;
        }
        if (!seen.has(uid)) {
          seen.set(uid, { id: uid, universityName: o.universityName });
        }
      });
      return [...seen.values()].sort((a, b) =>
        norm(a.universityName).localeCompare(norm(b.universityName), undefined, {
          sensitivity: "base",
        })
      );
    };

    const resolveProgramId = () => {
      const deg = (degreeNative?.value || "").trim();
      const lang = (langNative.value || "").trim();
      const pname = (nameNative.value || "").trim();
      const uniId = (uniNative.value || "").trim();
      if (!deg || !lang || !pname || !uniId) {
        programIdHidden.value = "";
        return;
      }
      const match = allProgramOptions.find(
        (o) =>
          matchesDegree(o, deg) &&
          norm(o.language).toLowerCase() === lang.toLowerCase() &&
          norm(o.programName).toLowerCase() === pname.toLowerCase() &&
          matchesUniversity(o, uniId)
      );
      programIdHidden.value = match ? normId(match.id) : "";
    };

    const applyProgramFilters = () => {
      const deg = (degreeNative?.value || "").trim();
      const lang = (langNative.value || "").trim();
      const pname = (nameNative.value || "").trim();
      const uniId = (uniNative.value || "").trim();

      if (!deg) {
        fillSelect(langNative, []);
        fillSelect(nameNative, []);
        fillSelect(uniNative, [], "id", "universityName");
        langHidden.value = "";
        resolveProgramId();
        langPicker.refresh();
        namePicker.refresh();
        uniPicker.refresh();
        return;
      }

      const baseRows = allProgramOptions.filter((o) => matchesDegree(o, deg));
      fillSelect(langNative, uniqueSorted(baseRows.map((o) => o.language)), null, null, true);

      if (!lang) {
        fillSelect(nameNative, []);
        fillSelect(uniNative, [], "id", "universityName");
        langHidden.value = "";
        resolveProgramId();
        langPicker.refresh();
        namePicker.refresh();
        uniPicker.refresh();
        return;
      }

      let scopedRows = baseRows.filter(
        (o) => norm(o.language).toLowerCase() === lang.toLowerCase()
      );
      let progRows = scopedRows;
      let uniRows = scopedRows;

      if (uniId) {
        progRows = progRows.filter((o) => matchesUniversity(o, uniId));
      }
      if (pname) {
        uniRows = uniRows.filter(
          (o) => norm(o.programName).toLowerCase() === pname.toLowerCase()
        );
        if (!uniId) {
          progRows = progRows.filter(
            (o) => norm(o.programName).toLowerCase() === pname.toLowerCase()
          );
        }
      }

      fillSelect(nameNative, uniqueSorted(progRows.map((o) => o.programName)), null, null, true);
      fillSelect(uniNative, uniRowsFrom(uniRows), "id", "universityName", true);

      langHidden.value = lang;
      resolveProgramId();
      langPicker.refresh();
      namePicker.refresh();
      uniPicker.refresh();
    };

    fillSelect(langNative, []);
    fillSelect(nameNative, []);
    fillSelect(uniNative, [], "id", "universityName");
    degreePicker?.refresh();
    langPicker.refresh();
    namePicker.refresh();
    uniPicker.refresh();

    degreeNative?.addEventListener("change", applyProgramFilters);
    langNative.addEventListener("change", () => {
      langHidden.value = (langNative.value || "").trim();
      applyProgramFilters();
    });
    nameNative.addEventListener("change", applyProgramFilters);
    uniNative.addEventListener("change", applyProgramFilters);
    window.__ingazgateResolveApplicationProgramId = resolveProgramId;
  });
})();

(() => {
  const page = document.getElementById("serviceDetailPage");
  const form = document.getElementById("serviceDetailForm");
  if (!page || !form) {
    return;
  }

  const matchesWords = (label, query) => {
    const q = (query || "").trim().toLowerCase();
    if (!q) {
      return true;
    }
    const hay = (label || "").toLowerCase();
    return q
      .split(/\s+/)
      .filter(Boolean)
      .every((w) => hay.includes(w));
  };

  const setupCombobox = (root) => {
    const hidden = root.querySelector('input[type="hidden"]');
    const input = root.querySelector(".crm-combobox-input");
    const list = root.querySelector(".crm-combobox-panel");
    if (!hidden || !input || !list) {
      return;
    }
    const options = Array.from(list.querySelectorAll('[role="option"]'));
    let open = false;
    let activeIdx = -1;

    const visibleOptions = () => options.filter((li) => li.style.display !== "none");
    const setOpen = (v) => {
      open = v;
      list.hidden = !v;
      input.setAttribute("aria-expanded", v ? "true" : "false");
      if (!v) {
        activeIdx = -1;
        options.forEach((li) => li.removeAttribute("aria-selected"));
      }
    };
    const filter = () => {
      const q = input.value;
      options.forEach((li) => {
        const label = li.getAttribute("data-label") || li.textContent || "";
        li.style.display = matchesWords(label, q) ? "" : "none";
      });
    };
    const highlight = (idx) => {
      const vis = visibleOptions();
      vis.forEach((li) => li.removeAttribute("aria-selected"));
      if (idx < 0 || idx >= vis.length) {
        activeIdx = -1;
        return;
      }
      activeIdx = idx;
      vis[idx].setAttribute("aria-selected", "true");
      vis[idx].scrollIntoView({ block: "nearest" });
    };
    const choose = (li) => {
      const id = li.getAttribute("data-value");
      const label = li.getAttribute("data-label") || li.textContent || "";
      hidden.value = id || "";
      input.value = label;
      setOpen(false);
    };

    input.addEventListener("focus", () => {
      filter();
      setOpen(true);
    });
    input.addEventListener("input", () => {
      hidden.value = "";
      filter();
      setOpen(true);
      const vis = visibleOptions();
      highlight(vis.length > 0 ? 0 : -1);
    });
    input.addEventListener("click", () => {
      filter();
      setOpen(true);
    });
    input.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        setOpen(false);
        return;
      }
      const vis = visibleOptions();
      if (e.key === "ArrowDown") {
        e.preventDefault();
        if (!open) {
          filter();
          setOpen(true);
        }
        if (vis.length === 0) return;
        highlight(activeIdx < 0 ? 0 : Math.min(activeIdx + 1, vis.length - 1));
      } else if (e.key === "ArrowUp") {
        e.preventDefault();
        if (!open) {
          filter();
          setOpen(true);
        }
        if (vis.length === 0) return;
        highlight(activeIdx <= 0 ? 0 : activeIdx - 1);
      } else if (e.key === "Enter") {
        if (!open || vis.length === 0) return;
        e.preventDefault();
        if (activeIdx >= 0 && vis[activeIdx]) {
          choose(vis[activeIdx]);
        } else if (vis.length === 1) {
          choose(vis[0]);
        }
      }
    });
    list.addEventListener("mousedown", (e) => {
      e.preventDefault();
      const li = e.target.closest('[role="option"]');
      if (!li || li.style.display === "none") return;
      choose(li);
    });
    document.addEventListener("click", (e) => {
      if (!root.contains(e.target)) {
        setOpen(false);
      }
    });
  };

  form.querySelectorAll("[data-combobox]").forEach(setupCombobox);
})();

(() => {
  const modal = document.getElementById("applicationEditModal");
  const page = document.getElementById("applicationsPage");
  if (!modal || !page) {
    return;
  }

  const form = document.getElementById("applicationEditModalForm");
  const fetchErr = document.getElementById("applicationEditFetchError");
  const modalErr = document.getElementById("applicationEditModalError");
  const loadMsg = page.getAttribute("data-msg-load-error") || "Could not load application.";

  const fields = {
    applicationNumber: document.getElementById("applicationEditModalNumber"),
    studentName: document.getElementById("applicationEditModalStudent"),
    programId: document.getElementById("applicationEditModalProgramId"),
    semester: document.getElementById("applicationEditModalSemester"),
    notes: document.getElementById("applicationEditModalNotes"),
  };

  const modalPickers = window.initIngazgatePageSelects
    ? window.initIngazgatePageSelects(form, { noResultsText: "No matches" })
    : [];

  const clearFetchErr = () => {
    if (!fetchErr) {
      return;
    }
    fetchErr.textContent = "";
    fetchErr.hidden = true;
  };

  const clearModalErr = () => {
    if (!modalErr) {
      return;
    }
    modalErr.textContent = "";
    modalErr.hidden = true;
  };

  const open = () => {
    clearModalErr();
    modal.classList.add("is-open");
    document.body.style.overflow = "hidden";
  };

  const close = () => {
    modal.classList.remove("is-open");
    document.body.style.overflow = "";
    clearModalErr();
  };

  const showFetchErr = (msg) => {
    if (!fetchErr) {
      return;
    }
    fetchErr.textContent = msg || loadMsg;
    fetchErr.hidden = false;
  };

  const loadAndOpen = async (id) => {
    if (!id || !form) {
      return;
    }
    clearFetchErr();
    clearModalErr();
    try {
      const res = await fetch(`/applications/${encodeURIComponent(id)}/edit-data`, {
        headers: { Accept: "application/json" },
        credentials: "same-origin",
      });
      if (!res.ok) {
        showFetchErr(loadMsg);
        return;
      }
      const data = await res.json();
      form.action = `/applications/${encodeURIComponent(data.id)}`;
      if (fields.applicationNumber) {
        fields.applicationNumber.value = data.applicationNumber || "";
      }
      if (fields.studentName) {
        fields.studentName.value = data.studentName || "";
      }
      if (fields.programId) {
        fields.programId.value = data.programId ? String(data.programId) : "";
      }
      if (fields.semester) {
        fields.semester.value = data.semester || "";
      }
      if (fields.notes) {
        fields.notes.value = data.notes || "";
      }
      modalPickers.forEach((p) => p.refresh());
      open();
      if (window.history?.replaceState) {
        const url = new URL(window.location.href);
        url.searchParams.delete("openEdit");
        const qs = url.searchParams.toString();
        window.history.replaceState({}, "", url.pathname + (qs ? `?${qs}` : ""));
      }
    } catch {
      showFetchErr(loadMsg);
    }
  };

  page.addEventListener("click", (e) => {
    const btn = e.target.closest(".application-edit-open");
    if (!btn) {
      return;
    }
    e.preventDefault();
    const id = btn.getAttribute("data-app-id");
    loadAndOpen(id);
  });

  page.addEventListener("click", (e) => {
    if (e.defaultPrevented || e.button !== 0) {
      return;
    }
    if (e.target.closest("a, button, input, select, textarea, label")) {
      return;
    }
    const tr = e.target.closest("tr[data-application-id]");
    if (!tr) {
      return;
    }
    const id = (tr.getAttribute("data-application-id") || "").trim();
    if (!id) {
      return;
    }
    window.location.assign(`/applications/${encodeURIComponent(id)}`);
  });

  modal.querySelector(".modal-backdrop")?.addEventListener("click", close);
  modal.querySelectorAll("[data-app-edit-close-btn]").forEach((b) => {
    b.addEventListener("click", close);
  });

  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && modal.classList.contains("is-open")) {
      close();
    }
  });

  const pending = (page.dataset.openEditId || "").trim();
  if (pending) {
    loadAndOpen(pending);
  }
})();

(() => {
  const modal = document.getElementById("applicationStatusModal");
  const page = document.getElementById("applicationsPage");
  if (!modal || !page) {
    return;
  }

  const form = document.getElementById("applicationStatusModalForm");
  const numberField = document.getElementById("applicationStatusModalNumber");
  const statusSelect = document.getElementById("applicationStatusModalSelect");
  const statusPickers = window.initIngazgatePageSelects
    ? window.initIngazgatePageSelects(modal, { noResultsText: "No matches" })
    : [];

  const close = () => {
    modal.classList.remove("is-open");
    document.body.style.overflow = "";
  };

  const open = (id, status, number) => {
    if (!form || !id) {
      return;
    }
    form.action = `/applications/${encodeURIComponent(id)}/status`;
    if (numberField) {
      numberField.value = number || "";
    }
    if (statusSelect) {
      statusSelect.value = status || "NEW";
    }
    statusPickers.forEach((p) => p.refresh());
    modal.classList.add("is-open");
    document.body.style.overflow = "hidden";
  };

  page.addEventListener("click", (e) => {
    const btn = e.target.closest(".application-change-status-open");
    if (!btn) {
      return;
    }
    e.preventDefault();
    e.stopPropagation();
    const id = btn.getAttribute("data-app-id");
    const status = btn.getAttribute("data-app-status") || "NEW";
    const row = btn.closest("tr[data-application-id]");
    const number = row?.querySelector("td a.tag")?.textContent?.trim() || "";
    open(id, status, number);
  });

  modal.querySelector(".modal-backdrop")?.addEventListener("click", close);
  modal.querySelectorAll("[data-app-status-close-btn]").forEach((b) => {
    b.addEventListener("click", close);
  });

  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && modal.classList.contains("is-open")) {
      close();
    }
  });
})();


(() => {
  const modal = document.getElementById("agentEditModal");
  const openBtn = document.getElementById("openAgentEditModal");
  if (!modal || !openBtn) {
    return;
  }

  const close = () => {
    modal.classList.remove("is-open");
  };

  openBtn.addEventListener("click", () => {
    modal.classList.add("is-open");
  });
  modal.querySelectorAll("[data-close-agent-edit-modal]").forEach((el) => {
    el.addEventListener("click", close);
  });

  const deleteOpen = document.getElementById("openAgentDeleteModal");
  const deleteModal = document.getElementById("agentDeleteModal");
  deleteOpen?.addEventListener("click", () => {
    deleteModal?.classList.add("is-open");
  });

  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && modal.classList.contains("is-open")) {
      close();
    }
  });
})();

(() => {
  const bindModal = (openId, modalId, closeAttr) => {
    const openBtn = document.getElementById(openId);
    const modal = document.getElementById(modalId);
    if (!openBtn || !modal) {
      return;
    }
    const close = () => modal.classList.remove("is-open");
    const open = () => modal.classList.add("is-open");
    openBtn.addEventListener("click", open);
    modal.querySelectorAll(`[${closeAttr}]`).forEach((el) => el.addEventListener("click", close));
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape" && modal.classList.contains("is-open")) {
        close();
      }
    });
  };
  bindModal("openApplicationDeleteModal", "applicationDeleteModal", "data-close-app-delete-modal");
  bindModal("openStudentDeleteModal", "studentDeleteModal", "data-close-student-delete-modal");
  bindModal("openAgentDeleteModal", "agentDeleteModal", "data-close-agent-delete-modal");
  bindModal("openNewsCreateModal", "newsCreateModal", "data-close-news-modal");
  bindModal("openComplaintCreateModal", "complaintCreateModal", "data-close-complaint-modal");
})();

(() => {
  const navigateRow = (row) => {
    const href = row?.dataset?.href;
    if (!href) {
      return;
    }
    window.location.href = href;
  };

  document.querySelectorAll(".crm-clickable-row[data-href]").forEach((row) => {
    row.setAttribute("tabindex", "0");
    row.setAttribute("role", "link");
    row.addEventListener("click", (e) => {
      if (e.target.closest("a, button, input, select, textarea, label")) {
        return;
      }
      navigateRow(row);
    });
    row.addEventListener("keydown", (e) => {
      if (e.key === "Enter" || e.key === " ") {
        e.preventDefault();
        navigateRow(row);
      }
    });
  });
})();
