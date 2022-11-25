import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int index1=0, index2=0;
  Random random=Random.secure();
   int sum=0;
   bool hasGameStarted = false;
   bool isGameRunning =  false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dice Game'),),
      body: Center(
        child: hasGameStarted? gameBody():startBody(),

        )
      );

  }

  Column startBody() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FlutterLogo(size: 100,),
          const Text('Welcome to Dice Game',style: TextStyle(fontSize: 25),),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  hasGameStarted=true;
                });
              },
              child: const Text('START'),
          )
        ],
      );
  }

  Column gameBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if(isGameRunning)Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset(diceList[index1],height: 100,width: 100,),
            SizedBox(width: 10,),
            Image.asset(diceList[index2],height: 100,width: 100,),
          ],
        ),
        Text('Dice Sum: $sum',style: const TextStyle(fontSize: 20),),
        ElevatedButton(onPressed: rollTheDice, child: Text('Roll')),

      ],
    );
  }

  void rollTheDice() {

   setState(() {
     if(!isGameRunning){
       isGameRunning = true;
     }
     index1=random.nextInt(6);
     index2=random.nextInt(6);
     sum=index1+index2+2;
   });
  }
}
final diceList=[
  'images/d1.png',
  'images/d2.png',
  'images/d3.png',
  'images/d4.png',
  'images/d5.png',
  'images/d6.png',
];
