# Sổ tay cấu hình tạp chí EJOSSAH

Tài liệu này biến một bản cài OJS sạch thành hồ sơ tạp chí EJOSSAH nhất quán với dữ liệu tham chiếu được cung cấp ngày 14/08/2026.

## 1. Hồ sơ tạp chí

Vào **Settings → Journal → Masthead** và **Settings → Website → Setup** để nhập:

| Trường | Giá trị |
|---|---|
| Tên tạp chí | Ethiopian Journal of the Social Sciences and Humanities |
| Viết tắt | EJOSSAH |
| Đường dẫn | `EJOSSAH` |
| Nhà xuất bản | College of Social Sciences, Addis Ababa University |
| Năm bắt đầu | 2003 |
| E-ISSN | 2520-582X |
| Ngôn ngữ xuất bản | English |
| Tần suất | Biannual / hai số mỗi năm |
| Phí xử lý bài | Free / không thu APC |
| Danh mục | [DOAJ](https://doaj.org/toc/2520-582X) |

Không nhập ngày xuất bản trong tương lai và không gán DOI nếu chưa có quyền từ cơ quan đăng ký DOI của tạp chí.

## 2. Kích hoạt theme

1. Mở **Settings → Website → Appearance**.
2. Chọn **EJOSSAH Academic Theme**.
3. Màu nhấn mặc định là `#7B1F2D`; có thể đổi nhưng phải giữ độ tương phản WCAG AA.
4. Giữ **Show the EJOSSAH journal introduction** nếu muốn hiển thị khối thông tin đầu trang.
5. Chọn bố cục có sidebar và bật block **Make a Submission**.

## 3. Điều hướng

Trong **Settings → Website → Navigation Menus**, tạo menu chính theo thứ tự:

1. EJOL Home
2. Current
3. Archives
4. Announcements
5. About

Menu con của **About**:

- About the Journal
- Editorial Policy
- Submissions
- Editorial Team
- Author Guidelines
- Privacy Statement
- Contact

Không gắn token CSRF hoặc URL phiên đăng nhập vào menu tĩnh.

## 4. Kỳ tham chiếu

Tạo kỳ tại **Issues → Future Issues**:

| Trường | Giá trị |
|---|---|
| Volume | 21 |
| Number | 2 |
| Year | 2025 |
| Title | December |
| Nhãn hiển thị | Vol. 21 No. 2 (2025): December |
| Ngày xuất bản tham chiếu | 2026-07-20 |

Chỉ bấm **Publish Issue** sau khi kiểm tra thứ tự bài, số trang, PDF, giấy phép và metadata tác giả.

## 5. Danh mục bài viết của kỳ

| Trang | Tác giả | Tiêu đề |
|---:|---|---|
| 1–19 | Dawit Biazen Demesse | Peripheral vs. Center-Seeking Nationalisms and Center-Periphery Relations in Ethiopia: Post-1991 Somali-Oromo Relations |
| 21–40 | Nebiyou Ermias | Technoscientific Rationality: Navigating Dilemmas in the Contemporary Zeitgeist |
| 41–63 | Daniel Mekonnen | Indigenous Values, Beliefs, and Systems for Peacebuilding: The Case of the Jarssaa Gurachaa Inter-Ethnic Indigenous Institution in South-Central Ethiopia |
| 65–84 | Girma Megerssa; Judith Globerman; Debebe Ero | Divorce Aftermath through the Lens of Resilience: Lived Experiences of Divorced Custodial, Young Women in Adama, Ethiopia |
| 85–108 | Garedow Abiba; Worku Derara; Alfredo González-Ruibal | Archaeological Semiotics of Material Cultures of Gadaa Ritual Performances in Borana and Shewa Zones, Ethiopia |

Với mỗi bài:

- tách tiêu đề chính và phụ đề đúng trường của OJS;
- nhập ORCID và đơn vị công tác chỉ khi đã xác minh;
- tải PDF bằng galley label `PDF`, không dùng `.PDF`;
- khai báo đúng ngôn ngữ, số trang, abstract, từ khóa và tài liệu tham khảo;
- không sao chép PDF từ website khác nếu chưa xác nhận quyền phân phối.

## 6. Khối thông tin sidebar

Cài/bật **Custom Block Manager**, tạo block `Journal Information` và đặt sau nút **Make a Submission**. Nội dung đề xuất:

```html
<section class="ejossah-journal-facts" aria-labelledby="journal-facts-title">
  <h2 id="journal-facts-title">Journal Information</h2>
  <dl>
    <div><dt>Published since</dt><dd>2003</dd></div>
    <div><dt>Publisher</dt><dd>College of Social Sciences, Addis Ababa University</dd></div>
    <div><dt>E-ISSN</dt><dd>2520-582X</dd></div>
    <div><dt>Language</dt><dd>English</dd></div>
    <div><dt>Frequency</dt><dd>Biannual</dd></div>
    <div><dt>APC</dt><dd>Free</dd></div>
  </dl>
  <p><a href="https://doaj.org/toc/2520-582X" rel="external">View in DOAJ</a></p>
</section>
```

## 7. Plugin nên bật

- Web Feed: Atom, RSS và RSS2.
- OAI Metadata Format và OAI-PMH.
- Dublin Core Metadata.
- Google Scholar Indexing.
- PDF.js Viewer nếu muốn đọc PDF trong trình duyệt.
- Custom Block Manager và Static Pages cho nội dung biên tập.
- Crossref chỉ khi tạp chí có tài khoản và prefix DOI hợp lệ.

## 8. Checklist production

- Bắt buộc HTTPS, cookie secure và cấu hình trusted proxy đúng hạ tầng.
- Đặt `files_dir` ngoài web root; chặn thực thi PHP trong thư mục upload.
- Cấu hình SMTP thật và kiểm tra SPF, DKIM, DMARC.
- Chạy cron/scheduled tasks của OJS.
- Bật backup cơ sở dữ liệu và tệp theo nguyên tắc 3-2-1; diễn tập khôi phục.
- Không commit `config.inc.php`, khóa API, mật khẩu DB hoặc dữ liệu người dùng.
- Kiểm tra WCAG bằng bàn phím, screen reader và độ tương phản.
- Kiểm tra OAI-PMH, RSS, sitemap/robots, canonical URL và metadata bài báo.
- Ghi rõ chính sách phản biện, đạo đức xuất bản, lưu trữ, bản quyền và quyền riêng tư trước khi nhận bài.
