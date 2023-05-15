import 'package:flutter/material.dart';
class ApiDataModle {
  final id;
  final name;
  final price;
  final image;

  ApiDataModle({this.id, this.name, this.price, this.image});

  factory ApiDataModle.fromJson(Map<String, dynamic> item) {
    return ApiDataModle(
        id: item["id"],
        name: item["name"],
        price: item["Price"],
        image: item["img"]);
  }
}