import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_application_1/app/app_theme.dart';
import 'package:flutter_application_1/features/auth/presentation/login_screen.dart';
import 'package:flutter_application_1/features/home/presentation/game_list_screen.dart';
import 'package:flutter_application_1/features/home/presentation/widgets/game_card.dart';
import 'package:flutter_test/flutter_test.dart';

final _emailField = find.byType(TextFormField).at(0);
final _passwordField = find.byType(TextFormField).at(1);
final _loginButton = find.widgetWithText(FilledButton, 'Đăng nhập');

Future<void> _submit(WidgetTester tester) async {
  await tester.ensureVisible(_loginButton);
  await tester.pumpAndSettle();
  await tester.tap(_loginButton);
  await tester.pumpAndSettle();
}

TextField _passwordInput(WidgetTester tester) => tester.widget<TextField>(
  find.descendant(of: _passwordField, matching: find.byType(TextField)),
);

void main() {
  testWidgets('Shows the app branding and demo login form', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Lên kèo!'), findsOneWidget);
    expect(find.text('Tụ đủ bạn, lên kèo chơi!'), findsOneWidget);
    expect(find.text('Đăng nhập'), findsNWidgets(2));
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Nhập email của bạn'), findsOneWidget);
    expect(find.text('Mật khẩu'), findsOneWidget);
    expect(find.text('Bản demo — chưa kết nối tài khoản'), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(_passwordInput(tester).obscureText, isTrue);
    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('Empty fields show their own errors without success', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await _submit(tester);

    expect(find.text('Vui lòng nhập email.'), findsOneWidget);
    expect(find.text('Vui lòng nhập mật khẩu.'), findsOneWidget);
    expect(find.byType(GameListScreen), findsNothing);
  });

  testWidgets('Rejects whitespace-only and malformed emails', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(_passwordField, 'secret');
    for (final email in [
      '   ',
      'email',
      'a@b',
      'a b@example.com',
      'a@@example.com',
    ]) {
      await tester.enterText(_emailField, email);
      await _submit(tester);
      expect(
        find.text(
          email.trim().isEmpty
              ? 'Vui lòng nhập email.'
              : 'Email không đúng định dạng.',
        ),
        findsOneWidget,
      );
      expect(find.byType(GameListScreen), findsNothing);
    }
  });

  testWidgets('A valid email still requires a password', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(_emailField, 'friend@example.com');
    await _submit(tester);

    expect(find.text('Vui lòng nhập mật khẩu.'), findsOneWidget);
    expect(find.text('Email không đúng định dạng.'), findsNothing);
    expect(find.byType(GameListScreen), findsNothing);
  });

  testWidgets(
    'Valid data opens games; back preserves trimmed email and password',
    (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.enterText(_emailField, '  friend@example.com  ');
      await tester.enterText(_passwordField, '  mật khẩu  ');
      await _submit(tester);

      expect(find.byType(GameListScreen), findsOneWidget);
      await tester.tap(find.byTooltip('Quay lại đăng nhập'));
      await tester.pumpAndSettle();

      final email = tester.widget<TextField>(
        find.descendant(of: _emailField, matching: find.byType(TextField)),
      );
      expect(email.controller!.text, 'friend@example.com');
      expect(_passwordInput(tester).controller!.text, '  mật khẩu  ');
      expect(find.byType(GameListScreen), findsNothing);
    },
  );

  testWidgets('Does not trim a password made of spaces', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(_emailField, 'friend@example.com');
    await tester.enterText(_passwordField, '   ');
    await _submit(tester);

    expect(find.byType(GameListScreen), findsOneWidget);
    await tester.tap(find.byTooltip('Quay lại đăng nhập'));
    await tester.pumpAndSettle();
    expect(_passwordInput(tester).controller!.text, '   ');
  });

  testWidgets('Visibility toggle preserves password through both states', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(_passwordField, '  secret  ');
    await tester.ensureVisible(find.byTooltip('Hiện mật khẩu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Hiện mật khẩu'));
    await tester.pump();

    expect(_passwordInput(tester).obscureText, isFalse);
    expect(_passwordInput(tester).controller!.text, '  secret  ');
    await tester.tap(find.byTooltip('Ẩn mật khẩu'));
    await tester.pump();
    expect(_passwordInput(tester).obscureText, isTrue);
    expect(_passwordInput(tester).controller!.text, '  secret  ');

    await tester.pumpWidget(const SizedBox());
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'Small screen with keyboard and large text scrolls without overflow',
    (tester) async {
      tester.view.physicalSize = const Size(320, 480);
      tester.view.devicePixelRatio = 1;
      tester.view.viewInsets = const FakeViewPadding(bottom: 200);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetViewInsets);

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(2)),
            child: child!,
          ),
          home: const LoginScreen(),
        ),
      );
      await tester.enterText(_emailField, 'friend@example.com');
      await tester.enterText(_passwordField, 'secret');
      await _submit(tester);

      expect(find.byType(GameListScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('Platform Back returns to the existing login form', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(_emailField, 'friend@example.com');
    await tester.enterText(_passwordField, 'secret');
    await _submit(tester);
    expect(find.byType(GameListScreen), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(GameListScreen), findsNothing);
    expect(_passwordInput(tester).controller!.text, 'secret');
  });

  testWidgets('All six game cards show their matching development message', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.light, home: const GameListScreen()),
    );
    const games = {
      'Truth or Dare': 'Nói thật hay nhận thử thách?',
      'Coup': 'Đấu trí, đánh lừa và giành lợi thế',
      'Ma sói': 'Suy luận và tìm người ẩn vai',
      'Đoán từ': 'Gợi ý thật khéo, đoán thật nhanh',
      'Đoán hình': 'Vẽ một chút, đoán một chút',
      'Thử thách theo đội': 'Chia đội và cùng vượt thử thách',
    };
    for (final game in games.entries) {
      final card = find.widgetWithText(GameCard, game.key);
      await tester.scrollUntilVisible(
        card,
        120,
        scrollable: find.byType(Scrollable),
      );
      expect(
        find.descendant(of: card, matching: find.text(game.value)),
        findsOneWidget,
      );
      await tester.tap(card);
      await tester.pumpAndSettle();
      expect(find.text('${game.key} đang được phát triển'), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets('Game list scrolls on a small screen with large text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: const GameListScreen(),
      ),
    );
    final lastTitle = find.text('Thử thách theo đội');
    await tester.scrollUntilVisible(
      lastTitle,
      150,
      scrollable: find.byType(Scrollable),
    );
    await tester.pumpAndSettle();
    await tester.tap(lastTitle);
    await tester.pumpAndSettle();
    expect(
      find.text('Thử thách theo đội đang được phát triển'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });
}
