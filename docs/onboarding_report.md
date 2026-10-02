# Báo cáo màn hình đăng nhập demo — Lên kèo!

## Đối chiếu phạm vi

Đã đọc lại PDF công ty (Mục 2, 4, 5) và DOCX tổng hợp ngày 02/10/2026.
Yêu cầu giao diện cụ thể lấy từ chỉ dẫn mới nhất của người dùng.

| Yêu cầu | Kết quả |
| --- | --- |
| Tên app, lời chào, tiêu đề, nhãn, gợi ý email, chú thích demo | Đã có đúng nội dung tiếng Việt. |
| Nền sáng, tím, bo góc, responsive, cuộn | Có theme chung; form giới hạn rộng 440, SingleChildScrollView và SafeArea. |
| Nhập email/mật khẩu, mật khẩu mặc định che, nút mắt | Đã có, giữ nguyên nội dung khi bật/tắt. |
| Form và lỗi từng ô | Đã có lỗi email rỗng/định dạng và mật khẩu rỗng. |
| Trim email, không trim mật khẩu | Trim email khi gửi; mật khẩu giữ nguyên, không kiểm tra độ dài ngoài yêu cầu. |
| SnackBar demo khi hợp lệ | “Dữ liệu hợp lệ — đây là bản demo.” |
| Không gọi API, lưu/log mật khẩu | Không có xử lý xác thực hay persistence. |
| Quản lý tài nguyên | Dispose cả hai TextEditingController. |
| Cấu trúc Mục 2 | Giữ app, core, features/auth/data, domain, presentation, features/home và main.dart. |
| Giữ tên project và dependency/lint | Giữ tên package, dependency và lint; pubspec.yaml chỉ đăng ký font Baloo 2 cục bộ cho giao diện theo mẫu. |
| Dọn code danh sách | Xóa home_screen.dart và dữ liệu Dart/Widget/Layout/State/Git; thay test danh sách. Giữ features/home/.gitkeep theo mẫu công ty. |
| Git feature branch | feature/login-screen; không làm trên nhánh chung. |
| Private, commit, push, PR và reviewer | Đã tạo repo Private wrk-01, kiểm tra Private trước push và mở PR #1 vào main. Chưa gán reviewer; câu hỏi ghi vào file TXT theo yêu cầu người dùng. |

## File chính

- lib/app/app.dart: dùng LoginScreen, đổi tên MaterialApp.
- lib/app/app_theme.dart: mở rộng theme đang có với ô nhập/nút bo góc, nền sáng.
- lib/features/auth/presentation/widgets/login_illustration.dart: minh họa vector nhóm bạn và xúc xắc.
- lib/features/auth/presentation/widgets/login_background.dart: nền và hình trang trí nhẹ.
- assets/fonts/baloo_2_variable.ttf, assets/fonts/ofl.txt, pubspec.yaml: font tiếng Việt và giấy phép, không thêm dependency.
- lib/features/auth/presentation/login_screen.dart: form demo và vòng đời controller.
- lib/features/home/presentation/home_screen.dart: xóa vì không còn dùng.
- lib/features/home/.gitkeep: giữ thư mục mẫu.
- test/widget_test.dart: 8 test tương tác và responsive.
- web/index.html, web/manifest.json: tên hiển thị và metadata Lên kèo!.
- README.md, docs/onboarding_report.md, docs/pr_description.md:
  hướng dẫn và bàn giao.
- docs/questions_for_mentor.txt: các thông tin cần hỏi người hướng dẫn.

main.dart, dependency, lint và file nền tảng khác được giữ nguyên.
Không bổ sung đăng ký, quên mật khẩu, social login, trò chơi hoặc backend.
Code danh sách cũ không có lỗi thực tế; bị thay vì phạm vi đã đổi.

## Kiểm tra thực tế

- Dart format: lần chỉnh theo mẫu đã chạy trên 5 file Dart thay đổi.
- Flutter analyze: lần cuối đạt No issues found, exit code 0.
- Flutter test: 8 test đạt, gồm các trường hợp người dùng yêu cầu.
  Đã chạy lại test responsive với đúng AppTheme của ứng dụng.
- Flutter build web --no-web-resources-cdn: thành công, build/web.
- Chrome headless: đã chạy bản build qua HTTP server cục bộ; kiểm tra ảnh
  desktop 1280 × 900, điện thoại 360 × 740 và màn hình 320 × 480 sau cuộn,
  không thấy tràn; form và nút vẫn hiển thị khi cuộn trên màn hình nhỏ.
  Phiên kiểm tra ghi nhận 0 lỗi JavaScript.
- Chưa kiểm tra bàn phím thật trên Android/iOS; widget test dùng viewInsets
  để mô phỏng vùng bàn phím. Chưa kiểm tra tương tác thủ công trong Chrome có cửa sổ.

Ảnh Chrome theo mẫu ở ../.onboarding_review/login_baseline/reference_desktop.png,
reference_mobile.png và reference_small_scrolled.png, ngoài repository.
Snapshot trước sửa ở .onboarding_review/login_baseline/ trong project,
được gitignore và không commit. Không dùng mật khẩu tài khoản thật trong test.

## Git

Trước sửa: chưa có commit, remote hoặc nhánh chung; tất cả file project untracked.
Đã tạo nhánh feature/login-screen mà không mất thay đổi có sẵn.
Tên/email tác giả được cấu hình riêng repository:
trungnguyen2482-dev và 335909539+trungnguyen2482-dev@users.noreply.github.com.
Định dạng noreply dựa trên tài liệu GitHub:
https://docs.github.com/en/account-and-profile/reference/email-addresses-reference

Repository người dùng chọn: trungnguyen2482-dev/wrk-01, Private.
Đã đăng nhập bằng Git Credential Manager; token không được ghi vào file/chat.
Đã tạo repository Private và fetch origin/main. Main chỉ có README khởi tạo;
đặt nền feature bằng commit đó qua index/ref, giữ nguyên file làm việc.
Không commit trực tiếp vào main.

Các commit tách theo mục đích:
- b56f62f chore(flutter): track existing demo scaffold
- af54ec1 feat(auth): add demo login screen for Len keo
- docs(onboarding): document login checks and mentor questions

Commit scaffold ghi nhận project đã có và màn hình danh sách trước sửa,
để commit tính năng sau thể hiện đúng việc thay thế. Dùng snapshot cho index,
không khôi phục hoặc ghi đè code mới trong thư mục làm việc.
Đã kiểm tra diff và chỉ stage code project, test và tài liệu bàn giao.
Snapshot, file build, local.properties và bí mật không được stage.

PR: https://github.com/trungnguyen2482-dev/wrk-01/pull/1
Nhánh nguồn feature/login-screen, nhánh đích main thực tế của repo cá nhân.
Reviewer chưa được cung cấp, ghi trong docs/questions_for_mentor.txt.
Không tự chọn reviewer, approve hoặc merge PR.

## Cập nhật giao diện theo ảnh được chọn

Minh họa nhóm bạn và xúc xắc bằng CustomPainter, font Baloo 2 tiếng Việt
đóng gói cục bộ cùng giấy phép OFL. Nền tím nhạt và trang trí nhẹ,
thẻ trắng bo góc, nhãn trên ô nhập, nút tím tươi. Không sử dụng mockup,
khung điện thoại, thanh trạng thái hoặc chú thích ngoài ảnh làm giao diện.
Đây là thay đổi trình bày; không thêm màn hình hoặc chức năng mới.

Giữ nguyên code validation, submit và dispose qua đối chiếu với commit trước.
Tám widget test vẫn đạt. Test nút mắt được cuộn đến vị trí nút trước khi bấm,
vì bố cục minh họa mới cao hơn khi cửa sổ thấp. Khi có bàn phím, minh họa
thu nhỏ còn 84 logical pixels và toàn bộ nội dung tiếp tục cuộn được.
