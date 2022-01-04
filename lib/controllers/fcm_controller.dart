

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:watch_is_watch/controllers/notification_controller.dart';

class FcmController {

  static final FcmController _instance = FcmController._internal();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationController nc = NotificationController();


  FcmController._internal(){
    
    getFcmToken().then((value) => print(value));

    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //   print('onMessageOpenedApp');
    // });
    FirebaseMessaging.onMessage.listen((event) {
      print('onMessage receive :${event.data}');
      print('onMessage receive :${event.contentAvailable}');
      nc.showNotification();
    });
  }
  
  factory FcmController(){
    return _instance;
  }

  

  Future<String?> getFcmToken() async{
    final token =await messaging.getToken();
    return token;
  }

  

  
}
