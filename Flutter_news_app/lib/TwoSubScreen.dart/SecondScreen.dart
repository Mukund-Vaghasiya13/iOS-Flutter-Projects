import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:newws_apps/Modle/NewwsModle.dart';
class WeatherData extends StatefulWidget {
  const WeatherData({super.key});

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
weathereApi? firstdata;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  void loaddata() async{
    var url = Uri.parse("http://api.weatherstack.com/current?access_key=1494d2e7370faee517245c0c8b839e80&query=india");
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    debugPrint("${data}");
    setState(() {
     firstdata = weathereApi.fromjson(data);
     debugPrint("${firstdata}");
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return (firstdata == null)? Center(child: CircularProgressIndicator()) :SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            LottieBuilder.network(
              "https://assets4.lottiefiles.com/temp/lf20_Jj2Qzq.json",
              height: 200,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                  child: Text("${firstdata!.temperature ?? 0}°",
                style: TextStyle(fontSize: 70),
              )),
            ),
             Text(firstdata!.name ?? "",
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Details(urljson: "https://assets1.lottiefiles.com/packages/lf20_khrclx93.json",title: "Wind",firstname:"Speed:${firstdata!.wind_speed ?? 0}" ,secondname:"Degree:${firstdata!.wind_degree ?? 0}",thirdname: "",),
                    Details(urljson:"https://assets4.lottiefiles.com/packages/lf20_mwnl7iyc.json",title: "Humidity",firstname: "Humidity:${firstdata!.humidity ?? 0}%",secondname: "",thirdname: "",),
                    Details(urljson: "https://assets4.lottiefiles.com/packages/lf20_Iz3ReK.json",title: "Pressure",firstname: "pressure:${firstdata!.pressure ?? 0}",secondname: "",thirdname: ""),
                    Details(urljson: "https://assets10.lottiefiles.com/packages/lf20_uuzf4huo.json",title: "Feelslike",firstname: "feelslike:${firstdata!.feelslike ?? 0}°",secondname: "",thirdname: "")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Details extends StatefulWidget {
  var urljson;
  var title;
  var firstname;
  var secondname;
  var thirdname;
  Details({this.title,this.urljson,this.firstname,this.secondname,this.thirdname});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          LottieBuilder.network(widget.urljson,height: 100,width: 100,),
          Text(widget.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.firstname),
                Text(widget.secondname),
                Text(widget.thirdname),
              ],
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
/*

humidity




\*/

