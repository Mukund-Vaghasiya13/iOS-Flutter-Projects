import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Modle/NewwsModle.dart';
import 'package:url_launcher/link.dart';
// https://newsapi.org/v2/everything?q=rajkot&from=2023-05-25&sortBy=publishedAt&apiKey=750a1ffc45194fe0922a46ad88c2be79
class SearchBarScreen extends StatefulWidget {
  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  List<ApiNewsOrg> list = [];
  var showindicator = false;
  var Value = "";
  var datanotfound = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const CircleAvatar(
                    foregroundImage: NetworkImage(
                        "https://img.freepik.com/free-psd/3d-rendering-ui-icon_23-2149182295.jpg"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 250,
                      height: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                          Value = value;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Search",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black))),
                      )),
                  const SizedBox(width: 10,),
                  IconButton(onPressed: (){
                    setState(() {
                      setState(() {
                        var year = "${DateTime.now().year}";
                        var month = (DateTime.now().month < 10) ?"0${DateTime.now().month}" : "${DateTime.now().month}";
                        debugPrint(month);
                        var day = (DateTime.now().day < 10)? "0${DateTime.now().day - 1}" :"${DateTime.now().day - 1}";
                            loadData(
                                "https://newsapi.org/v2/everything?q=$Value&from=$year-$month-$day&sortBy=publishedAt&apiKey=750a1ffc45194fe0922a46ad88c2be79");
                          });
                    });
                  }, icon: const Icon(CupertinoIcons.search)),
                  const Expanded(child: SizedBox()),
                ],
              ),
              Expanded(
                child:(showindicator)? Center(child: CircularProgressIndicator()):(datanotfound)?Center(child: Text("Oops!,Data not found"),):ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Link(
                      uri: Uri.parse(list[index].url ??
                          "https://thumbs.dreamstime.com/b/tech-error-image-tech-error-image-loose-screws-273100690.jpg"),
                      target: LinkTarget.self,
                      builder: (BuildContext context,
                              Future<void> Function()? followLink) =>
                          InkWell(
                        onTap: followLink,
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index].name ?? "nil",
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        list[index].title!,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.network(
                                  list[index].urlToImage ??
                                      "https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg?w=2000",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
    
  }

  void loadData(String URL) async {
    setState(() {
      datanotfound = false;
      showindicator = true;
    });
    debugPrint(URL);
    var url = Uri.parse(URL);
   
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var sepcData = json["articles"];
    debugPrint("${sepcData}");
    if (sepcData != null) {
      setState(() {
        list = List.from(sepcData).map((e) => ApiNewsOrg.fromJson(e)).toList();
        debugPrint("$list");
        showindicator = false;
        if(list.isEmpty)
        {
          datanotfound = true;
        }
      });
    }
    
  }
}
//https://newsapi.org/v2/everything?q=Apple&from=2023-05-26&sortBy=popularity&apiKey=750a1ffc45194fe0922a46ad88c2be79
