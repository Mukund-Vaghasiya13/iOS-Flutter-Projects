import 'package:flutter/material.dart';
import 'package:productsapps/ThemeFile.dart';
import 'package:productsapps/splaceScreen.dart';
import 'package:provider/provider.dart';

import 'CartModle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModleCart>(create: (context)=>ModleCart())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplacePage(),
        themeMode: ThemeMode.system,
        theme: MyThems.lightThemData(),
        darkTheme: MyThems.darkThemData(),
      ),
    );
  }
}

