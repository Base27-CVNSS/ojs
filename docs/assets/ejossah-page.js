(() => {
  'use strict';

  const root = document.documentElement;
  const body = document.body;
  const themeToggle = document.querySelector('#themeToggle');
  const languageToggle = document.querySelector('#languageToggle');
  const menuToggle = document.querySelector('#menuToggle');
  const navigation = document.querySelector('#primaryNavigation');
  const searchInput = document.querySelector('#articleSearch');
  const articles = [...document.querySelectorAll('.article-card')];
  const noResults = document.querySelector('#noResults');
  const backToTop = document.querySelector('#backToTop');

  const translations = {
    vi: {
      journalName: 'Tạp chí Khoa học Xã hội và Nhân văn Ethiopia',
      navCurrent: 'Số hiện tại', navArchive: 'Lưu trữ', navNews: 'Thông báo', navAbout: 'Giới thiệu', navSubmit: 'Gửi bài',
      heroEyebrow: 'Truy cập mở · Xuất bản từ năm 2003',
      heroTitle: 'Những tư tưởng giúp hiểu sâu hơn về xã hội và con người.',
      heroLede: 'Tạp chí học thuật liên ngành của Trường Khoa học Xã hội, Đại học Addis Ababa.',
      readIssue: 'Đọc số hiện tại', submitManuscript: 'Gửi bản thảo', volumes: 'Tập', annual: 'Số mỗi năm', apc: 'Phí bài báo', latestIssue: 'Số mới nhất',
      publisher: 'Nhà xuất bản', frequency: 'Tần suất', biannual: 'Hai số mỗi năm', language: 'Ngôn ngữ', access: 'Truy cập', openFree: 'Mở và miễn phí',
      currentKicker: 'Số hiện tại', published: 'Xuất bản', searchIssue: 'Tìm trong số này', abstract: 'Tóm tắt', noResults: 'Không tìm thấy bài viết phù hợp.',
      forAuthors: 'Dành cho tác giả', shareResearch: 'Chia sẻ nghiên cứu của bạn với EJOSSAH.', submissionCopy: 'Đọc các yêu cầu biên tập trước khi bắt đầu gửi bài mới.', submissionGuide: 'Hướng dẫn gửi bài',
      journalInfo: 'Thông tin tạp chí', free: 'Miễn phí', firstPublished: 'Xuất bản lần đầu', aboutJournal: 'Giới thiệu tạp chí', stayCurrent: 'Theo dõi cập nhật', browseArchive: 'Xem toàn bộ kho số',
      aboutKicker: 'Về EJOSSAH', aboutTitle: 'Nơi gặp gỡ của nghiên cứu xã hội nghiêm túc và tư tưởng nhân văn.', aboutCopy: 'EJOSSAH tạo nền tảng học thuật cho nghiên cứu khoa học xã hội và nhân văn, kết nối học thuật về Ethiopia với các cuộc đối thoại khu vực và toàn cầu.',
      editorialPolicy: 'Chính sách biên tập', editorialTeam: 'Ban biên tập', authorGuide: 'Hướng dẫn tác giả', quote: 'Tri thức phát triển khi các ngành gặp nhau, bằng chứng được kiểm nghiệm và tư tưởng luôn rộng mở trước đối thoại phản biện.',
      workflowKicker: 'Xuất bản cùng EJOSSAH', workflowTitle: 'Lộ trình rõ ràng từ bản thảo đến công bố', stepSubmit: 'Gửi bài', stepSubmitCopy: 'Chuẩn bị bản thảo và metadata cần thiết trong OJS.', stepReview: 'Thẩm định biên tập', stepReviewCopy: 'Phạm vi, tính liêm chính và chất lượng học thuật được đánh giá.', stepRefine: 'Hoàn thiện', stepRefineCopy: 'Tác giả phản hồi góp ý và chuẩn bị văn bản cuối.', stepPublish: 'Công bố', stepPublishCopy: 'Bài viết tham gia một số tạp chí và kho lưu trữ truy cập mở.',
      nextContribution: 'Đóng góp tiếp theo của bạn', ctaTitle: 'Đưa một câu hỏi quan trọng vào cuộc đối thoại học thuật rộng lớn hơn.', startSubmission: 'Bắt đầu gửi bài', explore: 'Khám phá', policies: 'Chính sách', privacy: 'Quyền riêng tư', contact: 'Liên hệ', platform: 'Nền tảng'
    }
  };

  const english = new Map();
  document.querySelectorAll('[data-i18n]').forEach((element) => english.set(element, element.textContent));
  document.querySelectorAll('[data-i18n-placeholder]').forEach((element) => english.set(element, element.placeholder));

  const setTheme = (theme) => {
    root.dataset.theme = theme;
    themeToggle?.setAttribute('aria-label', theme === 'dark' ? 'Switch to light theme' : 'Switch to dark theme');
    try { localStorage.setItem('ejossah-theme', theme); } catch (_) { /* Storage may be disabled. */ }
  };

  let savedTheme = null;
  try { savedTheme = localStorage.getItem('ejossah-theme'); } catch (_) { /* Use system preference. */ }
  setTheme(savedTheme || (matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'));
  themeToggle?.addEventListener('click', () => setTheme(root.dataset.theme === 'dark' ? 'light' : 'dark'));

  const setLanguage = (language) => {
    const dictionary = translations[language];
    document.querySelectorAll('[data-i18n]').forEach((element) => {
      const key = element.dataset.i18n;
      element.textContent = dictionary?.[key] ?? english.get(element);
    });
    document.querySelectorAll('[data-i18n-placeholder]').forEach((element) => {
      const key = element.dataset.i18nPlaceholder;
      element.placeholder = dictionary?.[key] ?? english.get(element);
    });
    root.lang = language;
    languageToggle.textContent = language === 'en' ? 'VI' : 'EN';
    languageToggle.setAttribute('aria-label', language === 'en' ? 'Chuyển sang tiếng Việt' : 'Switch to English');
    try { localStorage.setItem('ejossah-language', language); } catch (_) { /* Non-critical preference. */ }
  };

  let savedLanguage = 'en';
  try { savedLanguage = localStorage.getItem('ejossah-language') || 'en'; } catch (_) { /* Keep English. */ }
  setLanguage(savedLanguage === 'vi' ? 'vi' : 'en');
  languageToggle?.addEventListener('click', () => setLanguage(root.lang === 'en' ? 'vi' : 'en'));

  const closeMenu = () => {
    menuToggle?.setAttribute('aria-expanded', 'false');
    navigation?.classList.remove('is-open');
    body.classList.remove('nav-open');
  };
  menuToggle?.addEventListener('click', () => {
    const open = menuToggle.getAttribute('aria-expanded') !== 'true';
    menuToggle.setAttribute('aria-expanded', String(open));
    navigation.classList.toggle('is-open', open);
    body.classList.toggle('nav-open', open);
  });
  navigation?.querySelectorAll('a').forEach((link) => link.addEventListener('click', closeMenu));
  addEventListener('resize', () => { if (innerWidth > 980) closeMenu(); });

  searchInput?.addEventListener('input', () => {
    const query = searchInput.value.trim().toLocaleLowerCase();
    let visible = 0;
    articles.forEach((article) => {
      const matches = !query || article.dataset.search.includes(query);
      article.hidden = !matches;
      visible += Number(matches);
    });
    noResults.hidden = visible !== 0;
  });

  const revealObserver = 'IntersectionObserver' in window
    ? new IntersectionObserver((entries, observer) => entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-visible');
          observer.unobserve(entry.target);
        }
      }), { threshold: 0.12 })
    : null;

  document.querySelectorAll('.reveal').forEach((element) => {
    if (revealObserver) revealObserver.observe(element);
    else element.classList.add('is-visible');
  });

  const syncScrollUi = () => backToTop?.classList.toggle('is-visible', scrollY > 550);
  addEventListener('scroll', syncScrollUi, { passive: true });
  syncScrollUi();
  backToTop?.addEventListener('click', () => scrollTo({ top: 0, behavior: 'smooth' }));

  const currentYear = document.querySelector('#currentYear');
  if (currentYear) currentYear.textContent = String(new Date().getFullYear());
})();
