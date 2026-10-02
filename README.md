# flutter_application_1

Bài thực tập Flutter: màn hình danh sách cơ bản, theo phần 4 và phần 5
trong tài liệu onboarding công ty. Tên project được giữ nguyên.

## Chạy trên Chrome

Mở terminal tại thư mục `flutter_application_1`:

```powershell
flutter pub get
flutter run -d chrome
```

Màn hình hiển thị năm mục: Dart, Widget, Layout, State và Git.
Danh sách cuộn khi cửa sổ thấp, giới hạn chiều rộng 720 logical pixels
khi cửa sổ rộng và hỗ trợ phóng to chữ.

## Cấu trúc

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
    home/
      presentation/
        home_screen.dart
  main.dart
```

- `main.dart`: entry point.
- `app/`: cấu hình MaterialApp và theme.
- `features/home/presentation/`: màn hình danh sách, dữ liệu mẫu cục bộ.
- Các thư mục chưa dùng giữ bằng `.gitkeep` theo mẫu công ty.
  Chưa cần repositories, network client, domain logic, routes hoặc localization
  cho một màn hình. Không thêm API, đăng nhập hoặc package quản lý trạng thái.
- `dart_basics.dart` là bài tập console riêng; không được import vào app web.

## Kiểm tra

```powershell
dart format lib test dart_basics.dart
flutter analyze
flutter test
flutter test --platform chrome
flutter build web
dart run dart_basics.dart
```

Test kiểm tra đủ năm mục và khả năng cuộn ở kích thước 320 × 480
với hệ số chữ 2. Kiểm tra thủ công trên Chrome: mở app, thu hẹp cửa sổ,
cuộn đến mục Git, xác nhận chữ tiếng Việt hiển thị đúng và không có tràn bố cục.

## Git và nộp bài

Nhánh làm việc: `feature/basic-list`. Repository cục bộ chưa có commit
hoặc remote. Do chưa có commit ban đầu, nhánh làm việc chưa có nhánh đích
`main` để mở PR; cần lịch sử gốc trước khi thực hành PR.

Chưa commit, push, tạo repository từ xa hoặc tạo PR theo yêu cầu của người dùng.
Repository GitHub/GitLab chứa code hoặc tài liệu công ty phải **Private**.
`publish_to: 'none'` ngăn publish package; không thiết lập quyền riêng tư
cho repository GitHub/GitLab.

Xem [báo cáo đối chiếu](docs/onboarding_report.md).
