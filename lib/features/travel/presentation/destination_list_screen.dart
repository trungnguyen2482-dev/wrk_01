import 'package:flutter/material.dart';

import '../../../data/du_lieu_mau.dart';
import 'destination_detail_screen.dart';
import 'widgets/destination_row.dart';

class DestinationListScreen extends StatelessWidget {
  const DestinationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Phần tiêu đề đứng yên khi cuộn danh sách.
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
                      'Tất cả địa điểm',
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
              const Text(
                'Chọn nơi bạn muốn khám phá',
                style: TextStyle(fontSize: 12, color: Color(0xFF758292)),
              ),
              const SizedBox(height: 16),

              // Ngày 1 chỉ dựng giao diện danh mục.
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _categoryButton('Tất cả', isSelected: true),
                    _categoryButton('Biển'),
                    _categoryButton('Núi'),
                    _categoryButton('Thành phố'),
                    _categoryButton('Cắm trại'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Danh sách nhận chiều cao còn lại và cuộn riêng.
              Expanded(
                child: ListView.builder(
                  itemCount: sampleDestinations.length,
                  itemBuilder: (context, index) {
                    final destination = sampleDestinations[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => DestinationDetailScreen(
                                destination: destination,
                              ),
                            ),
                          );
                        },
                        child: DestinationRow(destination: destination),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFFDFF2EF) : Colors.white,
          foregroundColor: const Color(0xFF20364B),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(label, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
