(() => {
  const toggle = document.querySelector('.nav-toggle');
  const menu = document.querySelector('#journal-menu');
  const dialog = document.querySelector('[data-dialog]');
  const dialogTitle = document.querySelector('[data-dialog-title]');
  const dropdowns = [...document.querySelectorAll('.nav-dropdown')];
  const panels = [...document.querySelectorAll('.page-panel')];
  const routeTitles = {
    home: 'Journal Home',
    current: 'Current Issue',
    archives: 'Archives',
    guidelines: 'Guidelines',
    'author-guideline': 'Author Guideline',
    'reviewer-guideline': 'Reviewers Guideline',
    'editorial-process': 'Editorial Process',
    submissions: 'Submissions',
    announcements: 'Announcements',
    'about-journal': 'About the Journal',
    'editorial-team': 'Editorial Team',
    privacy: 'Privacy Statement',
    contact: 'Contact'
  };
  const routeParents = {
    'author-guideline': 'guidelines',
    'reviewer-guideline': 'guidelines',
    'editorial-process': 'guidelines'
  };

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
    if (menu) menu.dataset.open = 'false';
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

  panels.filter((panel) => panel.id !== 'home').forEach((panel) => {
    const container = panel.querySelector(':scope > .container');
    if (!container || container.querySelector(':scope > .view-bar')) return;
    const bar = document.createElement('div');
    bar.className = 'view-bar';
    bar.innerHTML = '<a href="#home"><span aria-hidden="true">←</span> Journal Home</a><span aria-hidden="true">/</span><strong data-view-title></strong>';
    container.prepend(bar);
  });

  const allRouteLinks = [...document.querySelectorAll('a[href^="#"]')];
  const guidelineDetails = [...document.querySelectorAll('#guidelines .accordion-list > details')];

  const renderRoute = () => {
    const requested = decodeURIComponent(location.hash.slice(1)) || 'home';
    const route = routeTitles[requested] ? requested : 'home';
    const panelId = routeParents[route] || route;
    const activePanel = panels.find((panel) => panel.dataset.route === panelId) || document.querySelector('#home');

    panels.forEach((panel) => {
      const active = panel === activePanel;
      panel.hidden = !active;
      panel.toggleAttribute('aria-hidden', !active);
    });

    if (panelId === 'guidelines') {
      const selectedDetail = routeParents[route] ? route : null;
      guidelineDetails.forEach((detail) => {
        detail.hidden = Boolean(selectedDetail && detail.id !== selectedDetail);
        detail.open = detail.id === selectedDetail;
      });
    }

    const title = routeTitles[route];
    activePanel.querySelector('[data-view-title]')?.replaceChildren(title);
    activePanel.scrollTop = 0;
    document.body.dataset.route = route;
    document.title = route === 'home'
      ? 'ERJSSH — Ethiopian Renaissance Journal of Social Sciences and Humanities'
      : `${title} — ERJSSH`;

    allRouteLinks.forEach((link) => {
      const linkRoute = decodeURIComponent(link.hash.slice(1));
      link.toggleAttribute('aria-current', linkRoute === route || (linkRoute === panelId && routeParents[route] === panelId));
    });
    dropdowns.forEach((dropdown) => {
      const current = Boolean(dropdown.querySelector(`a[href="#${CSS.escape(route)}"]`));
      dropdown.classList.toggle('is-current', current);
    });

    if (window.matchMedia('(max-width: 760px)').matches) window.scrollTo({ top: 0, behavior: 'auto' });
  };

  window.addEventListener('hashchange', renderRoute);
  renderRoute();
})();
