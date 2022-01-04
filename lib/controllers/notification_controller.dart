

import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:watch_is_watch/main.dart';


class NotificationController extends ChangeNotifier{

  static final NotificationController _instance = NotificationController._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    
  int notificationId = 0;
  

  NotificationController._internal(){
    //
    print('NotificationController._internal');
  }

  factory NotificationController(){

    return _instance;
  }

  Future<void> init() async{
    print('NotificationController.init');
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

    
    _instance.addListener(() {
      print('hihihihihi');
      
    });
  }

  void onDidReceiveLocalNotification(int id, String? title, String? body, String? payload){

  }

  void selectNotification(String? payload) async{

    // if(Platform.isAndroid) FirebaseMessaging.instance.setIsSelectedTrue();
    // FirebaseMessaging.instance.setIsSelectedTrue();
    const MethodChannel methodChannel = MethodChannel('plugins.flutter.io/firebase_messaging');
    methodChannel.invokeMethod('Messaging#setIsSelectedFalse');
    
    print('select notification');
    if(payload != null){
      debugPrint('notificaition payload : $payload');
    }

    // MyApp.navigatorKey.currentState!.pushNamed('/mission', arguments:'temp');
    
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
        
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');

    // flutterLocalNotificationsPlugin.periodicallyShow(0, 'title', 'body', RepeatInterval.everyMinute, platformChannelSpecifics);

    //반복, 분, 일, 주 등등
    // const AndroidNotificationDetails androidPlatformChannelSpecifics =
    //     AndroidNotificationDetails(
    //         'repeating channel id', 'repeating channel name',
    //         channelDescription: 'repeating description');
    // const NotificationDetails platformChannelSpecifics =
    //     NotificationDetails(android: androidPlatformChannelSpecifics);
    // await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
    //     'repeating body', RepeatInterval.everyMinute, platformChannelSpecifics,
    //     androidAllowWhileIdle: true);
    
    
    //특정 시간 알림
    // tz.initializeTimeZones();
    // tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //   0,
    //   'scheduled title',
    //   'scheduled body',
    //   tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
    //   // tz.TZDateTime.now(tz.local).add(const Duration(minutes: 5)),
    //   const NotificationDetails(
    //       android: AndroidNotificationDetails(
    //           'your channel id', 'your channel name',
    //           channelDescription: 'your channel description')),
    //   androidAllowWhileIdle: true,
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime);

  }

  static Future onBackgroundHandler(RemoteMessage message) async {
    
    // init();
    
    

    Timer.periodic(const Duration(seconds: 3), (timer) async{
      
    
      
      
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('your channel id', 'your channel name',
              channelDescription: 'your channel description',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker');
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
          
      await FlutterLocalNotificationsPlugin().show(
          0, 'plain title', 'plain body', platformChannelSpecifics,
          payload: 'item x');
      // print('isSelected : $isSelected');

    });

    return Future.value();
  }


  void increaseId(){
    notificationId ++;
    notifyListeners();
  }

  void resetID(){
    notificationId = 0;
    notifyListeners();
  }

}