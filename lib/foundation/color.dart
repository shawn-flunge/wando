


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppColor{

  //theme
  static const MaterialColor cottonCandy = MaterialColor(
    0xFFABDBE3, 
    <int, Color>{
      50: Color(0xFFE6F4F7),
      100: Color(0xFFD5EDF1),
      200: Color(0xFFCDE9EE),
      300: Color(0xFFC4E6EB),
      400: Color(0xFFBCE2E9),
      500: Color(0xFFABDBE3),
      600: Color(0xFF89AFB6),
      700: Color(0xFF78999F),
      800: Color(0xFF44585B),
      900: Color(0xFF222C2D),
    }  
  );

  static const MaterialColor vitaminD = MaterialColor(
    0xFFE28743, 
    <int, Color>{
      50: Color(0xFFF3CFB4),
      100: Color(0xFFF1C3A1),
      200: Color(0xFFEEB78E),
      300: Color(0xFFEBAB7B),
      400: Color(0xFFE89F69),
      500: Color(0xFFE28743),
      600: Color(0xFFB56C36),
      700: Color(0xFF9E5F2F),
      800: Color(0xFF885128),
      900: Color(0xFF5A361B)
    }
  );

  static const MaterialColor chunsik = MaterialColor(
    0xFF0081A7, 
    <int, Color>{
      50: Color(0xFFF7E2C8),
      100: Color(0xFFF5DBBB),
      200: Color(0xFFF2D3AD),
      300: Color(0xFFF0CC9F),
      400: Color(0xFFEEC591),
      500: Color(0xFFEAB676),
      600: Color(0xFFBB925E),
      700: Color(0xFFA47F53),
      800: Color(0xFF8C6D47),
      900: Color(0xFF5E4929)
    }
  );

  static const MaterialColor darkBlue = MaterialColor(
    0xFFEAB676, 
    <int, Color>{
      50: Color(0xFF99CDDC),
      100: Color(0xFF80C0D3),
      200: Color(0xFF66B3CA),
      300: Color(0xFF4DA7C1),
      400: Color(0xFF339AB9),
      500: Color(0xFF0081A7),
      600: Color(0xFF007496),
      700: Color(0xFF006786),
      800: Color(0xFF004D64),
      900: Color(0xFF003443)
    }
  );

  static const Color white = Color(0xFFFAFAFA);

  static const Color black = Color(0xFF242424);

  //status
  static const Color red = Color(0xFFEB4034);
  
  static const Color orange = Color(0xFFF2783A);

  static const Color green = Color(0xFF0CAD3D);

  static const Color blue = Color(0xFF0D49BF);

  static const Color darkGrey = Color(0xFFADAEB6);

  static const Color lightGrey = Color(0xFFD1D1D1);

}
