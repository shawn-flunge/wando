import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:watch_is_watch/foundation/color.dart';
import 'package:watch_is_watch/screens/main_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:watch_is_watch/controllers/notification_controller.dart';
import 'package:watch_is_watch/screens/mission_screen.dart';
import 'package:watch_is_watch/utilities/app_utility.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(onBackgroundHandler);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true
  );
  
  NotificationController().init();


  runApp(MyApp());
}


Future<void> onBackgroundHandler(RemoteMessage message) async {
  const MethodChannel methodChannel = MethodChannel('plugins.flutter.io/firebase_messaging');
  methodChannel.invokeMethod('Messaging#setIsSelectedFalse');

  bool isSelected = false;
  
  methodChannel.setMethodCallHandler((call){
    
    switch (call.method){
      case 'Messaging#answerIsSelected':
        // if(Platform.isIOS){
        //   if(call.arguments == 'NO') {
        //     isSelected = false;
        //   } else {
        //     isSelected = true;
        //   }
        // } else{
        //   isSelected = call.arguments as bool;
        // }
        isSelected = AppUtil.returnBoolValueAccordingToPlatform(call.arguments);
        break;
      default:
        print('default : ${call.method} // ${call.arguments}');
        break;
    }

    return Future.value();
  });

  
  Timer.periodic(const Duration(seconds: 2), (timer) {
    methodChannel.invokeMethod('Messaging#askIsSelected');

    if(isSelected) timer.cancel();
    NotificationController().showNotification();
  });

  return Future.value();
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'A watch is a watch',
      theme: ThemeData(
        primarySwatch: AppColor.cottonCandy,
        backgroundColor: AppColor.white,
        
      ),
      initialRoute: '/',
      // routes: {
      //   '/' : (context) => MainScreen(),
      //   '/mission' : (context) => MissionScreen()
      //   // '/mission' : (context) => MaterialPageRoute(builder: (context)=>MissionScreen())
      // },
      onGenerateRoute: (settings){
        print('onGenerateRoute : ${settings}');
        if(settings.name =='/'){
          return MaterialPageRoute(builder: (context) => MainScreen());
        }
        if(settings.name =='/mission'){
          return MaterialPageRoute(builder: (context) => MissionScreen());
        }
      },

      home: MainScreen(),
    );
  }
}