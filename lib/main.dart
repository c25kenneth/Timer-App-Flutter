import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_app/settime.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.purple[300],
      ),
      home: const MyHomePage(title: 'Timer app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const maxTime = 60; 
  int currentTime = maxTime; 
  Timer? timer; 
  Color timerColor = Colors.green; 

  void startTimer () {
    timer = Timer.periodic(Duration(seconds:1), (timer) {
      if (currentTime > 0) {
        if (currentTime > 40) {
          setState(() {
            currentTime--; 
            timerColor = Colors.green; 
          });
        } else if (currentTime <= 40 && currentTime >= 15) {
          setState(() {
            currentTime--; 
            timerColor = Colors.yellow; 
          });
        } else if (currentTime < 15) {
          setState(() {
            currentTime--; 
            timerColor = Colors.red; 
          });
        }
      } else {
        timer.cancel();
        showDialog(context: context, builder: (context) {
          return Popup(); 
        });
      }
     
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 25.0,),
            Container(child: CircularProgressIndicator(value: currentTime / maxTime, strokeWidth: 25, color: timerColor,), width: 245.0, height: 245.0, ),
            SizedBox(height: 35.0,),
            Text("You have " + currentTime.toString() + " seconds left!"),
            SizedBox(height: 35.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(onPressed: (){startTimer();}, child: Text("Start timer!"), color: Colors.green,),
                SizedBox(width: 15.0,), 
                MaterialButton(onPressed: (){
                  timer?.cancel(); 
                }, child: Text("Pause Timer!"), color: Colors.yellow,),
                SizedBox(width: 15.0,), 
                MaterialButton(onPressed: (){
                  setState(() {
                    currentTime = maxTime; 
                    timerColor = Colors.green; 
                    timer?.cancel();
                  });
                }, child: Text("Reset!"), color: Colors.red,), 
              ],
            ),
          ],
        ),
      ),
    );
  }
}
