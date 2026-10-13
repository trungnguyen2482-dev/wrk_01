import 'package:flutter/material.dart';

class TravelHomeScreen extends StatelessWidget {
  const TravelHomeScreen({super.key});

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
        ),
      ),
      child: Scaffold(
        backgroundColor: _background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Loi chao va nut chuong.
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
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
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
                  ],
                ),
                const SizedBox(height: 24),

                // 2. Thanh tim kiem: nhap duoc, chua xu ly tim kiem.
                TextField(
                  style: const TextStyle(fontSize: 14, color: _darkText),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
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

                // 3. Danh muc: bam duoc ca anh va ten.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _category(
                      'Biển',
                      'assets/beach.png',
                      const Color(0xFFDFF2EF),
                    ),
                    _category(
                      'Núi',
                      'assets/mountain.png',
                      const Color(0xFFEDE7FA),
                    ),
                    _category(
                      'Thành phố',
                      'assets/city.png',
                      const Color(0xFFFBEBDD),
                    ),
                    _category(
                      'Cắm trại',
                      'assets/camp.png',
                      const Color(0xFFE7EDFF),
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                // 4. Banner.
                _weekendBanner(),
                const SizedBox(height: 24),

                // 5. Dia diem noi bat.
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
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: _teal),
                      child: const Text(
                        'Xem tất cả',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _destinationCard(
                        'Vịnh Hạ Long',
                        'Quảng Ninh',
                        'assets/ha_long.png',
                        '1.290.000đ',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _destinationCard(
                        'Đà Lạt',
                        'Lâm Đồng',
                        'assets/da_lat.png',
                        '890.000đ',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 6. Goi y.
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
              ],
            ),
          ),
        ),

        // 7. Thanh dieu huong nam co dinh phia duoi.
        bottomNavigationBar: Container(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  _bottomItem('Khám phá', 'assets/home.png', isSelected: true),
                  _bottomItem('Đã lưu', 'assets/heart.png'),
                  _bottomItem('Chuyến đi', 'assets/ticket.png'),
                  _bottomItem('Cá nhân', 'assets/profile.png'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } // build

  Widget _category(String label, String imagePath, Color backgroundColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = (constraints.maxWidth - 12)
                .clamp(0.0, 68.0)
                .toDouble();

            return TextButton(
              onPressed: () {},
              clipBehavior: Clip.antiAlias,
              style: TextButton.styleFrom(
                foregroundColor: _darkText,
                overlayColor: _teal,
                padding: const EdgeInsets.all(6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                ],
              ),
            );
          }, // builder
        ),
      ),
    );
  } // _category

  Widget _weekendBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _bannerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final imageWidth = constraints.maxWidth * 0.34;
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
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Khám phá nơi mới cùng bạn bè',
                      style: TextStyle(
                        fontSize: 11,
                        height: 1.4,
                        color: Color(0xFFC8DCDD),
                      ),
                    ),
                    const SizedBox(height: 14),
                    ElevatedButton(
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
                  ],
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: imageWidth,
                child: AspectRatio(
                  aspectRatio: 224 / 164,
                  child: Image.asset('assets/da_nang.png', fit: BoxFit.contain),
                ),
              ),
            ],
          );
        }, // builder
      ),
    );
  } // _weekendBanner

  Widget _destinationCard(
    String name,
    String location,
    String imagePath,
    String price,
  ) {
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
            ],
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
                    const Text(
                      '4.8',
                      style: TextStyle(fontSize: 12, color: _darkText),
                    ),
                  ],
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
              ],
            ),
          ),
        ],
      ),
    );
  } // _destinationCard

  Widget _suggestionCard() {
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
                child: Image.asset('assets/hoi_an.png', fit: BoxFit.cover),
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
                const Text(
                  'Phố cổ Hội An',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: _darkText,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Văn hoá và ẩm thực',
                  style: TextStyle(fontSize: 11, color: _mutedText),
                ),
                const SizedBox(height: 14),
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
                        const Text(
                          '4.9',
                          style: TextStyle(fontSize: 12, color: _darkText),
                        ),
                      ],
                    ),
                    const Text(
                      '750.000đ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _teal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } // _suggestionCard

  Widget _bottomItem(
    String label,
    String imagePath, {
    bool isSelected = false,
  }) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        clipBehavior: Clip.antiAlias,
        style: TextButton.styleFrom(
          foregroundColor: _darkText,
          overlayColor: _teal,
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
          ],
        ),
      ),
    );
  } // _bottomItem
} // TravelHomeScreen
