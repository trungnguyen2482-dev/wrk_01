# feat(auth): add demo login screen for Lên kèo!

Thay màn hình danh sách onboarding bằng màn hình đăng nhập demo “Lên kèo!”,
giữ package flutter_application_1 và cấu trúc công ty.

Form kiểm tra email đã trim và mật khẩu không rỗng, giữ nguyên mật khẩu.
Nút mắt hiện/ẩn nội dung, dữ liệu hợp lệ hiển thị SnackBar demo.
Giao diện sáng/tím, bo góc và cuộn trên màn hình thấp.
Không xác thực tài khoản, gọi API hoặc lưu/log mật khẩu.

Validation: dart format, flutter analyze (No issues found), flutter test
(8 test đạt), flutter build web --no-web-resources-cdn thành công.
Đã kiểm tra ảnh Chrome headless 1280 × 900 và 360 × 740; không thấy tràn
và không ghi nhận lỗi JavaScript. Bàn phím thật trên Android/iOS chưa kiểm tra.

Reviewer chưa được cung cấp; câu hỏi ghi trong docs/questions_for_mentor.txt.
Repository phải Private; không tự approve hoặc merge PR.
