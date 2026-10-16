import 'package:flutter/material.dart';

import '../../../data/du_lieu_mau.dart';
import 'destination_detail_screen.dart';
import 'widgets/destination_row.dart';

class DestinationListScreen extends StatefulWidget {
  const DestinationListScreen({super.key, this.initialCategory = 'all'});

  // Danh mục được chọn khi vừa mở màn hình.
  final String initialCategory;

  @override
  State<DestinationListScreen> createState() => _DestinationListScreenState();
}

class _DestinationListScreenState extends State<DestinationListScreen> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();

    // Chỉ lấy lựa chọn ban đầu khi State được tạo.
    _selectedCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    // Tất cả dùng dữ liệu gốc; các mục khác dùng kết quả lọc.
    final destinations = _selectedCategory == 'all'
        ? sampleDestinations
        : sampleDestinations.where((destination) {
            return destination.category == _selectedCategory;
          }).toList();

    final title = _selectedCategory == 'all'
        ? 'Tất cả địa điểm'
        : categoryNames[_selectedCategory] ?? 'Danh mục';

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề và nút quay lại.
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
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF20364B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (destinations.isNotEmpty) ...[
                Text(
                  _selectedCategory == 'all'
                      ? 'Chọn nơi bạn muốn khám phá'
                      : '${destinations.length} địa điểm dành cho bạn',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF758292),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Hàng chip luôn có mặt, kể cả khi kết quả rỗng.
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _categoryButton('Tất cả', 'all'),
                    _categoryButton('Biển', 'beach'),
                    _categoryButton('Núi', 'mountain'),
                    _categoryButton('Thành phố', 'city'),
                    _categoryButton('Cắm trại', 'camp'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Chọn hiển thị thông báo rỗng hoặc danh sách.
              Expanded(
                child: destinations.isEmpty
                    ? _emptyState()
                    : ListView.builder(
                        key: ValueKey(_selectedCategory),
                        itemCount: destinations.length,
                        itemBuilder: (context, index) {
                          final destination = destinations[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (context) =>
                                        DestinationDetailScreen(
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

  Widget _categoryButton(String label, String category) {
    final isSelected = _selectedCategory == category;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedCategory = category;
          });
        },
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

  Widget _emptyState() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 110,
                height: 110,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7EDFF),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Image.asset('assets/camp.png', fit: BoxFit.contain),
              ),
              const SizedBox(height: 32),
              const Text(
                'Chưa có địa điểm',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF20364B),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Danh mục này hiện chưa có dữ liệu.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  color: Color(0xFF758292),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Em có thể khám phá danh mục khác.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  color: Color(0xFF758292),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 204,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF21867A),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    minimumSize: const Size(0, 48),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Quay lại khám phá',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
