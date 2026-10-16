import 'package:flutter/material.dart';

import '../../../../data/du_lieu_mau.dart';

// Hiển thị một địa điểm được truyền vào.
class DestinationRow extends StatelessWidget {
  const DestinationRow({super.key, required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Ảnh bên trái.
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              destination.imageAsset,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Nhóm thông tin bên phải.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.name,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF20364B),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  destination.location,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF758292),
                  ),
                ),
                const SizedBox(height: 8),

                // Ngôi sao và điểm đánh giá nằm cạnh nhau.
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
                        color: Color(0xFF20364B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  _formatPrice(destination.price),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF21867A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Định dạng số ví dụ như 1290000 thành chữ 1.290.000đ.
  String _formatPrice(int price) {
    final formatted = price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    return '$formattedđ';
  }
}
