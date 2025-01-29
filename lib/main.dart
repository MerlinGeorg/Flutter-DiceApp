import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DieRollApp()); //creating object of DieRollApp class - creating a constructor
}

class DieRollApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _DieRollState();
  }
}

class _DieRollState extends State{
 
 //var currentImg = 'assets/dice-2.png';
 var randomInt1 = Random().nextInt(6) + 1;
 var randomInt2 = Random().nextInt(6)+1;
 String resultMessage = '';

 void rollDie(){
  setState(() {
    randomInt1 = Random().nextInt(6)+1;
    randomInt2= Random().nextInt(6) +1;

    //check for tie
    if(randomInt1 == randomInt2){
      resultMessage = 'It\'s a tie';
    } else {
      resultMessage = '';
    }
  });
  
 }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Roll a Die App'),
        ),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text(
            'Roll a Die', 
            style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 26, 0, 86),),
            ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/dice-$randomInt1.png', width: 150, height: 150,),
              const SizedBox(width: 20,),
              Image.asset('assets/dice-$randomInt2.png', width: 150, height: 150,),
            ],
          ),
          
          const SizedBox(
            height: 20,
          ),
          Text(resultMessage,
          style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),),
          ElevatedButton(onPressed: rollDie, child: const Text('Roll'))
        ],),),
      )
    );
  }

}