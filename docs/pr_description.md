# feat(auth): add reference-styled demo login for Lên kèo!

Thay màn hình danh sách onboarding bằng màn hình đăng nhập demo “Lên kèo!”,
giữ package flutter_application_1 và cấu trúc công ty.

Form kiểm tra email đã trim và mật khẩu không rỗng, giữ nguyên mật khẩu.
Nút mắt hiện/ẩn nội dung, dữ liệu hợp lệ hiển thị SnackBar demo.
Giao diện theo mẫu được chọn: minh họa vector nhóm bạn và xúc xắc,
chữ Baloo 2 tiếng Việt đóng gói cùng giấy phép OFL, nền tím nhạt có trang trí,
thẻ trắng bo góc, nhãn phía trên ô nhập và nút tím tươi.
Chữ/form dùng widget thật; không đưa ảnh mockup hoặc khung điện thoại vào app.
Minh họa thu nhỏ khi có bàn phím, toàn bộ nội dung cuộn trên màn hình thấp.
Không xác thực tài khoản, gọi API hoặc lưu/log mật khẩu.

Validation: dart format, flutter analyze (No issues found), flutter test
(8 test đạt), flutter build web --no-web-resources-cdn thành công.
Đã kiểm tra ảnh Chrome headless 1280 × 900, 360 × 740 và 320 × 480 sau cuộn; không thấy tràn
và không ghi nhận lỗi JavaScript. Bàn phím thật trên Android/iOS chưa kiểm tra.

Reviewer chưa được cung cấp; câu hỏi ghi trong docs/questions_for_mentor.txt.
Repository phải Private; không tự approve hoặc merge PR.
