import 'dart:math';

import 'package:flutter/material.dart';

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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late AnimationController animasyonKontrol;

  late Animation<double> scaleAnimasyonDegerleri;
  late Animation<double> rotateAnimasyonDegerleri;

  bool fabDurum = false;

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 200),vsync: this );

    scaleAnimasyonDegerleri = Tween(begin: 0.0,end: 1.0).animate(animasyonKontrol)
      ..addListener(() {
        setState(() {

        });
      });

    rotateAnimasyonDegerleri = Tween(begin: 0.0,end: pi/4).animate(animasyonKontrol)
      ..addListener(() {
        setState(() {

        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    animasyonKontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
      floatingActionButton:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.scale(
              scale: scaleAnimasyonDegerleri.value,
              child: FloatingActionButton(
                onPressed: (){
                print("Fab 2 tıklandı");
                },
                tooltip: 'Fab 2',
                backgroundColor: Colors.yellow,
                child: const Icon(Icons.photo_camera),
              ),
            ),
            Transform.scale(
              scale: scaleAnimasyonDegerleri.value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: (){
                    print("Fab 1 tıklandı");
                  },
                  tooltip: 'Fab 1',
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.alarm),
                ),
              ),
            ),
            Transform.rotate(angle: rotateAnimasyonDegerleri.value,
              child: FloatingActionButton(
                onPressed: (){
                  print("Fab main tıklandı");
                  if(fabDurum){
                    animasyonKontrol.reverse();
                    fabDurum = false;

                  }else{
                    animasyonKontrol.forward();
                    fabDurum = true;
                  }
                },
                tooltip: 'Fab main',
                backgroundColor: Colors.red,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
    );
  }
}
