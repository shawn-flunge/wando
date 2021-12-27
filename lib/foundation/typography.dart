
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watch_is_watch/foundation/color.dart';

abstract class AppTypography {

  ///H1 heading
  ///
  ///font size : 40, font weight : normal(regular), line height : 1
  static getFontH1({Color fontColor = AppColor.black}){
    return GoogleFonts.gothicA1(
      height: 1,
      fontSize: 40,
      fontWeight: FontWeight.normal,
      color: fontColor
    );
  }
  
  ///H2 heading
  ///
  ///font size : 30, font weight : medium, line height : 1
  static getFontH2({Color fontColor = AppColor.black}){
    return GoogleFonts.gothicA1(
      height: 1,
      fontWeight: FontWeight.w500, //Medium
      fontSize: 30,
      color: fontColor
    );
  }

  ///H3 heading
  ///
  ///font size : 24, font weight : normal(regular), line height : 1
  static getFontH3({Color fontColor = AppColor.black}){
    return GoogleFonts.gothicA1(
      height: 1,
      fontWeight: FontWeight.normal,
      fontSize: 24,
      color: fontColor
    );
  }

  ///H4 heading
  ///
  ///font size : 20, font weight : medium, line height : 1
  static getFontH4({Color fontColor = AppColor.black}){
    return GoogleFonts.gothicA1(
      height: 1,
      fontWeight: FontWeight.w500, //Medium
      fontSize: 20,
      color: fontColor
    );
  }

  ///H5 heading
  ///
  ///font size : 18, font weight : normal(regular), line height : 1
  static getFontH5({Color fontColor = AppColor.black}){
    return GoogleFonts.gothicA1(
      height: 1,
      fontWeight: FontWeight.normal,
      fontSize: 18,
      color: fontColor
    );
  }

  ///Body 1
  ///
  ///font size : 14, font weight : normal(regular), line height : 1.43
  static getFontB1({Color fontColor = AppColor.black}){
    return GoogleFonts.gothicA1(
      height: 1.43,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: fontColor
    );
  }

  ///Body 2
  ///
  ///font size : 10, font weight : normal(regular), line height : 1.43
  static getFontB2({Color fontColor = AppColor.black}){
    return GoogleFonts.gothicA1(
      height: 1.43,
      fontWeight: FontWeight.normal,
      fontSize: 10,
      color: fontColor
    );
  }

}