import 'dart:math';

import 'package:flutter/material.dart';

class MyTeddy extends StatelessWidget {
  final int teddySpriteCount;
  final String teddyDirection;

  MyTeddy(this.teddyDirection, this.teddySpriteCount);

  @override
  Widget build(BuildContext context) {
    if (teddyDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        width: 50,
        height: 50,
        child: Image.asset('lib/images/teddysprite/teddy' +
            teddySpriteCount.toString() +
            '.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.bottomCenter,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,width: 50,height: 50,
          child: Image.asset('lib/images/teddysprite/teddy'+teddySpriteCount.toString()+'.png'),
        ),
      );
    }
  }
}
