(() => {
  const message = 'Access is managed by the journal. Existing permissions remain unchanged.';
  const selectors = [
    '.pkp_navigation_user a[href*="/login"]',
    '.pkp_navigation_user a[href*="/register"]',
    'a[href*="/submission"]',
    'a[href*="/submissions"]'
  ];

  const dialog = document.createElement('dialog');
  dialog.className = 'erjssh_access_dialog';
  dialog.setAttribute('aria-labelledby', 'erjssh-access-title');
  dialog.innerHTML = '<button class="erjssh_dialog_close" type="button" aria-label="Close">×</button><p class="erjssh_label">Journal access</p><h2 id="erjssh-access-title">Access restricted</h2><p></p><button class="erjssh_dialog_confirm" type="button">Close</button>';
  dialog.querySelector('p:not(.erjssh_label)').textContent = message;
  document.body.append(dialog);

  const close = () => dialog.close();
  const open = (title = 'Access restricted') => {
    dialog.querySelector('#erjssh-access-title').textContent = title;
    dialog.showModal();
  };
  dialog.querySelector('.erjssh_dialog_close').addEventListener('click', close);
  dialog.querySelector('.erjssh_dialog_confirm').addEventListener('click', close);
  dialog.addEventListener('click', (event) => {
    if (event.target === dialog) close();
  });

  document.querySelectorAll(selectors.join(',')).forEach((link) => {
    link.addEventListener('click', (event) => {
      event.preventDefault();
      const label = link.textContent.trim() || 'Access';
      open(`${label} — restricted`);
    });
  });

  const archiveIssues = [...document.querySelectorAll('.page_issue_archive .obj_issue_summary')];
  archiveIssues.slice(1).forEach((issue) => {
    issue.classList.add('erjssh_locked_issue');
    const link = issue.querySelector('a');
    if (!link) return;
    const badge = document.createElement('span');
    badge.className = 'erjssh_lock_badge';
    badge.textContent = 'Registration required';
    issue.append(badge);
    link.addEventListener('click', (event) => {
      event.preventDefault();
      open(`${link.textContent.trim()} — restricted`);
    });
  });
})();
