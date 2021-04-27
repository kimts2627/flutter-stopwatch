import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaesuWatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> lapTimes = [];  // 랩타임 기록 변수
  Stopwatch watch = Stopwatch(); // 지속적으로 시간이 지나가는 변수
  String elapsedTime = '00:00:00:000';  // 경과 시간을 기록하는 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('TaesuWatch'),
      ),
      body: Center(
        child: Column(
          children: [
            //################ Timer section ##############
            Container(
              margin: EdgeInsets.all(50),
              child: Text(elapsedTime, style: TextStyle(
                  fontSize: 35
                ),
              ),
              padding: EdgeInsets.all(20),
            ),
            //################ Log section ###############
            Container(
              width: 100,
              height: 200,
              child: ListView(
                children: lapTimes.map((time) => Text(time)).toList(),
              ),
            ),
            //################ Controll section ###############
            Container(
              margin: EdgeInsets.all(50),
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    child: !watch.isRunning ? Icon(CupertinoIcons.play_arrow) : Icon(CupertinoIcons.stop),
                    onPressed: () {
                      if(!watch.isRunning) {
                        startWatch();
                      } else {
                        stopWatch();
                      }
                    },
                  ),
                  FloatingActionButton(
                    child: !watch.isRunning ? Text('RESET') : Text('Lab'),
                    onPressed: () {
                      if(!watch.isRunning) {
                        resetWatch();
                      } else {
                        recordLapTime(elapsedTime);
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  transTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String secondStr = (seconds % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String hoursStr = (hours % 24).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondStr:$milliseconds";
  }

  updateTime(Timer timer){
    if(watch.isRunning) {
      setState(() {
        elapsedTime = transTime(watch.elapsedMilliseconds);
      });
    }
  }

  startWatch() {
    watch.start();
    Timer.periodic(Duration(microseconds: 100), updateTime);
  }

  stopWatch() {
    setState(() {
      watch.stop();
    });
  }

  resetWatch() {
    watch.reset();
    setTime();
    lapTimes.clear();
  }

  setTime() {
    var timeFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transTime(timeFar);
    });
  }

  recordLapTime(String time) {
    lapTimes.insert(0, 'Lab ${lapTimes.length + 1} $time');
  }

}




