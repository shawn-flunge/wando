import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_is_watch/foundation/color.dart';
import 'package:watch_is_watch/widets/custom_painters/alarm_card_inner_shadow.dart';


class AlarmCard extends StatelessWidget {
  const AlarmCard({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: size.width,
      height: height,
      // margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      // padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(height*0.25),
          bottomLeft: Radius.circular(height*0.25),
          topRight: Radius.circular(height*0.5),
          bottomRight: Radius.circular(height*0.5)
        ),
        color: AppColor.cottonCandy[100], 
        // color: Theme.of(context).primaryColor.
      ),
      child: CustomPaint(
        painter: AlarmCardInnerShadow(height: height),
        child: Container(
          margin: const EdgeInsets.all(8),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: <Widget>[
          //   ],
          // ),
        ),
      ),
    );
  }
}