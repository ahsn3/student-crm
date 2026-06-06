(() => {
  const cfg = window.INGAZ_APP_CHAT || {};
  let chatBound = false;

  const boot = () => {
    const root = document.getElementById("applicationChatRoot");
    if (!root) {
      return;
    }

    if (chatBound) {
      window.ingazApplicationChatRefresh?.();
      return;
    }
    chatBound = true;

    let messagesUrl = (root.dataset.messagesUrl || cfg.messagesUrl || "").trim();
    if (!messagesUrl) {
      const appId = (root.dataset.applicationId || "").trim();
      if (appId) {
        messagesUrl = `/api/applications/${encodeURIComponent(appId)}/messages`;
      }
    }

    const meEmail = (root.dataset.meEmail || cfg.meEmail || "").trim().toLowerCase();
    const msgEmpty = cfg.empty || "No messages yet.";
    const msgSendErr = cfg.sendError || "Could not send message.";
    const msgFileLarge = cfg.fileTooLarge || "File is too large.";
    const msgLoading = cfg.loading || "Loading…";
    const msgLoadErr = cfg.loadError || "Could not load messages.";
    const msgChatUnavailable = cfg.chatUnavailable || msgLoadErr;
    const msgSending = cfg.sending || "Sending…";
    const msgRoleAdmin = cfg.roleAdmin || "IngazGate";
    const msgRoleAgent = cfg.roleAgent || "Agent";

    const scrollEl = document.getElementById("applicationChatScroll");
    const form = document.getElementById("applicationChatForm");
    const bodyEl = document.getElementById("applicationChatBody");
    const fileEl = document.getElementById("applicationChatFile");
    const fileNameEl = document.getElementById("applicationChatFileName");
    const errEl = document.getElementById("applicationChatError");
    const unreadBadge = document.getElementById("applicationChatUnreadBadge");
    const sendBtn = form?.querySelector('button[type="submit"]');

    if (!messagesUrl || !scrollEl || !form || !bodyEl) {
      if (scrollEl) {
        scrollEl.innerHTML = `<p class="subtle application-chat-empty">${msgLoadErr}</p>`;
      }
      return;
    }

    const metaHeader = document.querySelector('meta[name="csrf-header"]')?.getAttribute("content");
    const metaToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute("content");
    const csrfParam =
      form.querySelector('input[name="_csrf"]')?.getAttribute("name") ||
      (metaHeader && metaHeader.toLowerCase().includes("csrf") ? "_csrf" : null);

    const jsonHeaders = () => {
      const h = { Accept: "application/json" };
      if (metaHeader && metaToken) {
        h[metaHeader] = metaToken;
      }
      return h;
    };

    const postHeaders = () => jsonHeaders();

    const ensureCsrfInFormData = (fd) => {
      if (!metaToken) {
        return fd;
      }
      const param = csrfParam || "_csrf";
      if (!fd.has(param)) {
        fd.set(param, metaToken);
      }
      return fd;
    };

    const showErr = (text) => {
      if (!errEl) {
        return;
      }
      errEl.textContent = text;
      errEl.removeAttribute("hidden");
    };

    const fmt = (iso) => {
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

    const esc = (s) =>
      String(s || "")
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/"/g, "&quot;");

    let lastSig = "";
    let loading = false;
    let sending = false;
    let loadedOnce = false;

    const setUnreadBadge = (count) => {
      if (!unreadBadge) {
        return;
      }
      const n = Number(count) || 0;
      if (n <= 0) {
        unreadBadge.hidden = true;
        unreadBadge.textContent = "0";
        return;
      }
      unreadBadge.hidden = false;
      unreadBadge.textContent = n > 99 ? "99+" : String(n);
    };

    const roleLabel = (role) => {
      if (role === "ADMIN") {
        return msgRoleAdmin;
      }
      if (role === "AGENT") {
        return msgRoleAgent;
      }
      return "";
    };

    const render = (messages, unreadCount) => {
      const sig = (messages || []).map((m) => m.id).join("|");
      if (sig === lastSig) {
        setUnreadBadge(unreadCount);
        return;
      }
      lastSig = sig;
      setUnreadBadge(unreadCount);
      if (!messages || messages.length === 0) {
        scrollEl.innerHTML = `<p class="subtle application-chat-empty">${esc(msgEmpty)}</p>`;
        return;
      }
      scrollEl.innerHTML = (messages || [])
        .map((m) => {
          const mine = m.mine === true || (meEmail && (m.senderEmail || "").toLowerCase() === meEmail);
          const cls = mine
            ? "application-chat-bubble application-chat-bubble--me"
            : "application-chat-bubble application-chat-bubble--them";
          const who = esc(m.senderName || "");
          const when = esc(fmt(m.createdAt));
          const role = m.senderRole === "ADMIN" ? "admin" : m.senderRole === "AGENT" ? "agent" : "";
          const roleHtml = role
            ? `<span class="application-chat-role application-chat-role--${role}">${esc(roleLabel(m.senderRole))}</span>`
            : "";
          const text = (m.body || "").trim();
          const textHtml = text ? `<div>${esc(text).replace(/\n/g, "<br>")}</div>` : "";
          let fileHtml = "";
          if (m.hasFile && m.id) {
            const href = `${messagesUrl}/${encodeURIComponent(m.id)}/download`;
            fileHtml = `<div class="application-chat-file"><a class="tag info" href="${esc(href)}">${esc(
              m.fileName || "Download"
            )}</a></div>`;
          }
          const initial = (m.senderName || "?").trim().charAt(0).toUpperCase() || "?";
          const avatarRole =
            m.senderRole === "ADMIN" ? "application-chat-avatar--admin" : "application-chat-avatar--agent";
          const rowCls = mine
            ? "application-chat-row application-chat-row--me"
            : "application-chat-row application-chat-row--them";
          return `<div class="${rowCls}"><span class="application-chat-avatar ${avatarRole}" aria-hidden="true">${esc(initial)}</span><div class="${cls}"><div class="application-chat-bubble-head"><span class="application-chat-sender">${who}</span>${roleHtml}</div>${textHtml}${fileHtml}<div class="application-chat-meta">${when}</div></div></div>`;
        })
        .join("");
      requestAnimationFrame(() => {
        scrollEl.scrollTop = scrollEl.scrollHeight;
      });
    };

    const load = async (force) => {
      if (loading) {
        return;
      }
      if (!force && loadedOnce && lastSig) {
        return;
      }
      loading = true;
      scrollEl.classList.add("is-loading");
      if (!loadedOnce) {
        scrollEl.innerHTML = `<p class="subtle application-chat-empty">${esc(msgLoading)}</p>`;
      }
      try {
        const r = await fetch(messagesUrl, {
          headers: jsonHeaders(),
          credentials: "same-origin",
        });
        if (r.status === 404) {
          scrollEl.innerHTML = `<p class="subtle application-chat-empty">${esc(msgLoadErr)}</p>`;
          return;
        }
        if (!r.ok) {
          throw new Error(`HTTP ${r.status}`);
        }
        const data = await r.json();
        loadedOnce = true;
        if (data.error === "chatUnavailable") {
          scrollEl.innerHTML = `<p class="subtle application-chat-empty">${esc(msgChatUnavailable)}</p>`;
          return;
        }
        render(data.messages || [], data.unreadCount || 0);
        if (errEl) {
          errEl.setAttribute("hidden", "hidden");
        }
      } catch (ex) {
        if (!loadedOnce || force) {
          const code = ex && ex.message ? ex.message : "";
          scrollEl.innerHTML = `<p class="subtle application-chat-empty">${esc(msgLoadErr)}${code ? ` (${esc(code)})` : ""}</p>`;
        }
      } finally {
        loading = false;
        scrollEl.classList.remove("is-loading");
      }
    };

    window.ingazApplicationChatRefresh = () => {
      lastSig = "";
      load(true);
    };

    fileEl?.addEventListener("change", () => {
      const f = fileEl.files && fileEl.files[0];
      if (fileNameEl) {
        fileNameEl.textContent = f ? f.name : "";
      }
    });

    bodyEl.addEventListener("keydown", (e) => {
      if (e.key === "Enter" && !e.shiftKey) {
        e.preventDefault();
        form.requestSubmit();
      }
    });

    form.addEventListener("submit", async (e) => {
      e.preventDefault();
      if (sending) {
        return;
      }
      if (errEl) {
        errEl.setAttribute("hidden", "hidden");
      }
      const fd = ensureCsrfInFormData(new FormData(form));
      const text = (bodyEl.value || "").trim();
      fd.set("body", text);
      if (!text && (!fileEl || !fileEl.files || fileEl.files.length === 0)) {
        showErr(msgSendErr);
        return;
      }
      sending = true;
      if (sendBtn) {
        sendBtn.disabled = true;
        sendBtn.setAttribute("aria-busy", "true");
        sendBtn.setAttribute("title", msgSending);
      }
      try {
        const r = await fetch(messagesUrl, {
          method: "POST",
          body: fd,
          credentials: "same-origin",
          headers: postHeaders(),
        });
        if (!r.ok) {
          let err = msgSendErr;
          try {
            const j = await r.json();
            if (j.error === "fileTooLarge") {
              err = msgFileLarge;
            } else if (j.error === "empty") {
              err = msgSendErr;
            }
          } catch {
            /* ignore */
          }
          showErr(`${err} (${r.status})`);
          return;
        }
        bodyEl.value = "";
        if (fileEl) {
          fileEl.value = "";
        }
        if (fileNameEl) {
          fileNameEl.textContent = "";
        }
        lastSig = "";
        await load(true);
      } catch {
        showErr(msgSendErr);
      } finally {
        sending = false;
        if (sendBtn) {
          sendBtn.disabled = false;
          sendBtn.removeAttribute("aria-busy");
          sendBtn.removeAttribute("title");
        }
      }
    });

    document.addEventListener("visibilitychange", () => {
      if (!document.hidden) {
        load(true);
      }
    });

    window.addEventListener("application-chat-visible", () => {
      load(true);
    });

    load(true);

    window.setInterval(() => {
      const chatPanel = document.querySelector('[data-app-detail-panel="chat"]');
      if (!document.hidden && !sending && chatPanel?.classList.contains("is-active")) {
        load(true);
      }
    }, 8000);
  };

  window.ingazInitApplicationChat = boot;

  const start = () => {
    boot();
    window.addEventListener("application-chat-visible", () => {
      if (chatBound) {
        window.ingazApplicationChatRefresh?.();
      } else {
        boot();
      }
    });
  };

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", start, { once: true });
  } else {
    start();
  }
})();
