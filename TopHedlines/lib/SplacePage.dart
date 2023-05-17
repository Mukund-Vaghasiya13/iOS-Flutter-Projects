import 'dart:async';
//
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'HomePage.dart';

class Splacescreen extends StatefulWidget {
  const Splacescreen({super.key});

  @override
  State<Splacescreen> createState() => _SplacescreenState();
}

class _SplacescreenState extends State<Splacescreen> {
  @override

  // 4s
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: LottieBuilder.network(
            "https://assets3.lottiefiles.com/packages/lf20_KLaN10ftkY.json",
            height: 300,
          ) ,
        )
    );
  }
}
