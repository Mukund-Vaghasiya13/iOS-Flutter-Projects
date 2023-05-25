import 'package:flutter/material.dart';
import 'package:newws_apps/NewwsComponent/Search.dart';
import '../NewwsComponent/TopHeadlines.dart';

//GET
class NesScreen extends StatefulWidget {
  @override
  State<NesScreen> createState() => _NesScreenState();
}

class _NesScreenState extends State<NesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOfFirstSubScreen(),
            TabBar(
                isScrollable: true,
                indicatorColor: Colors.black,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  TabItem("Top Headlines",),
                  TabItem("Business",),
                  TabItem("Entertainment",),
                  TabItem("Science"),
                  TabItem("Sport"),
                ]),
            Expanded(
              child: TabBarView(children: [
                TopHeadlinesNewws(
                    "https://newsapi.org/v2/top-headlines?country=in&apiKey=750a1ffc45194fe0922a46ad88c2be79"),
                TopHeadlinesNewws(
                    "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=750a1ffc45194fe0922a46ad88c2be79"),
                TopHeadlinesNewws(
                    "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=750a1ffc45194fe0922a46ad88c2be79"),
                TopHeadlinesNewws(
                    "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=750a1ffc45194fe0922a46ad88c2be79"),
                TopHeadlinesNewws(
                    "https://newsapi.org/v2/top-headlines?country=in&category=sport&apiKey=750a1ffc45194fe0922a46ad88c2be79")
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget TabItem(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(3.5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                text,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// header
class HeaderOfFirstSubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const CircleAvatar(
            foregroundImage: NetworkImage(
                "https://img.freepik.com/free-psd/3d-rendering-ui-icon_23-2149182295.jpg"),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Newws",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                  "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}")
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBarScreen()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
