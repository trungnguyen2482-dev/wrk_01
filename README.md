# Màn hình giao diện trang du lịch — Tuần 2–3

Dựng giao diện theo mẫu, sử dụng dữ liệu địa điểm và ảnh có sẵn trong project.

## Cách chạy

Mở terminal tại thư mục `flutter_application_1`:

```powershell
flutter pub get
flutter run -d chrome
```

`lib/main.dart` chạy `MyApp` và mở `TravelHomeScreen`.

## Các màn hình và tương tác

- Trang chủ: bấm ảnh để xem trước, bấm ngoài để đóng;
  bấm thông tin để mở chi tiết địa điểm.
- Xem tất cả và nút Khám phá ngay trên banner mở danh sách 6 địa điểm.
- Lọc danh mục từ trang chủ hoặc bằng hàng chip:
  - Biển: Hạ Long, Nha Trang.
  - Núi: Đà Lạt, Sa Pa.
  - Thành phố: Hội An, Đà Nẵng.
  - Tất cả: đủ 6 địa điểm.
- Cắm trại hiển thị thông báo rỗng, có thể quay lại hoặc đổi danh mục.
- Chi tiết hiển thị tên, tỉnh thành, giá, đánh giá, mô tả và ảnh
  của địa điểm được chọn.
- Thư viện mở đúng ảnh được bấm; vuốt ngang cập nhật số ảnh
  và chấm đánh dấu.
- Quay lại từ thư viện qua chi tiết về danh sách giữ danh mục đã chọn.
- Mở chi tiết trực tiếp từ trang chủ rồi quay lại đúng trang chủ.

## Dữ liệu và cách triển khai

- Dữ liệu mẫu: `lib/data/du_lieu_mau.dart`.
- Các màn hình: `lib/features/travel/presentation/`.
- `Image.asset` hiển thị ảnh từ assets.
- `ListView.builder` dựng danh sách địa điểm.
- Constructor truyền đối tượng `Destination` sang chi tiết.
- `where(...).toList()` lọc địa điểm theo danh mục.
- `setState` cập nhật danh mục và vị trí ảnh.
- `PageView.builder` dựng các trang ảnh.
- `PageController` đặt trang mở đầu bằng `initialPage`.
- `onPageChanged` cập nhật số ảnh và chấm đánh dấu.
- Sử dụng `SafeArea`, `Expanded` và vùng cuộn cho bố cục màn hình nhỏ.

## Kiểm tra

```powershell
flutter analyze lib/features/travel
```

Đã kiểm tra thủ công đạt 9/9 mục trong checklist trước demo:
mở chi tiết từ trang chủ, danh sách đủ 6 địa điểm, lọc danh mục,
trạng thái rỗng, dữ liệu chi tiết, thư viện ảnh, giữ danh mục khi quay lại,
quay đúng trang chủ và thao tác lặp lại trên màn hình nhỏ.

Đã kiểm tra giao diện trên Chrome ở 390 × 844 và 360 × 640.
