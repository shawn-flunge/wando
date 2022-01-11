
import 'dart:core';
import 'dart:io';
import 'dart:math' as math;

abstract class AppUtil{

  //가우시안 필터, 가우시안 커널의 표준편차(sigma)를 취하는 필터
  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  static double degToRad(double degree){
    return degree * (math.pi / 180);
  }

  static bool asff(dynamic argument){
    
    if(Platform.isIOS){
      if(argument == 'NO'){
        return false;
      } else{
        return true;
      }
    } else{
      // return argument as bool;
      return bool.fromEnvironment(argument);
    }
  }

}

