import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productsapps/CartModle.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ModleCart>(
      builder:(context,item,child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
              "Cart",
              style: Theme.of(context).textTheme.labelMedium
            ),
            Expanded(
              child:ListView.builder(
                itemCount: item.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(CupertinoIcons.check_mark_circled,color:  Theme.of(context).iconTheme.color,),
                    title: Text(item.list[index].name,style: Theme.of(context).textTheme.titleLarge,),
                    subtitle: Text(item.list[index].price,style: Theme.of(context).textTheme.titleMedium,),
                    trailing: IconButton(
                      icon:  Icon(CupertinoIcons.minus_circle,color: Theme.of(context).iconTheme.color),
                      onPressed: (){
                        item.removedata(item.list[index]);
                      },
                    ),
                  );
                },
              )
            )
            ],
          ),
        ),
        bottomNavigationBar:Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("\$${9999}",style: TextStyle(color: Colors.redAccent,fontSize: 30,fontWeight: FontWeight.bold),),
              Material(
                borderRadius: BorderRadius.circular(20),
                // ignore: deprecated_member_use
                color: Theme.of(context).buttonColor,
                child: InkWell(
                  onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("CommingSoon..."),padding: EdgeInsets.all(10),));
                  },
                  splashColor: Colors.white,
                  child: AnimatedContainer(
                    width: 150,
                    height: 40,
                    alignment: Alignment.center,
                    duration: const Duration(seconds: 3),
                    child: const Text("Buy",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
              )
            ],
          ),
        ) 
      ),
    );
  }
}