import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maple_story/boy.dart';
import 'package:maple_story/button.dart';
import 'package:maple_story/snail.dart';
import 'package:maple_story/teddy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Blue Snail
  int snailSpriteCount = 1;
  double snailPosX = .5;
  String snailDirection = 'left';


  //teddy bear
  int teddySpriteCount=1;
  double teddyPosX=0;
  String teddyDirection='right';

//Boy Character
  int boySpriteCount=2;
  double boyPosX=-0.5;
  String boyDirection='right';

  //loadingColor
  var loadingScreenColor=Colors.pink[100];
  int loadingTime=3;
  void playNow() {
    startGameTimer();
    moveSnail();
    moveTeddy();
  }

void startGameTimer(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      loadingTime--;
     if(loadingTime==0){

      timer.cancel();

     }

      });
}

  void moveSnail() {
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      setState(() {
        snailSpriteCount++;
        if (snailDirection == 'left') {
          snailPosX -= 0.01;
        } else {
          snailPosX += 0.01;
        }

        if(snailPosX<0.3){
          snailDirection='right';
        }else if(snailPosX>0.6){
          snailDirection='left';
        }
        if(snailSpriteCount==5){
          snailSpriteCount=1;
        }

      });
    });
  }

  void moveTeddy(){
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        teddySpriteCount++;
        if(teddySpriteCount==23){
          teddySpriteCount=1;
        }

        if((teddyPosX-boyPosX).abs()>0.2){
          if(boyDirection=='right'){
            teddyPosX=boyPosX-0.2;
          }else if(boyDirection=='left'){
            teddyPosX=boyPosX+0.2;
          }
        }
        if(teddyPosX - boyPosX>0){
          teddyDirection='left';
        }else{
          teddyDirection='right';
        }
      });
    });
  }

 void moveLeft(){
    setState(() {
      boyPosX -=0.03;
      boySpriteCount++;
      boyDirection='left';
    });
 }
 void moveRight(){
    setState(() {
      boyPosX +=0.03;
      boySpriteCount++;
      boyDirection='right';
    });
 }

 void attack(){
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        attackBoySpriteCount++;
      });
      if(attackBoySpriteCount==5){
        if(boyDirection='right'&&boyPosX+0.2>snailPosX){
          print('hit');
        }else{
          print('missed');
        }
        attackBoySpriteCount=0;
        timer.cancel();
      }
    });
 }
 void jump(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue[300],
                child: Stack(
                  children: [
                    Container(
                      child: BlueSnail(snailDirection, snailSpriteCount),
                      alignment: Alignment(snailPosX, 1),
                    ),
                    Container(
                      child: MyTeddy(teddyDirection, teddySpriteCount),
                      alignment: Alignment(teddyPosX, 1),
                    ),
                    Container(
                      child: MyBoy(boyDirection, boySpriteCount% 2 + 1),
                      alignment: Alignment(boyPosX,1),
                    ),
                    Visibility(visible: loadingTime!=0,child: Container(child: Center(child: Container(child: Text(loadingTime.toString(),style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),),),color:loadingScreenColor,)),
                  ],
                ),
              )),
          Container(
            height: 10,
            color: Colors.green[600],
          ),
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'M A P L E S T O R Y',
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton('Play', () {
                      playNow();
                    }),
                    MyButton('Attack', () {}),
                    MyButton('←'	, () {
                      moveLeft();
                    }),
                    MyButton('↑', () {
                      jump();
                    }),
                    MyButton('→', () {
                      moveRight();
                    }),
                  ],
                ),
              ],
            ),
            color: Colors.grey[500],
          )),
        ],
      ),
    );
  }
}
