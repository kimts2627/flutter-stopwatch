import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

  List<String> lapTimes = [];
  Stopwatch watch = Stopwatch();
  String elapsedTime = '00:00:00:000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('TaesuWatch'),
        // centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            //################ Timer section ##############
            Container(
              child: Text('00:00:00:000', style: TextStyle(
                fontSize: 35
              ),),
              padding: EdgeInsets.all(20),
            ),
            //################ Log section ###############
            Container(
              width: 100,
              height: 200,
              child: ListView(
                children: [
                  Text('Lab3'),
                  Text('01:00:00:000'),
                  Text('Lab2'),
                  Text('01:00:00:000'),
                  Text('Lab1'),
                  Text('01:00:00:000')
                ],
              ),
            ),
            //################ Controll section ###############
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    child: Icon(CupertinoIcons.play_arrow),
                  ),
                  FloatingActionButton(
                    child: Text('RESET')
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




