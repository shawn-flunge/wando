

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_is_watch/foundation/color.dart';
import 'package:watch_is_watch/utilities/app_utility.dart';

class FloatingFlowButton extends StatefulWidget{

  const FloatingFlowButton({
    Key? key
  }) : 
    super(key: key);

  @override
  _FloatingFlowButtonState createState() => _FloatingFlowButtonState();
}

class _FloatingFlowButtonState extends State<FloatingFlowButton> with TickerProviderStateMixin{

  late AnimationController menuAnimation;
  late AnimationController buttonAnimation;

  final menuItems = <IconData>[
    Icons.home,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  @override
  void initState() {
    super.initState();

    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this
    );

    buttonAnimation = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this
    );
  }

  Widget buildMainButton(Widget child){
    return Container();
  }

  void pressParentButton(){
    print('pressMainButton');
    buttonAnimation.status == AnimationStatus.dismissed 
      ? buttonAnimation.forward()
      : buttonAnimation.reverse();
    menuAnimation.status == AnimationStatus.dismissed 
      ? menuAnimation.forward()
      : menuAnimation.reverse();
  }

  void pressChildButton(int index){
    print('index : $index');

  }

  Widget buildChild(IconData icon, int index){
    
    return RawMaterialButton(
      fillColor: index == 0 ? AppColor.darkBlue[500] : AppColor.darkBlue[400],
      shape: const CircleBorder(),
      constraints: BoxConstraints.tight(const Size(50, 50)),
      
      onPressed: () {
        index == 0
        ? pressParentButton()
        : pressChildButton(index);
      },
      child: index == 0 
      ? AnimatedBuilder(
          animation: buttonAnimation,
          child: Icon(
            icon,
            size: 20,
          ), 
          builder: (context, child){
            return Transform.rotate(
              angle: AppUtil.degToRad(45)*buttonAnimation.value,
              child: child,
            );
          }
        )
      : Icon(
          icon,
          size: 20,
        ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Flow(
      delegate: FloatingFlowButtonDelegate(menuAnimation: menuAnimation),
      children: List.generate(menuItems.length, (index) => buildChild(menuItems[index], index)),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    menuAnimation.dispose();
    buttonAnimation.dispose();
  }
}


class FloatingFlowButtonDelegate extends FlowDelegate{

  final Animation<double> menuAnimation;
  FloatingFlowButtonDelegate({required this.menuAnimation}):super(repaint: menuAnimation);

  @override
  void paintChildren(FlowPaintingContext context) {

    double x = context.size.width - context.getChildSize(0)!.width-20;
    double y = context.size.height - context.getChildSize(0)!.height-70;

    for(int i = context.childCount-1 ; i>=0; i--){
      Size? buttonSize = context.getChildSize(i);  
      double dx = x;
      double dy = buttonSize!.height * i;
      
      i == 0
      ? context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx,
          y,
          0
        )
      ) 
      :context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx +10, 
          y - dy*menuAnimation.value,
          0
        ),
      );
    }
  }

  @override
  bool shouldRepaint(FloatingFlowButtonDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return i == 0 ? BoxConstraints.tight(const Size(70,70)) : constraints;
  }
}