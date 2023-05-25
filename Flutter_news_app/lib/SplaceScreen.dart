import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'HomeScreen.dart';

class SplaceScreen extends StatefulWidget {
 

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyWidget()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.network("https://assets9.lottiefiles.com/packages/lf20_dpqnwftv.json"),
      ),
    );
  }
}