# Lên kèo! — đăng nhập demo

Ứng dụng Flutter thực tập, giữ package và thư mục `flutter_application_1`.
Tên ứng dụng là **Lên kèo!**; Truth or Dare chỉ là một trò chơi dự kiến trong
app, chưa được triển khai. Phạm vi hiện tại chỉ có màn hình đăng nhập demo.

## Chạy

Mở terminal tại thư mục `flutter_application_1`:

```powershell
flutter pub get
flutter run -d chrome
```

## Hành vi

- Nhập email và mật khẩu; mật khẩu mặc định được che.
- Nút mắt hiện/ẩn mật khẩu, không thay đổi nội dung.
- Form trim email hai đầu, kiểm tra email không rỗng và định dạng cơ bản.
- Mật khẩu không rỗng, không trim; chuỗi chỉ có dấu cách vẫn hợp lệ
  theo yêu cầu demo hiện tại.
- Hiện lỗi dưới đúng ô nhập. Dữ liệu hợp lệ hiển thị SnackBar:
  “Dữ liệu hợp lệ — đây là bản demo.”
- Không xác thực tài khoản thật, không gọi API, lưu hay log mật khẩu.
- Bố cục cuộn khi cửa sổ thấp hoặc bàn phím xuất hiện.

## Cấu trúc công ty

```text
lib/
  app/
    app.dart
    app_theme.dart
  core/
    constants/
    network/
    widgets/
  features/
    auth/
      data/
      domain/
      presentation/
        login_screen.dart
    home/
  main.dart
```

Các thư mục chưa dùng giữ bằng `.gitkeep`; không thêm tầng xử lý hoặc
dependency chưa cần thiết. `LoginScreen` dùng Form và state cục bộ,
giải phóng TextEditingController trong dispose.

## Kiểm tra

```powershell
dart format lib/app/app.dart lib/app/app_theme.dart lib/features/auth/presentation/login_screen.dart test/widget_test.dart
flutter analyze
flutter test
flutter build web --no-web-resources-cdn
```

Widget test bao phủ ô trống, email sai định dạng, mật khẩu rỗng,
email được trim, mật khẩu giữ nguyên, SnackBar, nút mắt, màn hình 320 × 480
với hệ số chữ 2 và vùng bàn phím mô phỏng 200 pixels.
Chrome headless đã được chụp và kiểm tra ở desktop 1280 × 900
và điện thoại 360 × 740. Bàn phím thật trên thiết bị chưa được kiểm tra.

## Git và bàn giao

Nhánh làm việc: `feature/login-screen`, đã push lên repository
[trungnguyen2482-dev/wrk-01](https://github.com/trungnguyen2482-dev/wrk-01).
Đã kiểm tra repository là **Private** trước khi push.
[PR #1](https://github.com/trungnguyen2482-dev/wrk-01/pull/1) vào nhánh mặc định
thực tế `main`, đã fetch trước khi đặt nền nhánh feature.
Reviewer chưa được cung cấp. Không tự approve hoặc merge PR.

- [Báo cáo đối chiếu](docs/onboarding_report.md)
- [Câu hỏi gửi người hướng dẫn](docs/questions_for_mentor.txt)
- [Nội dung PR đã chuẩn bị](docs/pr_description.md)
