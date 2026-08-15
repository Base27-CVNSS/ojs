(() => {
  const search = document.querySelector('[data-search]');
  const articles = [...document.querySelectorAll('[data-article]')];
  const empty = document.querySelector('[data-empty]');
  const count = document.querySelector('[data-count]');
  if (!search) return;

  search.addEventListener('input', () => {
    const query = search.value.trim().toLocaleLowerCase();
    let visible = 0;
    articles.forEach((article) => {
      const match = !query || article.textContent.toLocaleLowerCase().includes(query);
      article.hidden = !match;
      if (match) visible += 1;
    });
    if (count) count.textContent = `${visible} article${visible === 1 ? '' : 's'}`;
    if (empty) empty.hidden = visible !== 0;
  });
})();
