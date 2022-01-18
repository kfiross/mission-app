import 'package:flutter/material.dart';
import 'dart:math';

class GradientCircleProgressPainter extends CustomPainter{

  double currentProgress;
  Gradient gradient;

  GradientCircleProgressPainter(this.currentProgress, this.gradient);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(3, size.height/2);
    double radius = min(size.width/2,size.height/2)*1.2;


    double angle = 2 * pi * (currentProgress/100);

    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 1
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    Paint completeArc = Paint()
      ..strokeWidth = 2
      ..shader = gradient.createShader(Rect.fromCircle(center: center,radius: radius),)
      ..style = PaintingStyle.fill
      ..strokeCap  = StrokeCap.round;

    canvas.drawCircle(center, radius, outerCircle); // this draws main outer circle


    canvas.drawArc(Rect.fromCircle(center: center,radius: radius), pi/2, -angle, true, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}