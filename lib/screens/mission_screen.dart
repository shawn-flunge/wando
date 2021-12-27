
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoenix_native/phoenix_native.dart';

import 'package:watch_is_watch/controllers/notification_controller.dart';
import 'package:watch_is_watch/foundation/color.dart';
import 'package:watch_is_watch/foundation/typography.dart';
import 'package:watch_is_watch/main.dart';


class MissionScreen extends StatefulWidget {
  const MissionScreen({ Key? key }) : super(key: key);

  @override
  _MissionScreenState createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {

  NotificationController nc = NotificationController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: <Color>[
              AppColor.cottonCandy,
              AppColor.white
            ],
            stops: <double>[
              0,
              1
            ]
          )
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text('mission page', style: AppTypography.getFontH1(),),
              MaterialButton(
                color: Colors.red,
                onPressed: (){
                  Navigator.pop(context);
                }
              ),
              SizedBox(height: 50,),
              MaterialButton(
                color: Colors.blue,
                onPressed: (){
                  
                  print('onPress');
                  // PhoenixNative.restartApp();
                  SystemNavigator.pop();
                }
              )
            ],
          ),
          
        ),
      ),
    );
  }
}