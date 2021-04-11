import 'dart:math';

import 'package:flutter/material.dart';
class MyBoy extends StatelessWidget {
  int boySpriteCount;
  String boyDirection;
  MyBoy(this.boyDirection,this.boySpriteCount);
  @override
  Widget build(BuildContext context) {
  if(boyDirection=='left'){
    return Container(
      alignment: Alignment.bottomCenter,
      height: 100,width: 100,
      child: Image.asset('lib/images/standboy'+boySpriteCount.toString()+'.png'),
    );
  }else{
    return Transform(
      alignment: Alignment.bottomCenter,transform: Matrix4.rotationY(pi),child: Container(
      alignment: Alignment.bottomCenter,width: 100,height: 100,
      child:Image.asset('lib/images/standboy'+boySpriteCount.toString()+'.png') ,
    ),
    );
  }
  }
}
