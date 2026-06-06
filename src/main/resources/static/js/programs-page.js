(() => {
  const PAGE_SIZE = 20;

  const root = document.getElementById("programsPage");
  if (!root) {
    return;
  }

  const debounce = (fn, ms = 200) => {
    let t = 0;
    return (...args) => {
      window.clearTimeout(t);
      t = window.setTimeout(() => fn(...args), ms);
    };
  };

  const csrfToken = root.dataset.csrf;
  const csrfHeader = root.dataset.csrfHeader || "X-CSRF-TOKEN";
  const canManage = root.dataset.canManage === "true";

  const msgPagerNone = root.dataset.msgPagerNone || "";
  const msgPagerRange = root.dataset.msgPagerRange || "";
  const msgStatusFull = root.dataset.msgStatusFull || "Full";
  const msgStatusAvailable = root.dataset.msgStatusAvailable || "Available";
  const latinNumFmt = new Intl.NumberFormat("en-US");
  const latinNum = (n) => latinNumFmt.format(Number(n));
  const toLatinDigits = (s) =>
    String(s)
      .replace(/[\u0660-\u0669]/g, (c) => String(c.charCodeAt(0) - 0x0660))
      .replace(/[\u06f0-\u06f9]/g, (c) => String(c.charCodeAt(0) - 0x06f0));
  const fmtPager = (template, shown, from, to, total) =>
    String(template)
      .replace(/\{0\}/g, latinNum(shown))
      .replace(/\{1\}/g, latinNum(from))
      .replace(/\{2\}/g, latinNum(to))
      .replace(/\{3\}/g, latinNum(total));

  const msgAlertName = root.dataset.msgAlertName || "";
  const msgErrDownload = root.dataset.msgErrDownload || "";
  const msgErr403 = root.dataset.msgErr403 || "";
  const msgErr415 = root.dataset.msgErr415 || "";
  const msgErr500 = root.dataset.msgErr500 || "";
  const msgErrHttp = root.dataset.msgErrHttp || "";

  const tableWrap = document.querySelector(".programs-table-wrap");

  const searchInput = document.getElementById("progSearch");
  const uniFilter = document.getElementById("progUniFilter");
  const degreeFilter = document.getElementById("progDegreeFilter");
  const countryFilter = document.getElementById("progCountryFilter");
  const langFilter = document.getElementById("progLangFilter");
  const tbody = document.getElementById("programsTbody");
  const noResults = document.getElementById("programsNoResults");
  const emptyRow = document.getElementById("programsEmptyRow");
  const footerMeta = document.getElementById("programsFooterMeta");
  const exportFilteredPdfBtn = document.getElementById("exportFilteredProgramsPdf");
  const pager = document.getElementById("programsPager");

  const selectedTbody = document.getElementById("programsSelectedTbody");
  const selectedWrap = document.getElementById("programsSelectedWrap");
  const selectedEmpty = document.getElementById("programsSelectedEmpty");
  const openPdfBtn = document.getElementById("openPdfModal");
  const pdfModal = document.getElementById("pdfExportModal");
  const pdfStudent = document.getElementById("pdfStudentName");
  const pdfFilteredHint = document.getElementById("pdfFilteredHint");
  const pdfModalTitle = document.getElementById("pdfExportTitle");
  const confirmPdf = document.getElementById("confirmPdfDownload");
  const pdfExportBusy = document.getElementById("pdfExportBusy");
  const msgExportTooMany = root.dataset.msgExportTooMany || "";
  const msgPdfFilteredTitle = root.dataset.msgPdfFilteredTitle || "";
  const msgExportFilteredPdf = root.dataset.msgExportFilteredPdf || "Download PDF";
  const msgCatalogExportBusy = root.dataset.msgCatalogExportBusy || "Preparing PDF…";
  const defaultPdfModalTitle = pdfModalTitle?.textContent?.trim() || "Download as PDF";

  let pdfExportInFlight = false;
  /** @type {Map<string, object>} */
  const programById = new Map();
  /** @type {object[]} */
  let pagePrograms = [];
  let totalPrograms = 0;
  let currentPage = 1;
  let dataLoaded = false;
  let loadSeq = 0;
  /** @type {string[]} */
  let selectionOrder = [];
  /** @type {"selection"|"filtered"} */
  let pdfExportMode = "selection";
  /** @type {{wrap: HTMLElement, close: () => void}[]} */
  const programFilterPickers = [];

  const closeOtherProgramFilters = (exceptWrap) => {
    programFilterPickers.forEach((picker) => {
      if (picker.wrap !== exceptWrap) {
        picker.close();
      }
    });
  };

  const currencySymbol = (currency) => (currency === "EUR" ? "€" : "$");

  const formatPrice = (amount, currency) => {
    if (amount == null || amount === "") {
      return "—";
    }
    const n = Number(amount);
    if (Number.isNaN(n)) {
      return "—";
    }
    return currencySymbol(currency) + latinNum(Math.round(n));
  };

  const formatYears = (years) => {
    if (years == null || years === "") {
      return "—";
    }
    return latinNum(years);
  };

  const cellText = (value) => {
    const v = (value || "").trim();
    return v || "—";
  };

  const showArabicName = (p) => {
    const ar = (p.nameAr || "").trim();
    const en = (p.name || "").trim();
    if (!ar) {
      return false;
    }
    return !en || ar.toLowerCase() !== en.toLowerCase();
  };

  const selectedUniValues = () =>
    uniFilter
      ? Array.from(uniFilter.selectedOptions)
          .map((o) => o.value)
          .filter(Boolean)
      : [];

  const clearDataRows = () => {
    tbody?.querySelectorAll("tr.prog-data-row").forEach((tr) => tr.remove());
  };

  const syncPickRowStyle = (row, checked) => {
    row?.classList.toggle("prog-data-row--picked", !!checked);
  };

  const formatUpdatedAt = (value) => {
    const v = (value || "").trim();
    return v || "—";
  };

  const openProgramView = (program) => {
    if (!program) {
      return;
    }
    if (canManage) {
      setProgramModalMode("edit", program);
      addProgramModal?.classList.add("is-open");
      return;
    }
    if (program.universityId) {
      window.location.href = `/universities/${encodeURIComponent(program.universityId)}`;
    }
  };

  const buildEditBtn = (program) => {
    const btn = document.createElement("button");
    btn.type = "button";
    btn.className = "btn prog-edit-btn";
    btn.dataset.progId = String(program.id);
    btn.setAttribute("aria-label", "Edit program");
    btn.innerHTML = '<span aria-hidden="true">✎</span>';
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();
      openProgramView(program);
    });
    return btn;
  };

  const renderCostHtml = (before, after, currency) => {
    const beforeTxt = formatPrice(before, currency);
    const afterTxt = formatPrice(after, currency);
    if (beforeTxt === "—" && afterTxt === "—") {
      return "—";
    }
    if (beforeTxt !== "—" && afterTxt !== "—" && beforeTxt !== afterTxt) {
      return `<span class="prog-cost-before">${beforeTxt}</span> <strong class="prog-cost-after">${afterTxt}</strong>`;
    }
    return `<strong class="prog-cost-after">${afterTxt !== "—" ? afterTxt : beforeTxt}</strong>`;
  };

  const updateFooterActions = () => {
    if (exportFilteredPdfBtn) {
      exportFilteredPdfBtn.disabled =
        !dataLoaded || totalPrograms === 0 || pdfExportInFlight;
      if (!pdfExportInFlight) {
        exportFilteredPdfBtn.textContent = msgExportFilteredPdf;
      }
    }
  };

  const buildRow = (p) => {
    const tr = document.createElement("tr");
    const id = String(p.id);
    tr.className = "prog-data-row" + (p.available ? "" : " prog-data-row--unavailable");
    tr.dataset.progId = id;

    const tdCheck = document.createElement("td");
    tdCheck.className = "prog-col-check";
    const cb = document.createElement("input");
    cb.type = "checkbox";
    cb.className = "prog-pick";
    cb.value = id;
    cb.checked = selectionOrder.includes(id);
    cb.setAttribute("aria-label", `Select program: ${p.name || ""}`);
    syncPickRowStyle(tr, cb.checked);
    tdCheck.appendChild(cb);
    tr.appendChild(tdCheck);

    const tdUni = document.createElement("td");
    if (p.universityId && p.universityName) {
      const cell = document.createElement("div");
      cell.className = "prog-uni-cell";
      if (p.universityLogoUrl) {
        const img = document.createElement("img");
        img.className = "prog-uni-logo";
        img.src = p.universityLogoUrl;
        img.width = 28;
        img.height = 28;
        img.alt = "";
        img.loading = "lazy";
        img.referrerPolicy = "no-referrer";
        cell.appendChild(img);
      }
      const link = document.createElement("a");
      link.className = "uni-table-link";
      link.href = `/universities/${encodeURIComponent(p.universityId)}`;
      link.textContent = p.universityName;
      cell.appendChild(link);
      tdUni.appendChild(cell);
    } else {
      tdUni.textContent = "—";
    }
    tr.appendChild(tdUni);

    const tdProg = document.createElement("td");
    const nameEn = document.createElement("div");
    nameEn.className = "prog-name-en";
    nameEn.textContent = p.name || "—";
    tdProg.appendChild(nameEn);
    if (showArabicName(p)) {
      const nameAr = document.createElement("div");
      nameAr.className = "prog-name-ar subtle";
      nameAr.lang = "ar";
      nameAr.dir = "auto";
      nameAr.textContent = p.nameAr;
      tdProg.appendChild(nameAr);
    }
    tr.appendChild(tdProg);

    const addTextCell = (text) => {
      const td = document.createElement("td");
      td.textContent = cellText(text);
      tr.appendChild(td);
    };

    addTextCell(p.degree);
    addTextCell(p.universityCountry);
    addTextCell(p.language);

    const tdBefore = document.createElement("td");
    tdBefore.className = "prog-price-before num-latin";
    tdBefore.lang = "en";
    tdBefore.dir = "ltr";
    tdBefore.textContent = formatPrice(p.beforeDiscount, p.currency);
    tr.appendChild(tdBefore);

    const tdAfter = document.createElement("td");
    tdAfter.className = "prog-price-after num-latin";
    tdAfter.lang = "en";
    tdAfter.dir = "ltr";
    tdAfter.textContent = formatPrice(p.cost, p.currency);
    tr.appendChild(tdAfter);

    const tdCash = document.createElement("td");
    tdCash.className = "num-latin";
    tdCash.lang = "en";
    tdCash.dir = "ltr";
    tdCash.textContent = formatPrice(p.cashPrice, p.currency);
    tr.appendChild(tdCash);

    const tdYears = document.createElement("td");
    tdYears.className = "prog-col-years num-latin";
    tdYears.lang = "en";
    tdYears.dir = "ltr";
    tdYears.textContent = formatYears(p.years);
    tr.appendChild(tdYears);

    const tdStatus = document.createElement("td");
    tdStatus.className = "prog-col-status";
    const statusInner = document.createElement("div");
    statusInner.className = "prog-status-cell";
    const badgeFull = document.createElement("span");
    badgeFull.className = "prog-quota-badge prog-quota-badge--full";
    badgeFull.textContent = msgStatusFull;
    badgeFull.hidden = !!p.available;
    const badgeOpen = document.createElement("span");
    badgeOpen.className = "prog-quota-badge prog-quota-badge--open";
    badgeOpen.textContent = msgStatusAvailable;
    badgeOpen.hidden = !p.available;
    statusInner.append(badgeFull, badgeOpen);
    if (canManage) {
      statusInner.appendChild(buildEditBtn(p));
    }
    tdStatus.appendChild(statusInner);
    tr.appendChild(tdStatus);

    return tr;
  };

  const markReady = () => root.classList.add("is-ready");

  const renderPagination = () => {
    if (!dataLoaded) {
      return;
    }

    clearDataRows();

    if (totalPrograms === 0 && pagePrograms.length === 0) {
      if (emptyRow) {
        emptyRow.hidden = false;
      }
      if (noResults) {
        noResults.hidden = totalPrograms > 0;
      }
      if (footerMeta) {
        footerMeta.textContent = "";
      }
      if (pager) {
        pager.innerHTML = "";
      }
      updateFooterActions();
      markReady();
      return;
    }

    if (emptyRow) {
      emptyRow.hidden = true;
    }

    const total = totalPrograms;
    const pages = Math.max(1, Math.ceil(total / PAGE_SIZE));

    const frag = document.createDocumentFragment();
    pagePrograms.forEach((p) => frag.appendChild(buildRow(p)));
    if (noResults) {
      if (total === 0) {
        noResults.hidden = false;
        tbody?.insertBefore(frag, noResults);
      } else {
        noResults.hidden = true;
        tbody?.appendChild(frag);
      }
    } else {
      tbody?.appendChild(frag);
    }

    const from = total === 0 ? 0 : (currentPage - 1) * PAGE_SIZE + 1;
    const to = total === 0 ? 0 : from + pagePrograms.length - 1;
    if (footerMeta) {
      footerMeta.textContent =
        total === 0 ? msgPagerNone : fmtPager(msgPagerRange, pagePrograms.length, from, to, total);
    }
    updateFooterActions();

    if (pager) {
      pager.innerHTML = "";
      const addNavBtn = (label, targetPage, disabled) => {
        const b = document.createElement("button");
        b.type = "button";
        b.className = "pager-btn";
        b.lang = "en";
        b.dir = "ltr";
        b.textContent = label;
        b.disabled = disabled;
        if (!disabled) {
          b.addEventListener("click", () => {
            loadProgramsPage(targetPage);
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
          const pg = cur + d;
          if (pg >= 1 && pg <= pageCount) {
            set.add(pg);
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
        b.textContent = latinNum(p);
        b.lang = "en";
        b.dir = "ltr";
        b.addEventListener("click", () => {
          loadProgramsPage(p);
        });
        pager.appendChild(b);
      }
      pager.appendChild(addNavBtn("›", currentPage + 1, currentPage >= pages));
    }

    markReady();
  };

  let renderQueued = false;
  const renderPaginationSoon = () => {
    if (renderQueued) {
      return;
    }
    renderQueued = true;
    requestAnimationFrame(() => {
      renderQueued = false;
      renderPagination();
    });
  };

  const scheduleFilterUpdate = debounce(() => {
    loadProgramsPage(1);
  }, 220);

  const syncCheckboxState = (id, checked) => {
    tbody?.querySelectorAll(`tr.prog-data-row[data-prog-id="${id}"]`).forEach((row) => {
      row.querySelectorAll(".prog-pick").forEach((cb) => {
        cb.checked = checked;
      });
      syncPickRowStyle(row, checked);
    });
  };

  const clearAllSelection = () => {
    selectionOrder = [];
    tbody?.querySelectorAll("tr.prog-data-row").forEach((row) => {
      row.querySelectorAll(".prog-pick").forEach((cb) => {
        cb.checked = false;
      });
      syncPickRowStyle(row, false);
    });
    renderSelected();
  };

  const renderSelected = () => {
    if (!selectedTbody || !selectedWrap || !selectedEmpty || !openPdfBtn) {
      return;
    }
    selectedTbody.innerHTML = "";
    if (selectionOrder.length === 0) {
      selectedEmpty.hidden = false;
      selectedWrap.hidden = true;
      openPdfBtn.disabled = true;
      return;
    }
    selectedEmpty.hidden = true;
    selectedWrap.hidden = false;
    openPdfBtn.disabled = false;

    selectionOrder.forEach((id) => {
      const p = programById.get(id);
      if (!p) {
        return;
      }

      const tr = document.createElement("tr");

      const tdR = document.createElement("td");
      const rm = document.createElement("button");
      rm.type = "button";
      rm.className = "prog-remove-btn";
      rm.setAttribute("aria-label", "Remove from selection");
      rm.textContent = "×";
      rm.addEventListener("click", () => {
        selectionOrder = selectionOrder.filter((x) => x !== id);
        syncCheckboxState(id, false);
        renderSelected();
      });
      tdR.appendChild(rm);
      tr.appendChild(tdR);

      const tdProg = document.createElement("td");
      const nameEn = document.createElement("div");
      nameEn.className = "prog-name-en";
      nameEn.textContent = p.name || "—";
      tdProg.appendChild(nameEn);
      if (showArabicName(p)) {
        const nameAr = document.createElement("div");
        nameAr.className = "prog-name-ar subtle";
        nameAr.lang = "ar";
        nameAr.dir = "auto";
        nameAr.textContent = p.nameAr;
        tdProg.appendChild(nameAr);
      }
      tr.appendChild(tdProg);

      const tdUni = document.createElement("td");
      tdUni.textContent = p.universityName || "—";
      tr.appendChild(tdUni);

      const addNumCell = (text, extraClass) => {
        const td = document.createElement("td");
        td.textContent = toLatinDigits(String(text));
        td.classList.add("num-latin");
        if (extraClass) {
          td.classList.add(extraClass);
        }
        td.lang = "en";
        td.dir = "ltr";
        tr.appendChild(td);
      };

      addNumCell(cellText(p.language));
      addNumCell(cellText(p.degree));
      addNumCell(formatPrice(p.beforeDiscount, p.currency), "prog-price-before");
      addNumCell(formatPrice(p.cost, p.currency), "prog-price-after");
      addNumCell(formatYears(p.years));

      selectedTbody.appendChild(tr);
    });
  };

  /** Custom single-select (same UI as university filter) — lives here so it always runs after the page script loads. */
  const initProgramsFilterSingleSelect = (nativeSelect, opts) => {
    const noResultsText = (opts && opts.noResultsText) || "No matches";
    if (!nativeSelect || nativeSelect.multiple) {
      return;
    }
    const field = nativeSelect.closest(".programs-filter-select");
    if (!field || field.querySelector(".prog-uni-multi")) {
      return;
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
    clearBtn.hidden = true;

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
      clearBtn.hidden = !(nativeSelect.value && String(nativeSelect.value).trim());
    };

    const syncInputClosed = () => {
      const sel = nativeSelect.selectedOptions[0];
      input.value = sel ? (sel.textContent || "").trim() : "";
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
      wrap.classList.remove("is-open");
      control.setAttribute("aria-expanded", "false");
      dropdown.classList.remove("is-open");
      unportalDropdown();
      syncInputClosed();
    };

    const renderOptions = () => {
      const q = input.value.trim().toLowerCase();
      list.innerHTML = "";
      getOptions()
        .filter((o) => o.value)
        .filter((o) => {
          const t = (o.textContent || "").trim().toLowerCase();
          return !q || t.includes(q);
        })
        .forEach((o) => {
          const li = document.createElement("li");
          const btn = document.createElement("button");
          btn.type = "button";
          btn.className = "prog-uni-option";
          btn.textContent = (o.textContent || "").trim() || "—";
          if (o.value === nativeSelect.value) {
            btn.classList.add("is-selected");
          }
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

    const open = () => {
      closeOtherProgramFilters(wrap);
      wrap.classList.add("is-open");
      control.setAttribute("aria-expanded", "true");
      input.value = "";
      portalDropdown();
      dropdown.classList.add("is-open");
      renderOptions();
      input.focus();
    };

    programFilterPickers.push({ wrap, close });

    const onViewportChange = () => {
      if (dropdown.classList.contains("is-open")) {
        positionDropdown();
      }
    };
    window.addEventListener("resize", onViewportChange);
    window.addEventListener("scroll", onViewportChange, true);

    control.addEventListener("click", (e) => {
      e.preventDefault();
      if (wrap.classList.contains("is-open")) {
        close();
      } else {
        open();
      }
    });
    control.addEventListener("keydown", (e) => {
      if (e.key === "Enter" || e.key === " " || e.key === "ArrowDown") {
        e.preventDefault();
        if (!wrap.classList.contains("is-open")) {
          open();
        }
      } else if (e.key === "Escape") {
        close();
      }
    });
    clearBtn.addEventListener("click", (e) => {
      e.stopPropagation();
      nativeSelect.selectedIndex = 0;
      nativeSelect.dispatchEvent(new Event("change", { bubbles: true }));
      syncInputClosed();
      if (wrap.classList.contains("is-open")) {
        renderOptions();
      }
      input.focus();
    });
    input.addEventListener("mousedown", (e) => e.stopPropagation());
    input.addEventListener("focus", () => {
      if (!wrap.classList.contains("is-open")) {
        open();
      }
    });
    input.addEventListener("click", (e) => {
      e.stopPropagation();
      if (!wrap.classList.contains("is-open")) {
        open();
      }
    });
    input.addEventListener("input", () => {
      if (!wrap.classList.contains("is-open")) {
        open();
        return;
      }
      renderOptions();
    });

    const docClose = (e) => {
      if (!wrap.contains(e.target) && !dropdown.contains(e.target)) {
        close();
      }
    };
    document.addEventListener("click", docClose);
    nativeSelect.addEventListener("change", () => {
      if (!wrap.classList.contains("is-open")) {
        syncInputClosed();
      }
      updateClearVis();
    });

    syncInputClosed();
    return {
      refresh() {
        if (!wrap.classList.contains("is-open")) {
          syncInputClosed();
        } else {
          renderOptions();
        }
        updateClearVis();
      },
    };
  };

  const initUniversityFilterMultiSelect = () => {
    if (!uniFilter) {
      return;
    }
    const field = uniFilter.closest(".programs-filter-select");
    if (!field || field.querySelector(".prog-uni-multi")) {
      return;
    }

    const options = Array.from(uniFilter.options).filter((o) => o.value);
    const placeholder = uniFilter.dataset.placeholder || "University";
    uniFilter.classList.add("prog-uni-native");

    const wrap = document.createElement("div");
    wrap.className = "prog-uni-multi";

    const control = document.createElement("div");
    control.className = "prog-uni-control";
    const tags = document.createElement("span");
    tags.className = "prog-uni-tags";

    const input = document.createElement("input");
    input.type = "text";
    input.className = "prog-uni-input";
    input.setAttribute("autocomplete", "off");
    input.setAttribute("placeholder", placeholder);
    input.setAttribute("aria-label", placeholder);

    const clearBtn = document.createElement("button");
    clearBtn.type = "button";
    clearBtn.className = "prog-uni-clear";
    clearBtn.setAttribute("aria-label", "Clear selected universities");
    clearBtn.textContent = "×";

    const chevBtn = document.createElement("button");
    chevBtn.type = "button";
    chevBtn.className = "prog-uni-chevron";
    chevBtn.setAttribute("aria-label", "Show universities");

    const actions = document.createElement("div");
    actions.className = "prog-uni-actions";
    actions.append(clearBtn, chevBtn);

    control.append(tags, input, actions);

    const dropdown = document.createElement("div");
    dropdown.className = "prog-uni-dropdown";
    const list = document.createElement("ul");
    list.className = "prog-uni-list";
    dropdown.appendChild(list);
    wrap.append(control, dropdown);
    field.appendChild(wrap);

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
      wrap.classList.remove("is-open");
      input.setAttribute("aria-expanded", "false");
      dropdown.classList.remove("is-open");
      unportalDropdown();
    };

    const open = () => {
      closeOtherProgramFilters(wrap);
      wrap.classList.add("is-open");
      input.setAttribute("aria-expanded", "true");
      portalDropdown();
      dropdown.classList.add("is-open");
      renderOptions();
    };

    programFilterPickers.push({ wrap, close });

    const toggle = () => {
      if (wrap.classList.contains("is-open")) {
        close();
      } else {
        open();
      }
    };

    const renderTags = () => {
      tags.innerHTML = "";
      const selected = selectedUniValues();
      clearBtn.hidden = selected.length === 0;
      if (selected.length === 0) {
        input.placeholder = placeholder;
        return;
      }
      selected.forEach((value) => {
        const tag = document.createElement("span");
        tag.className = "prog-uni-tag";
        const label = document.createElement("span");
        label.className = "prog-uni-tag-label";
        label.textContent = value;
        const rm = document.createElement("button");
        rm.type = "button";
        rm.className = "prog-uni-tag-rm";
        rm.textContent = "×";
        rm.setAttribute("aria-label", `Remove ${value}`);
        rm.addEventListener("click", (e) => {
          e.stopPropagation();
          const opt = options.find((o) => o.value === value);
          if (opt) {
            opt.selected = false;
          }
          syncUniUi();
          scheduleFilterUpdate();
        });
        tag.append(label, rm);
        tags.appendChild(tag);
      });
      input.placeholder = "";
    };

    const renderOptions = () => {
      const q = input.value.trim().toLowerCase();
      const selected = new Set(selectedUniValues());
      list.innerHTML = "";
      options
        .filter((o) => !q || o.text.toLowerCase().includes(q))
        .forEach((o) => {
          const li = document.createElement("li");
          const btn = document.createElement("button");
          btn.type = "button";
          btn.className = "prog-uni-option";
          btn.textContent = o.text;
          if (selected.has(o.value)) {
            btn.classList.add("is-selected");
          }
          btn.addEventListener("click", (e) => {
            e.preventDefault();
            e.stopPropagation();
            o.selected = !o.selected;
            input.value = "";
            syncUniUi();
            scheduleFilterUpdate();
            input.focus();
          });
          li.appendChild(btn);
          list.appendChild(li);
        });
      if (!list.children.length) {
        const li = document.createElement("li");
        li.className = "prog-uni-no-results";
        li.textContent = "No universities found";
        list.appendChild(li);
      }
    };

    const syncUniUi = () => {
      renderTags();
      renderOptions();
    };

    const debouncedRenderOptions = debounce(renderOptions, 120);

    const openAndFocus = () => {
      open();
      input.focus();
    };

    control.addEventListener("mousedown", (e) => {
      if (e.target.closest(".prog-uni-tag-rm, .prog-uni-clear, .prog-uni-chevron")) {
        return;
      }
      if (e.target !== input) {
        e.preventDefault();
        openAndFocus();
      } else if (!wrap.classList.contains("is-open")) {
        open();
      }
    });

    tags.addEventListener("mousedown", (e) => {
      if (e.target.closest(".prog-uni-tag-rm")) {
        return;
      }
      e.preventDefault();
      openAndFocus();
    });

    chevBtn.addEventListener("mousedown", (e) => {
      e.preventDefault();
      e.stopPropagation();
      toggle();
      input.focus();
    });

    input.addEventListener("focus", () => open());

    window.addEventListener(
      "scroll",
      () => {
        if (wrap.classList.contains("is-open")) {
          positionDropdown();
        }
      },
      true
    );

    input.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        e.preventDefault();
        input.value = "";
        close();
        input.blur();
        syncUniUi();
      } else if (e.key === "ArrowDown" && !wrap.classList.contains("is-open")) {
        e.preventDefault();
        open();
      }
    });

    clearBtn.addEventListener("click", (e) => {
      e.stopPropagation();
      options.forEach((o) => {
        o.selected = false;
      });
      input.value = "";
      syncUniUi();
      scheduleFilterUpdate();
      openAndFocus();
    });

    input.addEventListener("input", () => {
      open();
      debouncedRenderOptions();
    });

    document.addEventListener("mousedown", (e) => {
      if (!wrap.contains(e.target) && !dropdown.contains(e.target)) {
        close();
      }
    });

    syncUniUi();
  };

  const setPdfExportBusy = (busy) => {
    pdfExportInFlight = busy;
    pdfModal?.classList.toggle("pdf-export-modal--busy", busy);
    pdfModal?.setAttribute("aria-busy", busy ? "true" : "false");
    if (pdfExportBusy) {
      pdfExportBusy.hidden = !busy;
    }
    if (confirmPdf) {
      confirmPdf.disabled = busy;
    }
    if (pdfStudent) {
      pdfStudent.disabled = busy;
    }
    pdfModal?.querySelectorAll("button[data-close-pdf-modal]").forEach((btn) => {
      btn.disabled = busy;
    });
    updateFooterActions();
    if (openPdfBtn) {
      openPdfBtn.disabled = busy || selectionOrder.length === 0;
    }
  };

  const addProgramModal = document.getElementById("addProgramModal");
  const openAddProgramBtn = document.getElementById("openAddProgramModal");
  const programUpsertForm = document.getElementById("programUpsertForm");
  const programSaveBtn = document.getElementById("programSaveBtn");
  const programDeleteBtn = document.getElementById("programDeleteBtn");
  const programModalUni = document.getElementById("programModalUniversity");
  let programModalUniPicker = null;

  const setProgramModalMode = (mode, program = null) => {
    if (!programUpsertForm) {
      return;
    }
    const nameInput = programUpsertForm.querySelector('input[name="name"]');
    const nameArInput = programUpsertForm.querySelector('input[name="nameAr"]');
    const uniSelect = programModalUni || programUpsertForm.querySelector('select[name="universityId"]');
    const languageInput = programUpsertForm.querySelector('input[name="language"]');
    const degreeInput = programUpsertForm.querySelector('input[name="degree"]');
    const beforeInput = programUpsertForm.querySelector('input[name="beforeDiscount"]');
    const costInput = programUpsertForm.querySelector('input[name="cost"]');
    const cashInput = programUpsertForm.querySelector('input[name="cashPrice"]');
    const yearsInput = programUpsertForm.querySelector('input[name="years"]');
    const availableInput = programUpsertForm.querySelector('input[name="available"]');
    const title = document.getElementById("addProgramModalTitle");

    if (mode === "add") {
      programUpsertForm.action = "/departments";
      if (programDeleteBtn) {
        programDeleteBtn.hidden = true;
      }
      if (programSaveBtn) {
        programSaveBtn.textContent = "Save program";
      }
      if (title) {
        title.textContent = "Add program";
      }
      programUpsertForm.reset();
      if (availableInput) {
        availableInput.checked = true;
      }
      if (uniSelect) {
        uniSelect.dispatchEvent(new Event("change", { bubbles: true }));
        programModalUniPicker?.refresh();
      }
      return;
    }

    if (!program) {
      return;
    }
    const id = program.id || "";
    if (!id) {
      return;
    }
    programUpsertForm.action = `/departments/${encodeURIComponent(id)}/update`;
    if (programDeleteBtn) {
      programDeleteBtn.hidden = false;
      programDeleteBtn.setAttribute("formaction", `/departments/${encodeURIComponent(id)}/delete`);
    }
    if (programSaveBtn) {
      programSaveBtn.textContent = "Update program";
    }
    if (title) {
      title.textContent = "Edit program";
    }
    if (nameInput) nameInput.value = program.name || "";
    if (nameArInput) nameArInput.value = program.nameAr || "";
    if (uniSelect) {
      uniSelect.value = program.universityId || "";
      uniSelect.dispatchEvent(new Event("change", { bubbles: true }));
      programModalUniPicker?.refresh();
    }
    if (languageInput) languageInput.value = program.language || "";
    if (degreeInput) degreeInput.value = program.degree || "";
    if (beforeInput) {
      beforeInput.value = program.beforeDiscount != null ? String(program.beforeDiscount) : "";
    }
    if (costInput) costInput.value = program.cost != null ? String(program.cost) : "";
    if (cashInput) cashInput.value = program.cashPrice != null ? String(program.cashPrice) : "";
    if (yearsInput) yearsInput.value = program.years != null ? String(program.years) : "";
    if (availableInput) {
      availableInput.checked = !!program.available;
    }
  };

  const openAddProgramModalFn = () => {
    setProgramModalMode("add");
    addProgramModal?.classList.add("is-open");
  };

  openAddProgramBtn?.addEventListener("click", openAddProgramModalFn);
  addProgramModal?.querySelectorAll("[data-close-modal]").forEach((el) => {
    el.addEventListener("click", () => addProgramModal?.classList.remove("is-open"));
  });

  const handlePickChange = (cb) => {
    if (!cb) {
      return;
    }
    const id = cb.value;
    if (!id) {
      return;
    }
    if (cb.checked) {
      if (!selectionOrder.includes(id)) {
        selectionOrder.push(id);
      }
    } else {
      selectionOrder = selectionOrder.filter((x) => x !== id);
    }
    const row = cb.closest("tr.prog-data-row");
    const card = cb.closest(".programs-grid-card");
    syncPickRowStyle(row, cb.checked);
    card?.classList.toggle("programs-grid-card--picked", !!cb.checked);
    renderSelected();
  };

  tbody?.addEventListener("change", (e) => {
    const cb = e.target.closest(".prog-pick");
    if (!cb || !tbody.contains(cb)) {
      return;
    }
    handlePickChange(cb);
  });

  tbody?.addEventListener("click", (e) => {
    const btn = e.target.closest(".prog-edit-btn");
    if (!btn || !tbody.contains(btn)) {
      return;
    }
    const program = programById.get(btn.dataset.progId || "");
    if (!program) {
      return;
    }
    setProgramModalMode("edit", program);
    addProgramModal?.classList.add("is-open");
  });

  const applyFiltersNow = () => {
    loadProgramsPage(1);
  };

  searchInput?.addEventListener("input", scheduleFilterUpdate);
  degreeFilter?.addEventListener("change", applyFiltersNow);
  countryFilter?.addEventListener("change", applyFiltersNow);
  langFilter?.addEventListener("change", applyFiltersNow);

  const resetPdfModalUi = () => {
    if (pdfModalTitle) {
      pdfModalTitle.textContent =
        pdfExportMode === "filtered" && msgPdfFilteredTitle
          ? msgPdfFilteredTitle
          : defaultPdfModalTitle;
    }
    if (pdfFilteredHint) {
      pdfFilteredHint.hidden = pdfExportMode !== "filtered";
    }
    if (pdfStudent) {
      pdfStudent.required = pdfExportMode === "selection";
      pdfStudent.removeAttribute("aria-required");
      if (pdfExportMode === "selection") {
        pdfStudent.setAttribute("aria-required", "true");
      }
    }
  };

  const openSelectionPdfModal = () => {
    if (!pdfModal || selectionOrder.length === 0) {
      return;
    }
    pdfExportMode = "selection";
    resetPdfModalUi();
    pdfModal.classList.add("is-open");
    pdfStudent?.focus();
  };

  const openFilteredPdfModal = () => {
    if (!pdfModal || !dataLoaded || totalPrograms === 0) {
      return;
    }
    pdfExportMode = "filtered";
    resetPdfModalUi();
    pdfModal.classList.add("is-open");
    pdfStudent?.focus();
  };

  const closeModal = () => {
    if (pdfExportInFlight) {
      return;
    }
    pdfModal?.classList.remove("is-open");
  };

  const setCatalogExportBusy = (busy) => {
    pdfExportInFlight = busy;
    if (exportFilteredPdfBtn) {
      exportFilteredPdfBtn.disabled = busy || !dataLoaded || totalPrograms === 0;
      exportFilteredPdfBtn.setAttribute("aria-busy", busy ? "true" : "false");
      exportFilteredPdfBtn.textContent = busy ? msgCatalogExportBusy : msgExportFilteredPdf;
    }
  };

  const exportFilteredProgramsDirect = async () => {
    if (!csrfToken || !dataLoaded || totalPrograms === 0 || pdfExportInFlight) {
      return;
    }
    setCatalogExportBusy(true);
    try {
      const res = await fetch("/api/programs/export-pdf", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          [csrfHeader]: csrfToken,
        },
        credentials: "same-origin",
        body: JSON.stringify(buildFilterExportPayload()),
      });
      if (!res.ok) {
        const hint =
          res.status === 400 && msgExportTooMany
            ? msgExportTooMany
            : res.status === 403
              ? msgErr403 || "Session security check failed. Refresh the page and try again."
              : res.status >= 500
                ? msgErr500 || "Server could not build the PDF. If it keeps happening, contact support."
                : String(msgErrHttp || "").replace("{0}", String(res.status)) ||
                  `Request failed (HTTP ${res.status}). Refresh and try again.`;
        window.alert(hint);
        return;
      }
      const blob = await res.blob();
      downloadPdfBlob(blob, "programs-catalog", "catalog");
    } catch {
      window.alert(msgErrDownload);
    } finally {
      setCatalogExportBusy(false);
    }
  };

  openPdfBtn?.addEventListener("click", openSelectionPdfModal);
  exportFilteredPdfBtn?.addEventListener("click", exportFilteredProgramsDirect);
  pdfModal?.querySelectorAll("[data-close-pdf-modal]").forEach((el) => {
    el.addEventListener("click", closeModal);
  });
  document.addEventListener("keydown", (e) => {
    if (e.key !== "Escape") {
      return;
    }
    if (addProgramModal?.classList.contains("is-open")) {
      addProgramModal.classList.remove("is-open");
      return;
    }
    if (pdfModal?.classList.contains("is-open")) {
      if (pdfExportInFlight) {
        return;
      }
      closeModal();
    }
  });

  const buildFilterExportPayload = () => {
    const payload = {};
    const q = (searchInput?.value || "").trim();
    if (q) {
      payload.search = q;
    }
    const deg = (degreeFilter?.value || "").trim();
    if (deg) {
      payload.degree = deg;
    }
    const lang = (langFilter?.value || "").trim();
    if (lang) {
      payload.language = lang;
    }
    const country = (countryFilter?.value || "").trim();
    if (country) {
      payload.country = country;
    }
    const unis = selectedUniValues();
    if (unis.length > 0) {
      payload.university = unis;
    }
    return payload;
  };

  const pdfErrorHint = (res) => {
    if (res.status === 400 && pdfExportMode === "filtered" && msgExportTooMany) {
      return msgExportTooMany;
    }
    if (res.status === 403) {
      return msgErr403 || "Session security check failed. Refresh the page and try again.";
    }
    if (res.status === 415) {
      return msgErr415 || "This page is using an old script. Hard-refresh and try again.";
    }
    if (res.status >= 500) {
      return msgErr500 || "Server could not build the PDF. If it keeps happening, contact support.";
    }
    return (
      String(msgErrHttp || "").replace("{0}", String(res.status)) ||
      `Request failed (HTTP ${res.status}). Refresh and try again.`
    );
  };

  const downloadPdfBlob = (blob, filenamePrefix, title) => {
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    const safe = title.replace(/[^a-zA-Z0-9._-]+/g, "-").replace(/^-+|-+$/g, "") || "programs";
    a.download = `${filenamePrefix}-${safe}.pdf`;
    document.body.appendChild(a);
    a.click();
    a.remove();
    URL.revokeObjectURL(url);
  };

  confirmPdf?.addEventListener("click", async () => {
    if (!csrfToken) {
      return;
    }

    const student = (pdfStudent?.value || "").trim();
    if (pdfExportMode === "selection") {
      if (selectionOrder.length === 0) {
        return;
      }
      if (!student) {
        window.alert(msgAlertName);
        pdfStudent?.focus();
        return;
      }
    }

    const isFiltered = pdfExportMode === "filtered";
    const payload = isFiltered
      ? { ...buildFilterExportPayload(), studentName: student || "Programs" }
      : { studentName: student, programIds: selectionOrder };

    const endpoint = isFiltered ? "/api/programs/export-pdf" : "/departments/export-pdf";
    const filenamePrefix = isFiltered ? "programs-catalog" : "programs";
    const downloadTitle = student || (isFiltered ? "Programs" : "student");

    setPdfExportBusy(true);
    let downloaded = false;
    try {
      const res = await fetch(endpoint, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          [csrfHeader]: csrfToken,
        },
        credentials: "same-origin",
        body: JSON.stringify(payload),
      });
      if (!res.ok) {
        window.alert(pdfErrorHint(res));
        return;
      }
      const blob = await res.blob();
      downloadPdfBlob(blob, filenamePrefix, downloadTitle);
      downloaded = true;
      if (!isFiltered) {
        clearAllSelection();
        if (pdfStudent) {
          pdfStudent.value = "";
        }
      }
    } catch {
      window.alert(msgErrDownload);
    } finally {
      setPdfExportBusy(false);
      if (downloaded) {
        pdfModal?.classList.remove("is-open");
      }
    }
  });

  const indexPrograms = (programs) => {
    for (let i = 0; i < programs.length; i++) {
      const p = programs[i];
      if (p?.id) {
        programById.set(String(p.id), p);
      }
    }
  };

  const buildProgramsQuery = (page) => {
    const params = new URLSearchParams();
    params.set("page", String(page));
    params.set("size", String(PAGE_SIZE));
    const q = (searchInput?.value || "").trim();
    if (q) {
      params.set("search", q);
    }
    const deg = (degreeFilter?.value || "").trim();
    if (deg) {
      params.set("degree", deg);
    }
    const lang = (langFilter?.value || "").trim();
    if (lang) {
      params.set("language", lang);
    }
    const country = (countryFilter?.value || "").trim();
    if (country) {
      params.set("country", country);
    }
    selectedUniValues().forEach((u) => params.append("university", u));
    return params;
  };

  const loadProgramsPage = async (page = currentPage) => {
    const seq = ++loadSeq;
    currentPage = Math.max(1, page);
    dataLoaded = false;
    updateFooterActions();
    clearDataRows();
    if (emptyRow) {
      emptyRow.hidden = false;
      const td = emptyRow.querySelector("td");
      if (td) {
        td.textContent = "Loading…";
      }
    }
    if (noResults) {
      noResults.hidden = true;
    }

    try {
      const res = await fetch(`/api/programs/data?${buildProgramsQuery(currentPage)}`, {
        credentials: "same-origin",
      });
      if (seq !== loadSeq) {
        return;
      }
      if (!res.ok) {
        throw new Error(`HTTP ${res.status}`);
      }
      const body = await res.json();
      if (seq !== loadSeq) {
        return;
      }
      pagePrograms = Array.isArray(body.items) ? body.items : [];
      totalPrograms = Number(body.total) || 0;
      if (body.page) {
        currentPage = Number(body.page) || currentPage;
      }
      indexPrograms(pagePrograms);
      dataLoaded = true;
      renderPagination();
    } catch (err) {
      console.error("Programs load failed", err);
      pagePrograms = [];
      totalPrograms = 0;
      dataLoaded = true;
      if (emptyRow) {
        emptyRow.hidden = false;
        const td = emptyRow.querySelector("td");
        if (td) {
          td.textContent = "Could not load programs. Refresh the page.";
        }
      }
      if (pager) {
        pager.innerHTML = "";
      }
      if (footerMeta) {
        footerMeta.textContent = "";
      }
      updateFooterActions();
      markReady();
    }
  };

  const initFilterSingleSelects = () => {
    const noResultsText = root.dataset.msgNoMatch || "No matches";
    const pickerOpts = { noResultsText };
    const initSingle =
      typeof window.initIngazgateSingleSelect === "function"
        ? window.initIngazgateSingleSelect
        : initProgramsFilterSingleSelect;

    root.querySelectorAll("select[data-programs-page-filter]").forEach((select) => {
      const field = select.closest(".programs-filter-select");
      if (!field || field.querySelector(".prog-uni-multi")) {
        return;
      }
      const picker = initSingle(select, pickerOpts);
      if (picker && typeof picker.refresh === "function") {
        picker.refresh();
      }
    });

    if (programModalUni) {
      const modalField = programModalUni.closest(".programs-filter-select");
      if (modalField && !modalField.querySelector(".prog-uni-multi")) {
        programModalUniPicker = initSingle(programModalUni, pickerOpts);
      }
    }
  };

  const boot = () => {
    try {
      initUniversityFilterMultiSelect();
      initFilterSingleSelects();
    } catch (err) {
      console.error("Programs filters failed", err);
    }
    loadProgramsPage(1);
  };

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", boot, { once: true });
  } else {
    boot();
  }

  window.addEventListener(
    "resize",
    debounce(() => {
      const openDropdown = document.querySelector("body > .prog-uni-dropdown.is-open");
      if (openDropdown) {
        const controlEl = document
          .querySelector(".prog-uni-multi.is-open")
          ?.querySelector(".prog-uni-control");
        if (controlEl) {
          const r = controlEl.getBoundingClientRect();
          openDropdown.style.left = `${Math.round(r.left)}px`;
          openDropdown.style.top = `${Math.round(r.bottom + 6)}px`;
          openDropdown.style.width = `${Math.round(r.width)}px`;
        }
      }
    }, 120)
  );
})();
