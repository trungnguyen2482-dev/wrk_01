# Lên kèo! — đăng nhập và danh sách trò chơi demo

Ứng dụng Flutter thực tập, giữ package và thư mục `flutter_application_1`.
Tên ứng dụng là **Lên kèo!**; Truth or Dare chỉ là một trò chơi dự kiến trong
app. Phạm vi hiện tại gồm màn hình đăng nhập và danh sách sáu trò chơi;
chưa triển khai game thật.

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
- Hiện lỗi dưới đúng ô nhập; dữ liệu hợp lệ mở màn hình danh sách.
- Danh sách gồm Truth or Dare, Coup, Ma sói, Đoán từ, Đoán hình và
  Thử thách theo đội. Bấm thẻ hiện “[Tên trò] đang được phát triển”.
- Mũi tên quay lại hoặc Back trở về đăng nhập, giữ nguyên nội dung form.
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
      party_background.dart
      friends_illustration.dart
  features/
    auth/
      data/
      domain/
      presentation/
        login_screen.dart
    home/
      presentation/
        game_list_screen.dart
        widgets/
          game_card.dart
  main.dart
```

Các thư mục chưa dùng giữ bằng `.gitkeep`; không thêm tầng xử lý hoặc
dependency chưa cần thiết. `LoginScreen` dùng Form và state cục bộ,
giải phóng TextEditingController trong dispose.

## Giao diện theo mẫu

Minh họa nhóm bạn và xúc xắc được vẽ vector bằng CustomPainter, tách riêng
khỏi form thật. Nền tím nhạt có trang trí nhẹ; thẻ trắng bo góc, nhãn luôn
ở phía trên ô nhập và nút tím tươi. Không dùng ảnh mockup, khung điện thoại
hoặc thanh trạng thái làm giao diện. Khi bàn phím xuất hiện, minh họa thu nhỏ
và toàn bộ nội dung vẫn cuộn được.

Chữ thương hiệu dùng font Baloo 2 đóng gói tại assets/fonts/, hỗ trợ tiếng Việt.
Nguồn: https://github.com/google/fonts/tree/main/ofl/baloo2
Giấy phép SIL OFL được lưu cùng font trong assets/fonts/ofl.txt.
Không thêm package hoặc tải font khi app chạy.

## Kiểm tra

```powershell
dart format lib/core/widgets lib/features/auth/presentation/login_screen.dart lib/features/home/presentation test/widget_test.dart
flutter analyze
flutter test
flutter build web --no-web-resources-cdn
```

Widget test bao phủ ô trống, email sai định dạng, mật khẩu rỗng,
email được trim, mật khẩu giữ nguyên, điều hướng và quay lại,
bấm từng trò, nút mắt, màn hình 320 × 480 với hệ số chữ 2
và vùng bàn phím mô phỏng 200 pixels.
Chrome headless đã được chụp và kiểm tra ở desktop 1280 × 900
và điện thoại 360 × 740; đã kiểm tra thêm 320 × 480 sau cuộn.
Bàn phím thật trên thiết bị chưa được kiểm tra.

## Git và bàn giao

Theo yêu cầu mới nhất, tạm dừng toàn bộ thao tác Git. Lượt bổ sung danh sách
không chạy lệnh Git, không stage/commit/push hoặc cập nhật PR.
Thông tin repository và PR dưới đây là trạng thái bàn giao trước lượt này,
chưa bao gồm thay đổi danh sách đang nằm cục bộ. Repository code công ty
phải Private; các thao tác Git tiếp theo do người dùng thực hiện.

Nhánh làm việc: `feature/login-screen`, đã push lên repository
[trungnguyen2482-dev/wrk-01](https://github.com/trungnguyen2482-dev/wrk-01).
Đã kiểm tra repository là **Private** trước khi push.
[PR #1](https://github.com/trungnguyen2482-dev/wrk-01/pull/1) vào nhánh mặc định
thực tế `main`, đã fetch trước khi đặt nền nhánh feature.
Reviewer chưa được cung cấp. Không tự approve hoặc merge PR.

- [Báo cáo đối chiếu](docs/onboarding_report.md)
- [Báo cáo danh sách và điều hướng](docs/game_list_report.md)
- [Câu hỏi gửi người hướng dẫn](docs/questions_for_mentor.txt)
- [Nội dung PR đã chuẩn bị](docs/pr_description.md)
