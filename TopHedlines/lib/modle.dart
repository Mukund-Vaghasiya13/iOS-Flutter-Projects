class ApiData{
  String? title;
  String? urlToImage;

  ApiData({this.title,this.urlToImage});

  factory ApiData.fromjson(Map<String,dynamic> Element)
  {
      return ApiData(
        title: Element["title"],
        urlToImage: Element["urlToImage"]
      );
  }
}