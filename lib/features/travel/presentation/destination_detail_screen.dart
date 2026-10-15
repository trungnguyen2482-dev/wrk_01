import 'package:flutter/material.dart';

import '../../../data/du_lieu_mau.dart';
import 'destination_gallery_screen.dart';

class DestinationDetailScreen extends StatelessWidget {
  const DestinationDetailScreen({super.key, required this.destination});

  // Địa điểm được màn hình trước truyền sang.
  final Destination destination;

  static const _darkText = Color(0xFF20364B);
  static const _mutedText = Color(0xFF758292);
  static const _teal = Color(0xFF21867A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Nút quay lại và tiêu đề.
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
                      color: _darkText,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Chi tiết địa điểm',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: _darkText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // 2. Ảnh lớn và nút nằm chồng lên ảnh.
              Stack(
                children: [
                  Image.asset(
                    destination.imageAsset,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: TextButton(
                      // Mở thư viện từ ảnh đầu tiên.
                      onPressed: () {
                        _openGallery(context, 0);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: _teal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Xem ${destination.galleryAssets.length} ảnh',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 3. Tên, vị trí, đánh giá và giá.
              Text(
                destination.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: _darkText,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Image.asset(
                    'assets/location.png',
                    width: 18,
                    height: 18,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      destination.location,
                      style: const TextStyle(fontSize: 13, color: _mutedText),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Image.asset(
                    'assets/star.png',
                    width: 18,
                    height: 18,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    destination.rating.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 13, color: _darkText),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                _formatPrice(destination.price),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _teal,
                ),
              ),
              const SizedBox(height: 24),

              // 4. Giới thiệu.
              const Text(
                'Giới thiệu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _darkText,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                destination.description,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.7,
                  color: _mutedText,
                ),
              ),
              const SizedBox(height: 28),

              // 5. Tiêu đề nhóm ảnh.
              const Text(
                'Ảnh địa điểm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _darkText,
                ),
              ),
              const SizedBox(height: 16),

              // 6. Các ảnh nhỏ chia đều chiều rộng.
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (
                    var index = 0;
                    index < destination.galleryAssets.length;
                    index++
                  ) ...[
                    if (index > 0) const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _openGallery(context, index);
                        },
                        child: Image.asset(
                          destination.galleryAssets[index],
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Truyền địa điểm và vị trí ảnh được bấm sang thư viện.
  void _openGallery(BuildContext context, int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => DestinationGalleryScreen(
          destination: destination,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  String _formatPrice(int price) {
    final formatted = price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    return '$formattedđ';
  }
}
