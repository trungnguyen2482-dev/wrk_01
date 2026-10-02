import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _topics = <({String title, String description})>[
    (title: 'Dart', description: 'Ngôn ngữ lập trình ứng dụng.'),
    (title: 'Widget', description: 'Thành phần xây dựng giao diện Flutter.'),
    (title: 'Layout', description: 'Sắp xếp các widget trên màn hình.'),
    (title: 'State', description: 'Trạng thái của giao diện ứng dụng.'),
    (title: 'Git', description: 'Quản lý phiên bản và review code.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách cơ bản'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _topics.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final topic = _topics[index];

                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(topic.title),
                  subtitle: Text(topic.description),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
