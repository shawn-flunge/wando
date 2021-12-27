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



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(onBackgroundHandler);
  // FirebaseMessaging.onBackgroundMessage(NotificationController.onBackgroundHandler);
  
  NotificationController().init();
  // init();

  // SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.setBool('isSelect', false);
  // bool isSelect = pref.getBool('isSelect')??false;
  // print('main.isSelect : $isSelect');


  

  runApp(MyApp());
}

NotificationController nc2 = NotificationController();


Future<void> onBackgroundHandler(RemoteMessage message) async {
  print('onBackgroundMessage: ${message.data}');

  // print('obg.isSelect : ${pref.getBool('isSelect')}');

  

  
  Timer.periodic(const Duration(seconds: 10), (timer) async{

    NotificationController().showNotification();

  });

  return Future.value();
}

bool isSelectedd = false;
Timer? timer;

Future<void> init() async{
  print('main.init');
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  final IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings(
    onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosInitializationSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: selectNotification
  );

}

void onDidReceiveLocalNotification(int id, String? title, String? body, String? payload){

}

void selectNotification(String? payload) async{

  print('main. select notification');
  if(payload != null){
    debugPrint('notificaition payload : $payload');
  }

  // MyApp.navigatorKey.currentState!.pushNamed('/mission', arguments:'temp');
  
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
        print('❤ onGenerateRoute : ${settings}');
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


class NCBascket{

  static NotificationController nc = NotificationController();
}