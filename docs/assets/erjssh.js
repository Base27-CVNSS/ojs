(() => {
  const toggle = document.querySelector('.nav-toggle');
  const menu = document.querySelector('#journal-menu');
  const dialog = document.querySelector('[data-dialog]');
  const dialogTitle = document.querySelector('[data-dialog-title]');
  const dropdowns = [...document.querySelectorAll('.nav-dropdown')];

  const closeDropdowns = (except = null) => {
    dropdowns.forEach((dropdown) => {
      if (dropdown === except) return;
      dropdown.dataset.open = 'false';
      dropdown.querySelector('.nav-dropdown__toggle')?.setAttribute('aria-expanded', 'false');
    });
  };

  toggle?.addEventListener('click', () => {
    const open = menu.dataset.open !== 'true';
    menu.dataset.open = String(open);
    toggle.setAttribute('aria-expanded', String(open));
    if (!open) closeDropdowns();
  });

  dropdowns.forEach((dropdown) => {
    const dropdownToggle = dropdown.querySelector('.nav-dropdown__toggle');
    dropdownToggle?.addEventListener('click', (event) => {
      event.stopPropagation();
      const open = dropdown.dataset.open !== 'true';
      closeDropdowns(dropdown);
      dropdown.dataset.open = String(open);
      dropdownToggle.setAttribute('aria-expanded', String(open));
    });
  });

  menu?.addEventListener('click', (event) => {
    const link = event.target.closest('a');
    if (link) {
      const target = link.hash ? document.querySelector(link.hash) : null;
      if (target?.tagName === 'DETAILS') target.open = true;
      menu.dataset.open = 'false';
      toggle?.setAttribute('aria-expanded', 'false');
      closeDropdowns();
    }
  });

  document.addEventListener('click', (event) => {
    if (!event.target.closest('.nav-dropdown')) closeDropdowns();
  });

  document.addEventListener('keydown', (event) => {
    if (event.key !== 'Escape') return;
    closeDropdowns();
    menu.dataset.open = 'false';
    toggle?.setAttribute('aria-expanded', 'false');
  });

  document.querySelectorAll('[data-access]').forEach((button) => {
    button.addEventListener('click', () => {
      if (dialogTitle) dialogTitle.textContent = `${button.dataset.access} access restricted`;
      if (typeof dialog?.showModal === 'function') dialog.showModal();
    });
  });

  document.querySelectorAll('[data-close]').forEach((button) => {
    button.addEventListener('click', () => dialog?.close());
  });

  dialog?.addEventListener('click', (event) => {
    if (event.target === dialog) dialog.close();
  });

  const navLinks = [...document.querySelectorAll('.nav-links > a')];
  const sections = navLinks.map((link) => document.querySelector(link.hash)).filter(Boolean);
  if ('IntersectionObserver' in window) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
        navLinks.forEach((link) => link.toggleAttribute('aria-current', link.hash === `#${entry.target.id}`));
      });
    }, { rootMargin: '-30% 0px -60%', threshold: 0 });
    sections.forEach((section) => observer.observe(section));
  }
})();
