import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/FirstScreen.dart';
import 'package:flutter_app/Rebloc/Loading.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3),()=>Navigator.push(context, PageTransition(duration:Duration(seconds: 1),type: PageTransitionType.fade, child: BottomNavigation())));

      return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset("assets/images/Insta_logo.png",height: 250,width: 250,),

          ],
        ),
      ),
    );
  }
}
