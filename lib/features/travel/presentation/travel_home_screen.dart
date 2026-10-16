import 'package:flutter/material.dart';

import '../../../data/du_lieu_mau.dart';
import 'destination_detail_screen.dart';
import 'destination_list_screen.dart';

class TravelHomeScreen extends StatelessWidget {
  const TravelHomeScreen({super.key});

  // Màu dùng chung trong màn hình.
  static const _background = Color(0xFFF7F8FA);
  static const _darkText = Color(0xFF20364B);
  static const _mutedText = Color(0xFF758292);
  static const _teal = Color(0xFF21867A);
  static const _bannerColor = Color(0xFF203F4C);
  static const _buttonColor = Color(0xFFE9B878);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme
            .apply(bodyColor: _darkText, displayColor: _darkText), // TextTheme
      ), // ThemeData

      child: Scaffold(
        backgroundColor: _background,

        // Phần 1–6 nằm trong vùng nội dung cuộn.
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Lời chào và nút chuông.
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chào Minh Anh',
                            style: TextStyle(fontSize: 13, color: _mutedText),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Đi đâu hôm nay?',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: _darkText,
                            ),
                          ),
                        ], // children của Column
                      ),
                    ),
                    const SizedBox(width: 12),

                    IconButton(
                      // Chưa mở thông báo.
                      onPressed: () {},
                      tooltip: 'Thông báo',
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                        minimumSize: const Size(48, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: Image.asset(
                        'assets/bell.png',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ], // children của Row
                ),
                const SizedBox(height: 24),

                // 2. Thanh tìm kiếm: nhập được chữ.
                TextField(
                  style: const TextStyle(fontSize: 13, color: _darkText), //
                  textInputAction: TextInputAction.search,

                  // Nhấn phím tìm kiếm chỉ đóng bàn phím.
                  // Chưa thực hiện tìm kiếm dữ liệu.
                  onSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  }, // onSubmitted

                  decoration: InputDecoration(
                    hintText: 'Tìm địa điểm yêu thích',
                    hintStyle: const TextStyle(fontSize: 13, color: _mutedText),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        'assets/search.png',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Các nút danh mục.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _category(
                      'Biển',
                      'assets/beach.png',
                      const Color(0xFFDFF2EF),
                      'beach',
                    ), // _category
                    _category(
                      'Núi',
                      'assets/mountain.png',
                      const Color(0xFFEDE7FA),
                      'mountain',
                    ), // _category
                    _category(
                      'Thành phố',
                      'assets/city.png',
                      const Color(0xFFFBEBDD),
                      'city',
                    ), // _category
                    _category(
                      'Cắm trại',
                      'assets/camp.png',
                      const Color(0xFFE7EDFF),
                      'camp',
                    ), // _category
                  ], // children của Row
                ),
                const SizedBox(height: 28),

                // 4. Banner.
                _weekendBanner(),
                const SizedBox(height: 24),

                // 5. Địa điểm nổi bật.
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Địa điểm nổi bật',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _darkText,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const DestinationListScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(foregroundColor: _teal),
                      child: const Text(
                        'Xem tất cả',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ], // children của Row
                ),
                const SizedBox(height: 12),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _destinationCard(context, sampleDestinations[0]),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _destinationCard(context, sampleDestinations[1]),
                    ),
                  ], // children của Row
                ),
                const SizedBox(height: 24),

                // 6. Gợi ý dành cho bạn.
                const Text(
                  'Gợi ý dành cho bạn',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _darkText,
                  ),
                ),
                const SizedBox(height: 20),
                _suggestionCard(context),
                const SizedBox(height: 20),
              ], // children của Column chính
            ),
          ),
        ),

        // 7. Thanh dưới cố định.
        bottomNavigationBar: Container(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  _bottomItem(
                    'Khám phá',
                    'assets/home.png',
                    isSelected: true,
                  ), // _bottomItem
                  _bottomItem('Đã lưu', 'assets/heart.png'), // _bottomItem
                  _bottomItem('Chuyến đi', 'assets/ticket.png'), // _bottomItem
                  _bottomItem('Cá nhân', 'assets/profile.png'), // _bottomItem
                ], // children của Row
              ),
            ),
          ),
        ),
      ),
    );
  } // build

  // Phần 3: vùng bấm gồm cả biểu tượng và chữ.
  Widget _category(
    String label,
    String imagePath,
    Color backgroundColor,
    String category,
  ) {
    return Expanded(
      child: Padding(
        // Tách vùng bấm khỏi danh mục bên cạnh.
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = (constraints.maxWidth - 12)
                .clamp(0.0, 68.0)
                .toDouble();

            return TextButton(
              // Mở danh sách với danh mục tương ứng.
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        DestinationListScreen(initialCategory: category),
                  ),
                );
              },

              // Cắt hiệu ứng bấm theo đường bo của nút.
              clipBehavior: Clip.antiAlias,

              style: TextButton.styleFrom(
                foregroundColor: _darkText,

                // Màu phản hồi khi bấm hoặc đưa chuột vào.
                overlayColor: Colors.grey,

                // Khoảng đệm quanh cả hình và chữ.
                padding: const EdgeInsets.all(6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                // Bo tròn vùng bấm bên ngoài.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: size,
                      height: size,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Image.asset(imagePath, fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: _darkText,
                    ),
                  ),
                ], // children của Column
              ),
            );
          }, // builder
        ),
      ),
    );
  } // _category

  // Phần 4: dựng banner.
  Widget _weekendBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _bannerColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: LayoutBuilder(
        builder: (context, constraints) {
          // Chiều rộng ảnh thay đổi theo chiều rộng banner.
          final imageWidth = constraints.maxWidth * 0.40;

          // Cỡ tiêu đề nằm trong khoảng quy định.
          final titleSize = 19.0;

          return Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cuối tuần đổi gió',
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      'Khám phá nơi mới cùng bạn bè',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFFC8DCDD),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 14),

                    ElevatedButton(
                      // Mở danh sách tất cả địa điểm.
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const DestinationListScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _buttonColor,
                        foregroundColor: _darkText,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Khám phá ngay',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ], // children của Column
                ),
              ),
              const SizedBox(width: 12),

              SizedBox(
                width: imageWidth,
                child: AspectRatio(
                  // Giữ tỉ lệ khung ảnh nằm ngang.
                  aspectRatio: 224 / 164,
                  child: Image.asset('assets/da_nang.png', fit: BoxFit.contain),
                ),
              ),
            ], // children của Row
          );
        }, // builder
      ),
    );
  } // _weekendBanner

  // Phần 5: ảnh mở xem trước, thông tin mở chi tiết.
  Widget _destinationCard(BuildContext context, Destination destination) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Chỉ vùng ảnh mở hộp thoại xem trước.
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _showImagePreview(context, destination);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: AspectRatio(
                    aspectRatio: 314 / 258,
                    child: Image.asset(
                      destination.imageAsset,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Tim nằm riêng trong Stack, không nằm trong vùng bấm ảnh.
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () {},
                  tooltip: 'Lưu ${destination.name}',
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(7),
                    minimumSize: const Size(28, 28),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const CircleBorder(),
                  ),
                  icon: Image.asset(
                    'assets/heart.png',
                    width: 14,
                    height: 14,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),

          // Cả vùng thông tin, gồm khoảng đệm, mở chi tiết.
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _openDestinationDetail(context, destination);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 14, 4, 4),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: _darkText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/location.png',
                          width: 14,
                          height: 14,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            destination.location,
                            style: const TextStyle(
                              fontSize: 12,
                              color: _mutedText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Image.asset(
                          'assets/star.png',
                          width: 16,
                          height: 16,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          destination.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 12,
                            color: _darkText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _formatPrice(destination.price),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: _teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Phần 6: thẻ Hội An có vùng ảnh trái và thông tin phải.
  Widget _suggestionCard(BuildContext context) {
    final destination = sampleDestinations[2];

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _showImagePreview(context, destination);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 214 / 166,
                  child: Image.asset(destination.imageAsset, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 6,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _openDestinationDetail(context, destination);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: _darkText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Văn hóa và ẩm thực',
                      style: TextStyle(fontSize: 11, color: _mutedText),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/star.png',
                              width: 16,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              destination.rating.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 12,
                                color: _darkText,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          _formatPrice(destination.price),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: _teal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Mở ảnh lớn trên trang chủ; bấm ngoài để đóng.
  void _showImagePreview(BuildContext context, Destination destination) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black87,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: const EdgeInsets.all(24),
          child: Image.asset(
            destination.imageAsset,
            fit: BoxFit.contain,
            semanticLabel: 'Ảnh ${destination.name}',
          ),
        );
      },
    );
  }

  // Mở chi tiết bằng đối tượng của thẻ đang bấm.
  void _openDestinationDetail(BuildContext context, Destination destination) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => DestinationDetailScreen(destination: destination),
      ),
    );
  }

  // Phần 7: bấm được cả vùng biểu tượng và chữ.
  Widget _bottomItem(
    String label,
    String imagePath, {
    bool isSelected = false,
  }) {
    return Expanded(
      child: TextButton(
        // Chưa chuyển màn hình hoặc đổi mục được chọn.
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: _darkText,
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFDFF2EF)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 6),

            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: isSelected ? _teal : _mutedText,
              ),
            ),
          ], // children của Column
        ),
      ),
    );
  } // _bottomItem

  // Chuyển giá dạng số thành chữ có dấu phân cách hàng nghìn.
  String _formatPrice(int price) {
    final formatted = price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    return '$formattedđ';
  }
} // TravelHomeScreen
