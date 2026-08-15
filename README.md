# ERJSSH trên Open Journal Systems 3.6

Mã nguồn tái tạo **Ethiopian Renaissance Journal of Social Sciences and Humanities (ERJSSH)** trên nền **Open Journal Systems 3.6**. Lõi OJS tiếp tục quản lý nộp bài, phản biện, biên tập và xuất bản; child theme `erjssh` đảm nhiệm giao diện xanh–trắng học thuật.

## Thiết kế

- Bố cục dựa trên giao diện ERJSSH được lưu trữ: thanh tài khoản/ISSN, masthead, menu xanh có mục con, ảnh bìa, current issue và các trang thông tin.
- Bản GitHub Pages hoạt động như một cổng tạp chí theo route: mỗi mục menu mở một trang con trong cùng khung giao diện, có lịch sử URL riêng; trang Home được nén vừa màn hình desktop và nội dung dài cuộn bên trong vùng đọc.
- Font sans-serif 11–12 px nhất quán, responsive và hỗ trợ thao tác bàn phím; chỉ tiêu đề bài báo dùng chữ hoa toàn bộ.
- Danh sách bài tập trung vào tiêu đề, tác giả, DOI, tóm tắt, từ khóa, cách trích dẫn, số xuất bản và galley PDF.
- Số hiện tại là **Vol. 13 No. 1 (2026)**; các số cũ hiển thị trạng thái yêu cầu đăng ký trực tiếp.
- APC miễn phí, truy cập mở 100%, xuất bản hai số chọn lọc mỗi năm và phản biện kín bởi ít nhất hai chuyên gia độc lập.
- Editorial Team giữ tên, học vị, chức vụ và cơ quan; loại bỏ email, số điện thoại, ORCID, Google Scholar và ResearchGate.
- Register, Login và Submission hiển thị thông báo hạn chế quyền nhưng không xóa trạng thái truy cập đã có trong OJS.

## Child theme

```text
plugins/themes/erjssh/
├── ErjsshThemePlugin.php
├── assets/erjssh-cover.webp
├── assets/erjssh-masthead.jpg
├── assets/erjssh-open-access.png
├── assets/erjssh-ajol.png
├── assets/erjssh-sjr.png
├── locale/en/locale.po
├── scripts/access.js
├── styles/index.css
├── templates/frontend/
│   ├── objects/article_summary.tpl
│   └── pages/indexJournal.tpl
├── index.php
├── settings.xml
└── version.xml
```

Theme không sửa lõi OJS. Cài đặt bằng cách giữ thư mục tại `plugins/themes/erjssh`, sau đó mở **Settings → Website → Appearance**, chọn **ERJSSH Academic Theme**, lưu và xóa template cache.

## Phát triển OJS

```bash
git clone --recurse-submodules https://github.com/Base27-CVNSS/ojs.git
cd ojs
composer --working-dir=lib/pkp install
npm install
npm run build
```

Yêu cầu PHP 8.2+, cơ sở dữ liệu được OJS hỗ trợ, HTTPS cho production và `files_dir` nằm ngoài web root. Không commit `config.inc.php`, khóa API, mật khẩu hoặc dữ liệu người dùng.

Hồ sơ tạp chí và checklist nhập dữ liệu nằm trong [`docs/ERJSSH_SETUP.md`](docs/ERJSSH_SETUP.md).

## Giấy phép và phạm vi

Kho phái sinh giữ giấy phép GNU GPL v3 hoặc mới hơn của Open Journal Systems. Đây là bản tái tạo kỹ thuật dựa trên nội dung công khai/lưu trữ; đơn vị vận hành phải xác nhận quyền sử dụng tên, bìa và nội dung với chủ sở hữu tạp chí trước khi công bố như website chính thức.
