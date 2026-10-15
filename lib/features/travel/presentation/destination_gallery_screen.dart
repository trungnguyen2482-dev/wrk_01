import 'package:flutter/material.dart';

import '../../../data/du_lieu_mau.dart';

class DestinationGalleryScreen extends StatefulWidget {
  const DestinationGalleryScreen({
    super.key,
    required this.destination,
    this.initialIndex = 0,
  });

  final Destination destination;
  final int initialIndex;

  @override
  State<DestinationGalleryScreen> createState() =>
      _DestinationGalleryScreenState();
}

class _DestinationGalleryScreenState extends State<DestinationGalleryScreen> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    // Ghi nhận ảnh cần hiển thị ngay khi mở thư viện.
    _currentIndex = widget.initialIndex;

    // Cho vùng vuốt bắt đầu đúng trang ảnh đó.
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    // Giải phóng controller khi màn hình bị đóng.
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final destination = widget.destination;
    final images = destination.galleryAssets;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Nút quay lại, tiêu đề và số ảnh.
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).maybePop();
                        },
                        tooltip: 'Quay lại',
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Color(0xFF20364B),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Ảnh địa điểm',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF20364B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    destination.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF20364B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ảnh ${_currentIndex + 1} trong ${images.length}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF758292),
                    ),
                  ),
                ],
              ),
            ),

            // 2. Vùng ảnh nhận chiều cao còn lại và vuốt ngang.
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: Image.asset(
                      images[index],
                      width: double.infinity,
                      fit: BoxFit.contain,
                      semanticLabel: 'Ảnh ${index + 1} của ${destination.name}',
                    ),
                  );
                },
              ),
            ),

            // 3. Hướng dẫn và chấm đánh dấu ảnh đang xem.
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Vuốt ngang để xem ảnh tiếp',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Color(0xFF758292)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var index = 0; index < images.length; index++)
                        Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _currentIndex
                                ? const Color(0xFF21867A)
                                : const Color(0xFFD0DADD),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
