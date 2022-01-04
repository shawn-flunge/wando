

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:watch_is_watch/controllers/alarm_screen_controller.dart';
import 'package:watch_is_watch/main.dart';
import 'package:watch_is_watch/utilities/app_utility.dart';

import 'package:watch_is_watch/controllers/fcm_controller.dart';
import 'package:watch_is_watch/foundation/color.dart';
import 'package:watch_is_watch/foundation/typography.dart';
import 'package:watch_is_watch/controllers/notification_controller.dart';
import 'package:watch_is_watch/widets/alarm_card.dart';
import 'package:watch_is_watch/widets/floating_flow_button.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FcmController fcmController = FcmController();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
  NotificationController nc = NotificationController();

  AlarmScreenController alarmScreenController = AlarmScreenController();
  bool isSideMenuOpened = false;

  @override
  void initState() {
    super.initState();
    hihi();
  }

  Future<void> hihi() async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    
    print('User granted permission: ${settings.authorizationStatus}');
  }

  @override
  Widget build(BuildContext context) {    

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceOut,
              top: 0,
              left: alarmScreenController.isSideMenuOpened ? size.width*0.7 : 0,
              child: Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: <Color>[
                      Color(0xFFABDBE3),
                      Color(0xFFFAFAFA)
                    ],
                    stops: <double>[
                      0,
                      1
                    ]
                  )
                ),
                child: Column(
                  children: <Widget>[

                    const SizedBox(height: 100,),
                    // Container(
                    //   width: size.width-50,
                    //   height: 50,
                    //   color: Colors.brown,
                    //   child: InkWell(
                    //     onTap: () async{

                    //       // print(await fcmController.getFcmToken());

                    //       // setState(() {
                    //       //   alarmScreenController.isSideMenuOpened = !alarmScreenController.isSideMenuOpened;
                    //       // });
                    //       // sideMenuAnimation.forward();
                    //       // print('fsd ${sideMenuAnimation.status}');
                    //       // (sideMenuAnimation.status == AnimationStatus.dismissed)
                    //       //   ? sideMenuAnimation.forward()
                    //       //   : sideMenuAnimation.reverse();
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(height: 100,),
                    Container(
                      width: size.width-50,
                      height: 50,
                      color: Colors.red,
                      child: InkWell(
                        onTap: () async{
                          Navigator.pushNamed(context, '/mission');
                          // NotificationController().showNotification();
                        },
                      ),
                    )
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,            
                    //   children: <Widget>[
                    //     Expanded(

                    //       child: Text(
                    //         '알람이 없습니다.',
                    //         style: AppFonts.getFontH1(),
                    //       )
                    //     ),
                    //     SvgPicture.asset('assets/svgs/hamburger_menu.svg')
                    //   ],
                    // ),
                    // const SizedBox(height: 75,),
                    // AlarmCard(height: height*0.08),
                    // const SizedBox(height: 75,),
                    // AlarmCard(height: height*0.08),
                    // const SizedBox(height: 75,),
                    // AlarmCard(height: height*0.08),
                    // const SizedBox(height: 75,),
                    // Transform.rotate(
                    //   angle: AppUtil.degToRad(4),
                    //   child: TempWidget(),
                    // )
                    
                  ],
                ),
              ),
            ),

            AnimatedPositioned(
              top: 0,
              left: alarmScreenController.isSideMenuOpened ? 0 : -size.width*0.7,
              curve: Curves.bounceOut,
              duration: const Duration(milliseconds: 500),
              child: GestureDetector(
                
                onHorizontalDragUpdate: (dragDetails){
                  setState(() {
                    alarmScreenController.isSideMenuOpened = false;
                  });
                },
                child: Container(width: size.width*0.7, height: size.height, color: Colors.pink,)
              ),
            ),
            FloatingFlowButton()
          ],
        ),
      ),
      
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
