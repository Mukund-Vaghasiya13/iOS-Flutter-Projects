import 'package:flutter/material.dart';
import 'package:productsapps/CatalogModle.dart';

class ModleCart extends ChangeNotifier{

  List<ApiDataModle> list = [];

  void addItem(ApiDataModle data)
  {
    list.add(data);
    notifyListeners();
  }

  void removedata(ApiDataModle data)
  {
    list.remove(data);
    notifyListeners();
  }

  bool checkingdata(ApiDataModle data)
  {
      if(list.contains(data)){
        return true;
      }
      return false;
  }

}
