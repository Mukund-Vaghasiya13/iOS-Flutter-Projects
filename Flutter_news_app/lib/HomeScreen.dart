import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newws_apps/TwoSubScreen.dart/FirstSubScreen.dart';
import 'package:newws_apps/TwoSubScreen.dart/SecondScreen.dart';


class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<StatefulWidget> screens = [
    NesScreen(),
    WeatherData(),
  ];
  var index = 0;
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) {
            setState(() {
              index = value;
            });
          },
          destinations: const[
          NavigationDestination(icon: Icon(CupertinoIcons.news), label: "news",selectedIcon: Icon(CupertinoIcons.news_solid),),
          NavigationDestination(icon: Icon(CupertinoIcons.cloud), label: "Weather",selectedIcon: Icon(CupertinoIcons.cloud_fill)),
        ],),
      )
    );
  }
}

