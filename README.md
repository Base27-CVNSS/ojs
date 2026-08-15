# ERJSSH trên Open Journal Systems 3.6

Mã nguồn tái tạo **Ethiopian Renaissance Journal of Social Sciences and Humanities (ERJSSH)** trên nền **Open Journal Systems 3.6**. Lõi OJS tiếp tục quản lý nộp bài, phản biện, biên tập và xuất bản; child theme `erjssh` đảm nhiệm giao diện xanh–trắng học thuật.

## Thiết kế

- Bố cục dựa trên giao diện ERJSSH được lưu trữ: thanh tài khoản/ISSN, masthead chữ, menu xanh, ảnh bìa, current issue và các trang thông tin.
- Không dùng logo website riêng; ảnh bìa do dự án cung cấp là hình ảnh nhận diện duy nhất.
- Font sans-serif tối giản, responsive và hỗ trợ thao tác bàn phím.
- Danh sách bài chỉ hiển thị tiêu đề, tác giả và DOI. Không có liên kết PDF, lượt xem, lượt tải hoặc liên kết hồ sơ cá nhân.
- Editorial Team giữ tên, học vị, chức vụ và cơ quan; loại bỏ email, số điện thoại, ORCID, Google Scholar và ResearchGate.
- Register, Login và Submission hiển thị thông báo hạn chế quyền nhưng không xóa trạng thái truy cập đã có trong OJS.

## Child theme

```text
plugins/themes/erjssh/
├── ErjsshThemePlugin.php
├── assets/erjssh-cover.webp
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
