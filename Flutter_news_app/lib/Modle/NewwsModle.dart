import 'package:flutter/foundation.dart';


class ApiNewsOrg{

final String? title;
final String? description;
final String? urlToImage;
final String? url;
final String? name;

ApiNewsOrg({required this.description, required this.urlToImage, required this.url, required this.name,required this.title});

factory ApiNewsOrg.fromJson(Map<String,dynamic> e)
{
    return ApiNewsOrg(
      title: e["title"],
      description: e["description"],
      urlToImage: e["urlToImage"],
      url:e["url"],
      name: e["source"]["name"]
    );
}

}


class weathereApi{

final String? name;
final num? temperature;
final num? wind_speed;
final num? wind_degree;
final num? feelslike;
final num? humidity;
final num? cloudcove;
final num? pressure;


weathereApi({this.name,this.temperature,this.cloudcove,this.humidity,this.feelslike,this.wind_degree,this.wind_speed,this.pressure});
factory weathereApi.fromjson(Map<String,dynamic> e)
{
  return weathereApi(
    name: e["location"]["name"],
    temperature:e["current"]["temperature"],
    wind_speed: e["current"]["wind_speed"],
    wind_degree: e["current"]["wind_degree"],
    feelslike:e["current"]["feelslike"],
    humidity:e["current"]["humidity"],
    cloudcove:e["current"]["cloudcove"],
    pressure: e["current"]["pressure"]
  );
}


}