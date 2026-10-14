import 'package:flutter/material.dart';

import '../../../data/du_lieu_mau.dart';
import 'destination_list_screen.dart';

class TravelHomeScreen extends StatelessWidget {
  const TravelHomeScreen({super.key});

  // Màu dùng chung trong màn hình.
  static const _background = Color(0xFFF6F7F9);
  static const _darkText = Color(0xFF20384C);
  static const _mutedText = Color(0xFF7C899C);
  static const _teal = Color(0xFF218C80);
  static const _bannerColor = Color(0xFF203F4C);
  static const _buttonColor = Color(0xFFE9B878);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Roboto',
          bodyColor: _darkText,
          displayColor: _darkText,
        ), // TextTheme
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
                            style: TextStyle(fontSize: 14, color: _mutedText),
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
                  style: const TextStyle(fontSize: 14, color: _darkText), //
                  textInputAction: TextInputAction.search,

                  // Nhấn phím tìm kiếm chỉ đóng bàn phím.
                  // Chưa thực hiện tìm kiếm dữ liệu.
                  onSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  }, // onSubmitted

                  decoration: InputDecoration(
                    hintText: 'Tìm địa điểm yêu thích',
                    hintStyle: const TextStyle(fontSize: 14, color: _mutedText),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
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
                    ), // _category
                    _category(
                      'Núi',
                      'assets/mountain.png',
                      const Color(0xFFEDE7FA),
                    ), // _category
                    _category(
                      'Thành phố',
                      'assets/city.png',
                      const Color(0xFFFBEBDD),
                    ), // _category
                    _category(
                      'Cắm trại',
                      'assets/camp.png',
                      const Color(0xFFE7EDFF),
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
                      child: _destinationCard(
                        sampleDestinations[0].name,
                        sampleDestinations[0].location,
                        sampleDestinations[0].imageAsset,
                        _formatPrice(sampleDestinations[0].price),
                        rating: sampleDestinations[0].rating,
                      ), // _destinationCard
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _destinationCard(
                        sampleDestinations[1].name,
                        sampleDestinations[1].location,
                        sampleDestinations[1].imageAsset,
                        _formatPrice(sampleDestinations[1].price),
                        rating: sampleDestinations[1].rating,
                      ), // _destinationCard
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
                _suggestionCard(),
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
  Widget _category(String label, String imagePath, Color backgroundColor) {
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
              // Bấm được, chưa thực hiện chức năng.
              onPressed: () {},

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
                      padding: const EdgeInsets.all(16),
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
          final imageWidth = constraints.maxWidth * 0.34;

          // Giảm nhẹ chữ khi banner hẹp.
          final titleSize = constraints.maxWidth < 300 ? 16.0 : 18.0;

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
                      // Chưa mở màn hình khám phá.
                      onPressed: () {},
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

  // Phần 5: dựng một thẻ địa điểm.
  // Chỉ trái tim là nút bấm trên thẻ.
  Widget _destinationCard(
    String name,
    String location,
    String imagePath,
    String price, {
    required double rating,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 314 / 258,
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  // Chưa lưu địa điểm hoặc đổi trạng thái tim.
                  onPressed: () {},
                  tooltip: 'Lưu $name',
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
            ], // children của Stack
          ),
          const SizedBox(height: 14),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
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
                        location,
                        style: const TextStyle(fontSize: 12, color: _mutedText),
                      ),
                    ),
                  ], // children của Row
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
                      rating.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 12, color: _darkText),
                    ),
                  ], // children của Row
                ),
                const SizedBox(height: 12),

                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _teal,
                  ),
                ),
                const SizedBox(height: 4),
              ], // children của Column
            ),
          ),
        ], // children của Column
      ),
    );
  } // _destinationCard

  // Phần 6: dựng thẻ Hội An.
  Widget _suggestionCard() {
    final destination = sampleDestinations[2];
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: AspectRatio(
                aspectRatio: 214 / 166,
                child: Image.asset(destination.imageAsset, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            flex: 6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.name,
                  style: const TextStyle(
                    fontSize: 17,
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

                // Giá xuống hàng nếu không đủ chiều rộng.
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
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
                      ], // children của Row
                    ),

                    Text(
                      _formatPrice(destination.price),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _teal,
                      ),
                    ),
                  ], // children của Wrap
                ),
              ], // children của Column
            ),
          ),
        ], // children của Row
      ),
    );
  } // _suggestionCard

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
                  width: 24,
                  height: 24,
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
