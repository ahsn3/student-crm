(() => {
  const init = () => {
    const root = document.querySelector(".application-detail-portal");
    if (!root) return;

    if (location.hash === "#chat" || location.hash === "#conversation") {
      const url = new URL(location.href);
      url.hash = "";
      url.searchParams.set("tab", "chat");
      location.replace(url.pathname + url.search);
      return;
    }

    const attachForm = document.getElementById("applicationAttachForm");
    const attachInput = document.getElementById("applicationAttachInput");
    const attachDropzone = document.getElementById("applicationAttachDropzone");
    const attachPrompt = document.getElementById("applicationAttachPrompt");
    const attachPreview = document.getElementById("applicationAttachPreview");
    const attachSubmit = document.getElementById("applicationAttachSubmit");

    const stagedFiles = [];

    const fileKey = (f) => `${f.name}::${f.size}::${f.lastModified}`;

    const escHtml = (s) =>
      String(s || "")
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/"/g, "&quot;");

    const syncInputFromStaged = () => {
      if (!attachInput || stagedFiles.length === 0) return false;
      try {
        const dt = new DataTransfer();
        stagedFiles.forEach((f) => dt.items.add(f));
        attachInput.files = dt.files;
        return attachInput.files.length > 0;
      } catch {
        return attachInput.files && attachInput.files.length > 0;
      }
    };

    const renderPreview = () => {
      if (!attachPreview) return;
      if (!stagedFiles.length) {
        attachPreview.classList.remove("is-visible");
        attachPreview.innerHTML = "";
        attachDropzone?.classList.remove("has-file");
        if (attachPrompt) attachPrompt.hidden = false;
        if (attachSubmit) {
          attachSubmit.disabled = true;
          attachSubmit.classList.remove("is-ready", "is-uploading");
        }
        return;
      }
      attachDropzone?.classList.add("has-file");
      if (attachPrompt) attachPrompt.hidden = true;
      attachPreview.classList.add("is-visible");
      attachPreview.innerHTML = stagedFiles
        .map(
          (f, i) =>
            `<li class="application-detail-attach-queue-item"><span class="application-detail-attach-queue-name">${escHtml(
              f.name
            )}</span><button type="button" class="application-detail-attach-queue-remove" data-idx="${i}" aria-label="Remove">×</button></li>`
        )
        .join("");
      attachPreview.querySelectorAll(".application-detail-attach-queue-remove").forEach((btn) => {
        btn.addEventListener("click", (e) => {
          e.preventDefault();
          e.stopPropagation();
          const idx = Number(btn.dataset.idx);
          if (!Number.isNaN(idx)) {
            stagedFiles.splice(idx, 1);
            syncInputFromStaged();
            renderPreview();
          }
        });
      });
      if (attachSubmit) {
        attachSubmit.disabled = false;
        attachSubmit.classList.add("is-ready");
      }
    };

    const addFiles = (fileList) => {
      if (!fileList?.length) return;
      const seen = new Set(stagedFiles.map(fileKey));
      Array.from(fileList).forEach((f) => {
        const k = fileKey(f);
        if (!seen.has(k)) {
          seen.add(k);
          stagedFiles.push(f);
        }
      });
      syncInputFromStaged();
      renderPreview();
    };

    attachInput?.addEventListener("change", () => {
      addFiles(attachInput.files);
    });

    if (attachDropzone) {
      ["dragenter", "dragover"].forEach((ev) => {
        attachDropzone.addEventListener(ev, (e) => {
          e.preventDefault();
          e.stopPropagation();
          attachDropzone.classList.add("is-dragover");
        });
      });
      ["dragleave", "drop"].forEach((ev) => {
        attachDropzone.addEventListener(ev, (e) => {
          e.preventDefault();
          e.stopPropagation();
          attachDropzone.classList.remove("is-dragover");
        });
      });
      attachDropzone.addEventListener("drop", (e) => {
        addFiles(e.dataTransfer?.files);
      });
    }

    attachForm?.addEventListener("submit", (e) => {
      if (!stagedFiles.length) {
        e.preventDefault();
        window.alert("Please choose at least one file first.");
        return;
      }
      const synced = syncInputFromStaged();
      if (!synced && (!attachInput?.files || attachInput.files.length === 0)) {
        e.preventDefault();
        window.alert("Could not prepare files for upload. Please select your files again.");
        return;
      }
      if (attachSubmit) {
        attachSubmit.disabled = true;
        attachSubmit.classList.remove("is-ready");
        attachSubmit.classList.add("is-uploading");
        attachSubmit.textContent = attachSubmit.dataset.uploadingLabel || "Uploading…";
      }
    });

    if (attachSubmit) {
      attachSubmit.dataset.defaultLabel = attachSubmit.textContent.trim();
      attachSubmit.dataset.uploadingLabel = "Uploading…";
      attachSubmit.disabled = true;
    }

    renderPreview();

    const chatScroll = document.querySelector(".application-chat-thread");
    if (chatScroll) {
      chatScroll.scrollTop = chatScroll.scrollHeight;
    }
  };

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init, { once: true });
  } else {
    init();
  }
})();
