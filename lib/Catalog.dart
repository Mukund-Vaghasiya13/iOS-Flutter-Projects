import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productsapps/CartModle.dart';
import 'package:productsapps/Cartpage.dart';
import 'package:provider/provider.dart';
import 'BuyDetails.dart';
import 'CatalogModle.dart';

class CataLogScreen extends StatelessWidget {
  const CataLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderOfCatlog(),
              ListViewforCatalog(),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        },
        child: Icon(CupertinoIcons.cart),
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).buttonColor
      ),
    );
  }
}

// header

class HeaderOfCatlog extends StatelessWidget {
  const HeaderOfCatlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Text(
          "Catalog",
          style: Theme.of(context).textTheme.labelMedium,
          // style: TextStyle(
          //   fontSize: 50,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        Text(
          "E Commerce app",
          style: TextStyle(color: Color.fromARGB(255, 156, 156, 156)),
        )
      ],
    );
  }
}

class ListViewforCatalog extends StatefulWidget {
  @override
  State<ListViewforCatalog> createState() => _ListViewforCatalogState();
}

class _ListViewforCatalogState extends State<ListViewforCatalog> {
// list of type Modle
  List<ApiDataModle> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  void LoadData() async {
    final datas = await rootBundle.loadString("assets/jsonass/products.json");
    final jsondata = jsonDecode(datas);
    setState(() {
      list = List.from(jsondata).map((e) => ApiDataModle.fromJson(e)).toList();
    });
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BuyProductsScreen(data: list[index])));
              },
              child: ListElements(list[index]));
        },
      ),
    );
  }
}

// listTile
class ListElements extends StatelessWidget {
  ApiDataModle data;
  ListElements(this.data);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).canvasColor),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network(
                    data.image,
                  ),
                ),
              ),
            ),
            Expanded(child: DetailsinRow(data: data))
          ],
        ),
      ),
    );
  }
}

// Additional Info
class DetailsinRow extends StatelessWidget {
  ApiDataModle data;

  DetailsinRow({required this.data});
  @override
  Widget build(BuildContext context) {
    return Consumer<ModleCart>(
      builder: (context, item, child) => SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.name,
                style: Theme.of(context).textTheme.titleLarge,
                //style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.price,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Material(
                    // ignore: deprecated_member_use
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        if(item.checkingdata(data))
                        {
                          print("Item there");
                        }
                        else{
                          item.addItem(data);
                        }
                      },
                      child: AnimatedContainer(
                          height: 40,
                          width: 100,
                          duration: Duration(seconds: 2),
                          child: Center(
                            child: (!item.checkingdata(data)) ? const Text(
                            "Buy",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ) : const Icon(CupertinoIcons.check_mark,color: Colors.white,)
                        ) 
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


//Catalog  Modle

