(() => {
  const STORAGE_KEY = "ingazgate-theme";
  const DARK = "dark";
  const LIGHT = "light";
  const RAMA = "rama";

  function ramaEligible() {
    return document.documentElement.getAttribute("data-rama-theme-eligible") === "true";
  }

  function normalizeTheme(stored) {
    if (stored === RAMA && !ramaEligible()) {
      return DARK;
    }
    if (stored === DARK || stored === LIGHT || stored === RAMA) {
      return stored;
    }
    return DARK;
  }

  function getTheme() {
    try {
      return normalizeTheme(localStorage.getItem(STORAGE_KEY));
    } catch {
      return DARK;
    }
  }

  function updateChromeColor() {
    const el = document.getElementById("ingazgate-theme-color");
    if (!el) {
      return;
    }
    const t = document.documentElement.getAttribute("data-theme") || DARK;
    const authPage = document.body && document.body.classList.contains("auth-body");
    const navOpen = document.body && document.body.classList.contains("nav-open");

    const authMap = {
      [DARK]: "#0f172a",
      [LIGHT]: "#f8fafc",
      [RAMA]: "#fff0f3",
    };
    const shellMap = {
      [DARK]: { main: "#0f172a", side: "#0f172a" },
      [LIGHT]: { main: "#f8fafc", side: "#0f172a" },
      [RAMA]: { main: "#fdf7f8", side: "#4a0e2e" },
    };

    if (authPage) {
      el.setAttribute("content", authMap[t] || authMap[DARK]);
      return;
    }
    const sh = shellMap[t] || shellMap[DARK];
    el.setAttribute("content", navOpen ? sh.side : sh.main);
  }

  function setTheme(name) {
    const t = normalizeTheme(name);
    document.documentElement.setAttribute("data-theme", t);
    try {
      localStorage.setItem(STORAGE_KEY, t);
    } catch {
      /* ignore */
    }
    updateChromeColor();
    document.dispatchEvent(new CustomEvent("ingazgate-theme", { detail: t }));
  }

  function applyStoredTheme() {
    setTheme(getTheme());
  }

  function closeAllThemeMenus() {
    document.querySelectorAll(".theme-menu-wrap").forEach((wrap) => {
      const b = wrap.querySelector(".theme-menu-btn");
      const p = wrap.querySelector(".theme-picker-panel");
      p?.setAttribute("hidden", "");
      b?.setAttribute("aria-expanded", "false");
    });
  }

  function chip(label, value, activeValue, onPick) {
    const b = document.createElement("button");
    b.type = "button";
    b.className = "theme-chip" + (value === activeValue ? " is-active" : "");
    b.textContent = label;
    b.setAttribute("aria-pressed", value === activeValue ? "true" : "false");
    b.addEventListener("click", () => {
      onPick(value);
      closeAllThemeMenus();
    });
    return b;
  }

  const pickerRerenders = new Set();
  let themeSyncAttached = false;
  function syncPickers() {
    pickerRerenders.forEach((fn) => fn());
  }

  function mountPicker(container, options) {
    if (!container) {
      return;
    }
    if (!themeSyncAttached) {
      themeSyncAttached = true;
      document.addEventListener("ingazgate-theme", syncPickers);
    }
    const allowed = options.allowedThemes || [DARK, LIGHT];
    const menu = options.menu === true;
    const rerender = () => {
      const eligible = ramaEligible();
      const current = getTheme();
      container.innerHTML = "";
      container.className = "theme-picker" + (menu ? " theme-picker--menu" : "");
      container.setAttribute("role", "group");
      container.setAttribute("aria-label", "Color theme");

      const mk = (label, value) => {
        if (!allowed.includes(value)) {
          return;
        }
        if (value === RAMA && !eligible) {
          return;
        }
        container.appendChild(
          chip(label, value, current, (v) => {
            setTheme(v);
          })
        );
      };

      mk("Dark", DARK);
      mk("Light", LIGHT);
      if (allowed.includes(RAMA) && eligible) {
        mk("Rama ✿", RAMA);
      }
    };
    pickerRerenders.add(rerender);
    rerender();
  }

  function initThemeMenus() {
    document.querySelectorAll(".theme-menu-wrap").forEach((wrap) => {
      const btn = wrap.querySelector(".theme-menu-btn");
      const panel = wrap.querySelector(".theme-picker-panel");
      if (!btn || !panel) {
        return;
      }

      btn.addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();
        window.ingazgateTheme?.closeNotifications?.();
        const wasOpen = !panel.hasAttribute("hidden");
        closeAllThemeMenus();
        if (!wasOpen) {
          panel.removeAttribute("hidden");
          btn.setAttribute("aria-expanded", "true");
        }
      });
    });

    /* Capture phase so we never close in the same bubble pass as opening the menu */
    document.addEventListener(
      "click",
      (e) => {
        if (e.target instanceof Element && e.target.closest(".theme-menu-wrap")) {
          return;
        }
        closeAllThemeMenus();
      },
      true
    );

    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        closeAllThemeMenus();
      }
    });

    document.querySelectorAll(".language-menu-wrap .lang-chip").forEach((link) => {
      link.addEventListener("click", () => {
        closeAllThemeMenus();
      });
    });
  }

  window.ingazgateTheme = {
    setTheme,
    getTheme,
    applyStoredTheme,
    updateChromeColor,
    closeThemeMenus: closeAllThemeMenus,
    closeNotifications: () => {},
    DARK,
    LIGHT,
    RAMA,
  };

  const early = document.documentElement.getAttribute("data-theme");
  if (!early) {
    applyStoredTheme();
  } else if (document.body) {
    updateChromeColor();
  }

  document.addEventListener("DOMContentLoaded", () => {
    applyStoredTheme();
    updateChromeColor();
    mountPicker(document.getElementById("themePicker"), {
      allowedThemes: [DARK, LIGHT, RAMA],
      menu: true,
    });
    mountPicker(document.getElementById("themePickerLogin"), {
      allowedThemes: [DARK, LIGHT],
      menu: true,
    });
    mountPicker(document.getElementById("themePickerSignup"), {
      allowedThemes: [DARK, LIGHT],
      menu: true,
    });
    initThemeMenus();
  });
})();
