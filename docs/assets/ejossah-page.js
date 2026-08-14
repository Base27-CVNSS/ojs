(() => {
  const menuButton = document.querySelector('[data-menu-toggle]');
  const nav = document.querySelector('[data-navigation]');

  if (menuButton && nav) {
    menuButton.addEventListener('click', () => {
      const open = nav.classList.toggle('is-open');
      menuButton.setAttribute('aria-expanded', String(open));
      menuButton.textContent = open ? 'Close' : 'Menu';
    });
  }

  document.querySelectorAll('.nav-dropdown').forEach((dropdown) => {
    dropdown.removeAttribute('open');
    document.addEventListener('click', (event) => {
      if (!dropdown.contains(event.target)) dropdown.removeAttribute('open');
    });
  });

  const setupFilter = (inputSelector, itemSelector, emptySelector) => {
    const input = document.querySelector(inputSelector);
    if (!input) return;
    const items = [...document.querySelectorAll(itemSelector)];
    const empty = document.querySelector(emptySelector);

    input.addEventListener('input', () => {
      const query = input.value.trim().toLocaleLowerCase();
      let visible = 0;
      items.forEach((item) => {
        const haystack = (item.dataset.search || item.textContent).toLocaleLowerCase();
        const match = !query || haystack.includes(query);
        item.hidden = !match;
        if (match) visible += 1;
      });
      if (empty) empty.hidden = visible !== 0;
    });
  };

  setupFilter('[data-article-search]', '[data-article]', '[data-article-empty]');
  setupFilter('[data-archive-search]', '[data-archive]', '[data-archive-empty]');

  const year = document.querySelector('[data-current-year]');
  if (year) year.textContent = String(new Date().getFullYear());
})();
