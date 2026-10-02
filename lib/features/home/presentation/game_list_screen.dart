import 'package:flutter/material.dart';

import '../../../core/widgets/friends_illustration.dart';
import '../../../core/widgets/party_background.dart';
import 'widgets/game_card.dart';

class GameListScreen extends StatelessWidget {
  const GameListScreen({super.key});

  static const _games = <({String title, String description, IconData icon})>[
    (
      title: 'Truth or Dare',
      description: 'Nói thật hay nhận thử thách?',
      icon: Icons.question_answer_rounded,
    ),
    (
      title: 'Coup',
      description: 'Đấu trí, đánh lừa và giành lợi thế',
      icon: Icons.theater_comedy_rounded,
    ),
    (
      title: 'Ma sói',
      description: 'Suy luận và tìm người ẩn vai',
      icon: Icons.nightlight_round,
    ),
    (
      title: 'Đoán từ',
      description: 'Gợi ý thật khéo, đoán thật nhanh',
      icon: Icons.chat_bubble_outline_rounded,
    ),
    (
      title: 'Đoán hình',
      description: 'Vẽ một chút, đoán một chút',
      icon: Icons.draw_rounded,
    ),
    (
      title: 'Thử thách theo đội',
      description: 'Chia đội và cùng vượt thử thách',
      icon: Icons.flag_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const PartyBackground(),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Row(
                      children: [
                        IconButton.filledTonal(
                          tooltip: 'Quay lại đăng nhập',
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back_rounded),
                        ),
                        Expanded(
                          child: Text(
                            'Lên kèo!',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Baloo2',
                              fontWeight: FontWeight.w800,
                              fontSize: 40,
                              height: 1.2,
                              color: Color(0xFF4E2398),
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hôm nay chơi gì?',
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  fontFamily: 'Baloo2',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Chọn một trò, cả nhóm cùng vui!',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF574771),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        const SizedBox(
                          width: 96,
                          height: 96,
                          child: FriendsIllustration(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    for (final game in _games) ...[
                      GameCard(
                        title: game.title,
                        description: game.description,
                        icon: game.icon,
                        onTap: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${game.title} đang được phát triển',
                                ),
                              ),
                            );
                        },
                      ),
                      const SizedBox(height: 12),
                    ],
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Bản demo — trò chơi chưa được triển khai',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF80709F),
                        ),
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
}
