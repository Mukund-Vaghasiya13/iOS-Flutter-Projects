import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productsapps/CartModle.dart';
import 'package:productsapps/CatalogModle.dart';
import 'package:provider/provider.dart';

class BuyProductsScreen extends StatelessWidget {
  ApiDataModle data;
  BuyProductsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.network(
                data.image,
                height: 400,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                      style:Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(data: data),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}

class BottomNavBar extends StatefulWidget {
  var data;
  BottomNavBar({required this.data});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var addToCart = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ModleCart>(
      builder: (context, item, child) => Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.data.price,
              style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Material(
              borderRadius: BorderRadius.circular(20),
              // ignore: deprecated_member_use
              color: Theme.of(context).buttonColor,
              child: InkWell(
                onTap: () {
                  if (item.checkingdata(widget.data)) {
                    print("Item there");
                  } else {
                    item.addItem(widget.data);
                  }
                },
                splashColor: Colors.white,
                child: AnimatedContainer(
                    width: 150,
                    height: 40,
                    alignment: Alignment.center,
                    duration: const Duration(seconds: 3),
                    child: (!item.checkingdata(widget.data))
                        ? const Text(
                            "Buy",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        : const Icon(
                            CupertinoIcons.check_mark,
                            color: Colors.white,
                          )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
