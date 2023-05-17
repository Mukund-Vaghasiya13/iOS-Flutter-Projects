import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app_in/modle.dart';
class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  List<ApiData>? list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async{
    final url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=750a1ffc45194fe0922a46ad88c2be79";
    final uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var itemCount = jsonResponse['articles'];
      print('Number of books about http: $itemCount.');
      setState(() {
        // creating list from itemCount which is array/list[but it type is not list it's dynamic it can be list/map[dic]] of articles ,of the json data
        list = List.from(itemCount).map((e) => ApiData.fromjson(e)).toList();
      });
      print("Data $list!");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Top HeadLines"),
        automaticallyImplyLeading: false,
      ),
      body:Center(
        child: ListView.builder(
            itemCount: list!.length,
            itemBuilder: (contex,index){
              return Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child:ListTile(
                  leading: SizedBox(
                    width: 100,
                    height: 200,
                    child: Image.network(list![index].urlToImage  ?? "https://t4.ftcdn.net/jpg/03/88/63/83/360_F_388638369_wSBADhKfhiTx6Q5Pz1xfdpy6zotku1Sg.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                    title: Text(list![index].title ?? "nil",style: TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.justify,),
                  )   
                )
              );
            },
          ),
      ),
    );
  }

}

