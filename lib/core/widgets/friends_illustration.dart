import 'package:flutter/material.dart';

class FriendsIllustration extends StatelessWidget {
  const FriendsIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Center(
        child: AspectRatio(
          aspectRatio: 320 / 200,
          child: CustomPaint(painter: _FriendsPainter()),
        ),
      ),
    );
  }
}

class _FriendsPainter extends CustomPainter {
  static const _darkPurple = Color(0xFF5D2CBE);
  static const _lightPurple = Color(0xFFAF7BFA);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.clipRect(Offset.zero & size);
    canvas.scale(size.width / 320, size.height / 200);

    _drawConfetti(canvas);
    _drawDice(canvas);
    _drawFriend(canvas, const Offset(162, 108), _darkPurple, center: true);
    _drawFriend(canvas, const Offset(72, 146), _lightPurple);
    _drawFriend(canvas, const Offset(250, 147), _lightPurple, mirrored: true);

    // Curve the bottom of the group as in the reference illustration.
    canvas.drawOval(
      const Rect.fromLTWH(98, 191, 128, 32),
      Paint()..color = const Color(0xFFF7F2FF),
    );
    canvas.restore();
  }

  void _drawFriend(
    Canvas canvas,
    Offset head,
    Color color, {
    bool center = false,
    bool mirrored = false,
  }) {
    canvas.save();
    canvas.translate(head.dx, head.dy);
    if (mirrored) canvas.scale(-1, 1);
    final bodyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          color,
          center ? const Color(0xFF48209D) : const Color(0xFFBE92FF),
        ],
      ).createShader(const Rect.fromLTWH(-60, -50, 140, 120));
    final body = Path()
      ..moveTo(-25, 20)
      ..cubicTo(-47, 22, -53, 49, -48, 65)
      ..quadraticBezierTo(0, 83, 48, 65)
      ..cubicTo(53, 47, 44, 25, 25, 20)
      ..close();
    canvas.drawPath(body, bodyPaint);
    final arms = Path();
    if (center) {
      arms
        ..moveTo(-21, 33)
        ..cubicTo(-49, 15, -58, -10, -59, -42)
        ..moveTo(22, 33)
        ..cubicTo(47, 20, 59, 3, 63, -17);
    } else {
      arms
        ..moveTo(-22, 35)
        ..quadraticBezierTo(-43, 44, -64, 26)
        ..moveTo(21, 36)
        ..quadraticBezierTo(48, 27, 67, 53);
    }
    canvas.drawPath(
      arms,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = center ? 20 : 19
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawCircle(Offset.zero, center ? 26 : 29, bodyPaint);
    final facePaint = Paint()
      ..color = center ? Colors.white : const Color(0xFF4E2398);
    canvas.drawCircle(const Offset(-9, -3), 2.8, facePaint);
    canvas.drawCircle(const Offset(9, -3), 2.8, facePaint);
    final smile = Path()
      ..moveTo(-11, 6)
      ..quadraticBezierTo(0, 12, 12, 5)
      ..quadraticBezierTo(8, 23, -5, 16)
      ..quadraticBezierTo(-11, 13, -11, 6)
      ..close();
    canvas.drawPath(smile, facePaint);
    canvas.restore();
  }

  void _drawDice(Canvas canvas) {
    canvas.save();
    canvas.translate(162, 1);
    final top = Path()
      ..moveTo(0, 4)
      ..lineTo(30, 21)
      ..lineTo(0, 39)
      ..lineTo(-30, 21)
      ..close();
    final left = Path()
      ..moveTo(-30, 21)
      ..lineTo(0, 39)
      ..lineTo(0, 72)
      ..lineTo(-30, 54)
      ..close();
    final right = Path()
      ..moveTo(0, 39)
      ..lineTo(30, 21)
      ..lineTo(30, 54)
      ..lineTo(0, 72)
      ..close();
    canvas.drawPath(top, Paint()..color = Colors.white);
    canvas.drawPath(left, Paint()..color = const Color(0xFFEDE1FF));
    canvas.drawPath(right, Paint()..color = _darkPurple);
    final edge = Paint()
      ..color = _darkPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeJoin = StrokeJoin.round;
    for (final face in [top, left, right]) {
      canvas.drawPath(face, edge);
    }
    final pip = Paint()..color = _darkPurple;
    for (final point in [
      const Offset(-10, 20),
      const Offset(2, 16),
      const Offset(11, 23),
      const Offset(-1, 27),
      const Offset(-21, 36),
      const Offset(-9, 53),
    ]) {
      canvas.drawCircle(point, 3, pip);
    }
    pip.color = Colors.white;
    canvas.drawCircle(const Offset(10, 45), 3, pip);
    canvas.drawCircle(const Offset(21, 47), 3, pip);
    canvas.restore();
  }

  void _drawConfetti(Canvas canvas) {
    final paint = Paint()
      ..color = const Color(0xFF8B4BF2)
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;
    for (final (start, end) in [
      (const Offset(79, 37), const Offset(85, 47)),
      (const Offset(59, 64), const Offset(68, 69)),
      (const Offset(237, 59), const Offset(230, 70)),
      (const Offset(248, 86), const Offset(259, 82)),
      (const Offset(18, 119), const Offset(26, 127)),
      (const Offset(293, 120), const Offset(302, 114)),
    ]) {
      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(_FriendsPainter oldDelegate) => false;
}
