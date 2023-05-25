import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newws_apps/Modle/NewwsModle.dart';
import 'package:url_launcher/link.dart';

class TopHeadlinesNewws extends StatefulWidget {
  String URL;
  TopHeadlinesNewws(this.URL);
  @override
  State<TopHeadlinesNewws> createState() => _TopHeadlinesNewwsState();
}

class _TopHeadlinesNewwsState extends State<TopHeadlinesNewws> {

  List<ApiNewsOrg> list = [];
 
  @override
  void initState() {
    super.initState();
    loadData();
  
  }

  void loadData() async {
    var url = Uri.parse(widget.URL);
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var sepcData = json["articles"];
  
      setState(() {
        list = List.from(sepcData).map((e) => ApiNewsOrg.fromJson(e)).toList();
      });
    }
  

  @override
  Widget build(BuildContext context) {
    return (list.isEmpty)?
         const Center(
            child: CircularProgressIndicator(
            color: Colors.black,
          ))
        :ListView.builder(
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
                                  list[index].name ?? "",
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
          );
  }
}
