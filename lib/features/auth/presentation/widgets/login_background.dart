import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(painter: _LoginBackgroundPainter()),
    );
  }
}

class _LoginBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bounds = Offset.zero & size;
    canvas.drawRect(
      bounds,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF4EDFF), Color(0xFFFCFAFF), Color(0xFFF3EDFC)],
        ).createShader(bounds),
    );
    final paint = Paint()..color = const Color(0xFFECE2FC);
    canvas.drawCircle(Offset(-18, size.height * .14), 64, paint);
    canvas.drawCircle(Offset(size.width + 28, size.height * .3), 82, paint);
    canvas.drawCircle(Offset(-14, size.height * .76), 68, paint);
    paint.color = const Color(0xFFE7DAFA);
    canvas.drawCircle(Offset(size.width * .83, size.height * .12), 12, paint);
    canvas.drawCircle(Offset(size.width * .12, size.height * .46), 10, paint);
    paint
      ..color = const Color(0xFFD7BDF7)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(size.width * .9, size.height * .55),
      Offset(size.width * .9 + 5, size.height * .55 - 6),
      paint,
    );
  }

  @override
  bool shouldRepaint(_LoginBackgroundPainter oldDelegate) => false;
}
