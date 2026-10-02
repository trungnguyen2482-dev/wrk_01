# Danh sách trò chơi và liên kết màn hình

Đã đọc file thực tế trước sửa: chỉ có màn hình đăng nhập, chưa có danh sách
trò chơi. Đã đọc lại Mục 2 trong DOCX công ty: app, core, features và main.dart.
Yêu cầu mới nhất của người dùng là nguồn cho sáu trò chơi và điều hướng.

## Thực hiện

- Giữ thiết kế đăng nhập, validator, trim email, không trim mật khẩu,
  hiện/ẩn mật khẩu và dispose controller.
- Thay SnackBar thành công cũ bằng Navigator.push với MaterialPageRoute.
  Mũi tên và platform Back pop route danh sách; route đăng nhập vẫn còn
  nên nội dung và trạng thái form không bị tự xóa.
- GameListScreen dùng ListView, dữ liệu mẫu const trong code, đủ sáu trò
  với đúng tên/mô tả. Header cùng cuộn với danh sách trên màn hình thấp.
- GameCard dùng chung cho các trò, gồm icon Material, tên, mô tả, mũi tên,
  Material/InkWell để bấm. Text được xuống dòng, không giảm cỡ để ép vừa.
  Coup dùng icon theater_comedy của Material, không dùng logo chính thức.
- Bấm từng trò hiển thị SnackBar “[Tên trò] đang được phát triển”.
- Không API, database, lưu/log mật khẩu, package mới hoặc game thật.
- Nền và minh họa cũ chuyển sang core/widgets cho hai màn hình dùng chung;
  chỉ đổi tên widget, giữ phần vẽ. Theme, font và layout đăng nhập không đổi.

## File chính

- lib/features/auth/presentation/login_screen.dart: đổi import dùng chung
  và thay thông báo hợp lệ bằng điều hướng.
- lib/features/home/presentation/game_list_screen.dart: màn hình danh sách.
- lib/features/home/presentation/widgets/game_card.dart: thẻ dùng chung.
- lib/core/widgets/party_background.dart: nền chuyển từ login_background.dart.
- lib/core/widgets/friends_illustration.dart: minh họa chuyển từ login_illustration.dart.
- test/widget_test.dart: cập nhật hành vi thành công và thêm test Back/thẻ/cuộn.
- README.md và docs/game_list_report.md: hướng dẫn và bàn giao hiện tại.

Hai file widget cũ trong features/auth/presentation/widgets/ được chuyển đi,
không để bản sao. main.dart, theme, pubspec, dependency và lint được giữ nguyên.

## Kiểm tra

Kết quả lần chạy cuối:
- Dart format: 6 file, 0 thay đổi ở lần cuối.
- Flutter analyze: No issues found, exit code 0.
- Flutter test: toàn bộ 11 test đạt, exit code 0.
  Bao phủ input rỗng/sai, điều hướng khi hợp lệ, quay lại giữ form,
  platform Back, cả sáu SnackBar, hiện/ẩn mật khẩu, cuộn/chữ lớn/bàn phím mô phỏng.
Build web --no-web-resources-cdn thành công. Chrome headless đã nhập dữ liệu
demo, bấm đăng nhập và mở danh sách. Đã xem ảnh ở 360 × 740 và 320 × 480
sau cuộn; không thấy tràn, phiên kiểm tra ghi nhận 0 lỗi JavaScript.

Ảnh tại ../.onboarding_review/login_baseline/games_desktop.png,
games_mobile.png và games_small_scrolled.png, ngoài project.
Bàn phím thật Android/iOS và nút Back trình duyệt chưa được kiểm chứng.
Platform Back được kiểm tra bằng binding.handlePopRoute trong widget test.

Test responsive ban đầu bấm tâm thẻ trước khi layout sau cuộn hoàn tất,
gây hit-test ngoài viewport. Sửa để cuộn đến tên trò và pumpAndSettle
trước khi bấm; không tắt warning hoặc giảm cỡ chữ.

## Git

Không chạy bất kỳ lệnh Git nào, không khởi tạo/chuyển nhánh/pull/stage/
commit/push/PR/merge hoặc đổi cấu hình Git trong lượt này.
Không cập nhật PR cũ. Thay đổi chỉ ở workspace; người dùng thực hiện Git sau.

## Chạy

Tại thư mục flutter_application_1: flutter run -d chrome.
Nhập email đúng định dạng và mật khẩu không rỗng bất kỳ để mở danh sách.
Đây chỉ là kiểm tra input demo, không xác thực tài khoản thật.
