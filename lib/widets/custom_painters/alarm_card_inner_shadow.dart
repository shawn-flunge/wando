
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_is_watch/utilities/app_utility.dart';

class AlarmCardInnerShadow extends CustomPainter{
  double height;

  AlarmCardInnerShadow({required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, AppUtil.convertRadiusToSigma(0.5))
      ..style = ui.PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, height*0.25)
      ..addArc(
        Rect.fromCircle(center: Offset(height*0.25, height*0.25), radius: height*0.25), 
        AppUtil.degToRad(180), 
        AppUtil.degToRad(90)
      )
      ..lineTo(size.width-height*0.5, 0)
      ..addArc(
        Rect.fromCircle(center: Offset(size.width-height/2, height/2), radius: height/2), 
        AppUtil.degToRad(270), 
        AppUtil.degToRad(120)
      )
      ..cubicTo(size.width+4, height*0.5, size.width-height*0.25/2+3, 6, size.width-height/2, 6)
      // ..quadraticBezierTo(size.width-7, 6, size.width-height/2, 6)
      ..lineTo(height*0.25, 6)
      ..quadraticBezierTo(5, 6, 2, height*0.3)
      ..lineTo(2, height*0.9)
      
      ..lineTo(0, height*0.25);

    canvas.drawPath(path, paint);  


    // var paint = Paint()
    //   ..color = Colors.black.withOpacity(0.25)
    //   ..maskFilter = MaskFilter.blur(BlurStyle.normal, AppUtil.convertRadiusToSigma(1.8))
    //   ..style = ui.PaintingStyle.fill;

    // var path = Path()
    //   ..moveTo(0, height*0.25)
    //   ..addArc(
    //     Rect.fromCircle(center: Offset(height*0.25, height*0.25), radius: height*0.25), 
    //     AppUtil.degToRad(180), 
    //     AppUtil.degToRad(90)
    //   )
    //   ..lineTo(size.width-height*0.5, 0)
    //   ..addArc(
    //     Rect.fromCircle(center: Offset(size.width-height/2, height/2), radius: height/2), 
    //     AppUtil.degToRad(270), 
    //     AppUtil.degToRad(90)
    //   )
    //   ..quadraticBezierTo(size.width-7, 7, size.width-height/2, 7)
    //   ..lineTo(height*0.25, 7)
    //   ..quadraticBezierTo(5, 7, 4, height*0.3)
    //   ..lineTo(0, height*0.75)
    //   ..lineTo(0, height*0.25);

    // canvas.drawPath(path, paint);  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

