(() => {
  const message = 'Direct registration is currently required. You do not have permission to access this area at present. Any access information granted previously remains preserved.';
  const selectors = [
    '.pkp_navigation_user a[href*="/login"]',
    '.pkp_navigation_user a[href*="/register"]',
    'a[href*="/submission"]',
    'a[href*="/submissions"]'
  ];

  const dialog = document.createElement('dialog');
  dialog.className = 'erjssh_access_dialog';
  dialog.setAttribute('aria-labelledby', 'erjssh-access-title');
  dialog.innerHTML = '<button class="erjssh_dialog_close" type="button" aria-label="Close">×</button><p class="erjssh_label">Restricted journal service</p><h2 id="erjssh-access-title">Access restricted</h2><p></p><button class="erjssh_dialog_confirm" type="button">Understood</button>';
  dialog.querySelector('p:not(.erjssh_label)').textContent = message;
  document.body.append(dialog);

  const close = () => dialog.close();
  dialog.querySelector('.erjssh_dialog_close').addEventListener('click', close);
  dialog.querySelector('.erjssh_dialog_confirm').addEventListener('click', close);
  dialog.addEventListener('click', (event) => {
    if (event.target === dialog) close();
  });

  document.querySelectorAll(selectors.join(',')).forEach((link) => {
    link.addEventListener('click', (event) => {
      event.preventDefault();
      dialog.showModal();
    });
  });
})();
