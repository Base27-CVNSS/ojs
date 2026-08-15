# Sổ tay cấu hình ERJSSH trên OJS 3.6

## Hồ sơ tạp chí

| Trường | Giá trị |
|---|---|
| Tên | Ethiopian Renaissance Journal of Social Sciences and Humanities |
| Viết tắt | ERJSSH |
| Đường dẫn | `ERJSSH` |
| Chủ sở hữu/nhà xuất bản | College of Social Sciences and Humanities, University of Gondar |
| Online ISSN | 2409-6385 |
| Print ISSN hiển thị | 2409-6385 |
| Ngôn ngữ | English |
| Tần suất | Biannual — two selected issues per year |
| Truy cập | 100% open access; APC free |
| Phản biện | Double-blind; at least two independent reviewers |
| Trích dẫn | APA 7th edition |

## Điều hướng

Tạo menu chính theo thứ tự: **Home, Current, Archives, Guidelines, Submissions, Announcements, About, Contact**.

- Trong **Guidelines**, tạo ba mục con: **Author Guideline, Reviewers Guideline, Editorial Process**.
- Trong **About**, tạo ba mục con: **About the Journal, Editorial Team, Privacy Statement**.
- Không nhập email cá nhân, số điện thoại hoặc liên kết hồ sơ của thành viên biên tập.
- Chỉ bật locale tiếng Anh cho giao diện xuất bản của tạp chí.

## Kỳ hiện tại

| Trường | Giá trị |
|---|---|
| Volume | 13 |
| Number | 1 |
| Year | 2026 |
| Ngày xuất bản | 2026-07-13 |
| Section | Original Research Articles |
| Số bài | 10 |

Khai báo DOI đã đăng ký theo dải `10.4314/erjssh.v13i1.1` đến `10.4314/erjssh.v13i1.10`. Nạp galley PDF gốc cho từng bài để nút **Download PDF** được OJS tạo động; không ghi cứng đường dẫn galley trong theme.

Trong Archive, số hiện tại được mở. Các số cũ hiển thị trạng thái yêu cầu đăng ký trực tiếp; không xóa publication, submission hoặc quyền người dùng đã có trong cơ sở dữ liệu.

## Kích hoạt theme

1. Mở **Settings → Website → Appearance**.
2. Chọn **ERJSSH Academic Theme**.
3. Lưu và xóa data/template cache.
4. Giữ các ảnh nhận diện trong `plugins/themes/erjssh/assets/`; ảnh bìa là `erjssh-cover.webp`.
5. Kiểm tra menu con, DOI, galley PDF, Register/Login notice và responsive ở 360, 768, 1024 và 1440 px.

## Bảo mật và dữ liệu

- Đặt `files_dir` ngoài web root và chặn thực thi mã trong thư mục upload.
- Bật HTTPS, secure cookies, cron và sao lưu cơ sở dữ liệu/tệp theo quy tắc 3-2-1.
- Không commit cấu hình thật, token, mật khẩu, dữ liệu tác giả, reviewer hoặc báo cáo phản biện.
- Chỉ nhân sự được phê duyệt mới được mở đăng ký và submission; quyền truy cập đã cấp trong OJS phải được bảo lưu.
