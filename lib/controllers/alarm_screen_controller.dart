

import 'package:flutter/cupertino.dart';

class AlarmScreenController extends ChangeNotifier{

  static final AlarmScreenController _instance = AlarmScreenController._internal();

  AlarmScreenController._internal(){
    // print('AlarmScreenController init');
  }

  factory AlarmScreenController(){
    return _instance;
  }

  bool isSideMenuOpened = false;
  

  void sideMenuClose(){
    isSideMenuOpened = false;
    notifyListeners();
  }

  void sideMenuOpen(){
    isSideMenuOpened = true;
    notifyListeners();
  }
  // Stream<bool> isis;
  



}