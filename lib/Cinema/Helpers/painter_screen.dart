import 'package:flutter/material.dart';

class PainterScreen extends StatelessWidget {
  const PainterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: CustomPaint(
        painter: _ScreenCinemaPainter(),
      ),
    );
  }
}

class _ScreenCinemaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, size.height);
    canvas.drawPath(path, paint);

    final paint1 = Paint()
      ..color = Colors.white.withOpacity(.05)
      ..style = PaintingStyle.fill;
    final path1 = Path();
    path1.moveTo(0, size.height);
    path1.quadraticBezierTo((size.width) * 0.5, 0, size.width, size.height);
    canvas.drawPath(path1, paint1);

    final paint2 = Paint()
      ..color = Colors.white.withOpacity(.05)
      ..style = PaintingStyle.fill;
    final path2 = Path();
    path2.moveTo(0, size.height);
    path2.lineTo(-30, size.height + 60);
    path2.lineTo(0, size.height + 60);
    path2.lineTo(0, size.height);
    canvas.drawPath(path2, paint2);

    final paint3 = Paint()
      ..color = Colors.white.withOpacity(.05)
      ..style = PaintingStyle.fill;
    final path3 = Path();
    path3.moveTo(0, size.height);
    path3.lineTo(size.width, size.height);
    path3.lineTo(size.width, size.height + 60);
    path3.lineTo(0, size.height + 60);
    path3.lineTo(0, size.height);
    canvas.drawPath(path3, paint3);

    final paint4 = Paint()
      ..color = Colors.white.withOpacity(.05)
      ..style = PaintingStyle.fill;
    final path4 = Path();
    path4.moveTo(size.width, size.height);
    path4.lineTo(size.width, size.height + 60);
    path4.lineTo(size.width + 30, size.height + 60);
    path4.lineTo(size.width, size.height);
    canvas.drawPath(path4, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
