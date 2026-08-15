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
| Tần suất | Biannual — February and July |
| Truy cập | Open access; no publication charge |
| Trích dẫn | APA 7th edition |

## Điều hướng

Tạo menu chính theo thứ tự: **Home, Current, Archives, Guidelines, Submissions, Announcements, About, Contact**. Trong About, tạo các trang **About the Journal, Editorial Team, Privacy Statement**. Không nhập email cá nhân, số điện thoại hoặc liên kết hồ sơ của thành viên biên tập.

## Kỳ hiện tại

| Trường | Giá trị |
|---|---|
| Volume | 12 |
| Number | 2 |
| Year | 2025 |
| Ngày xuất bản | 2025-07-31 |
| Section | Original Research Articles |
| Số bài | 10 |

Khai báo DOI theo dải `10.4314/erjssh.v12i2.1` đến `10.4314/erjssh.v12i2.10`. Theme chỉ liên kết DOI đã đăng ký; không tạo DOI giả và không dùng liên kết PDF trong danh sách bài.

## Kích hoạt theme

1. Mở **Settings → Website → Appearance**.
2. Chọn **ERJSSH Academic Theme**.
3. Lưu và xóa data/template cache.
4. Không tải logo website; theme dùng masthead chữ và ảnh bìa `assets/erjssh-cover.webp`.
5. Kiểm tra menu, DOI, Register/Login notice và responsive ở 360, 768, 1024 và 1440 px.

## Bảo mật và dữ liệu

- Đặt `files_dir` ngoài web root và chặn thực thi mã trong thư mục upload.
- Bật HTTPS, secure cookies, cron và sao lưu cơ sở dữ liệu/tệp theo quy tắc 3-2-1.
- Không commit cấu hình thật, token, mật khẩu, dữ liệu tác giả, reviewer hoặc báo cáo phản biện.
- Chỉ nhân sự được phê duyệt mới được mở đăng ký và submission; quyền truy cập đã cấp trong OJS phải được bảo lưu.
