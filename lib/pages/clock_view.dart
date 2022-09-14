import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width/2;
    var centerY = size.height/2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var fillBrush = Paint()..color = const Color(0xFF444974);
    var outlineBrush = Paint()..color = const Color(0xFFEAECFF) ..style = PaintingStyle.stroke .. strokeWidth = 16;
    var centerFillBrush = Paint()..color = const Color(0xFFEAECFF);
    var secondHandBrush = Paint()
      ..color = Color(Colors.orange[300].hashCode)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      .. strokeWidth = 8;
    var minHandBrush = Paint()
      ..shader=const RadialGradient(colors: [Color(0xFF748EF6),Color(0xFF77DDFF)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;
    var hourHandBrush = Paint()
      ..shader=const RadialGradient(colors: [Color(0xFFEA74AB),Color(0xFFC279FB)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawCircle(center, radius-40, fillBrush);
    canvas.drawCircle(center, radius-40, outlineBrush);
    canvas.drawLine(center, const Offset(100,100), secondHandBrush);
    canvas.drawLine(center, const Offset(150,100), minHandBrush);
    canvas.drawLine(center, const Offset(200,150), hourHandBrush);
    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}