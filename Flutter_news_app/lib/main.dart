import 'package:flutter/material.dart';
import 'package:newws_apps/SplaceScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplaceScreen() ,
      debugShowCheckedModeBanner: false,
    );
  }
}
