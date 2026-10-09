


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/ui/homeScreen.dart';
import 'package:note_app/uiHelper/customText.dart';

class splashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash_screen(),
    );
  }
}
class splash_screen extends StatefulWidget{
  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:3 ), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homeScreen()));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        children: [
          Expanded(
            flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icon/note.png",width: 80,color: Colors.white,),
                  SizedBox(height: 20,),
                  customText(mText: "LAO NOTE",fontWeight: FontWeight.w700,size: 23,latterSpacing: 1.5,),
                  SizedBox(height: 20,),
                  customText(mText: "Easily Manage Your Notes On Your Phone\n&you Can Have infinite Notes",fontWeight: FontWeight.normal,size: 16,color: Color(0xff98999c),latterSpacing: 1, textAlign: TextAlign.center,)
                ],
              ),
          ),
          Expanded(
            flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(child: Image.asset("assets/icon/loading.png",width: 25,color: Colors.white,)),
                  customText(mText: "Loading...",color: Color(0xff98999c),),
                ],
              ))
        ],
      ),
    );
  }
}