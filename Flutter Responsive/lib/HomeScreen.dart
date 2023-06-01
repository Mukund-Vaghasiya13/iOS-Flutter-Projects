import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth < 600)
      {
        return Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text("Mobile") ,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width:  MediaQuery.of(context).size.width - 50,
                    decoration:const BoxDecoration(
                       color: Colors.indigoAccent,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: ListView.builder(itemCount: 10,itemBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          height: 100,
                          color: Colors.indigo,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        );
      }
      else if(constraints.maxWidth > 600 && constraints.maxWidth < 850 ){
        return Scaffold(
          appBar:  AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text("Tab OR iPad"),
          ),
          body: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height,
                color: Colors.deepPurple,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width /1.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                       SizedBox(
                         height: 200,
                         child: Expanded(
                           child: Container(
                             color: Colors.indigoAccent,
                           ),
                         ),
                       ),
                        SizedBox(height: 20,),
                       Expanded(
                        child:ListView.builder(itemCount: 10,itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              color: Colors.blue,
                            ),
                          );
                        })
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          
        );
      }
      else{
        return Scaffold(
          appBar: AppBar(
            title: Text("Large Screen"),
            backgroundColor: Colors.deepPurple,
          ),
          body: Row(
            children: [
              Container(
                color: Colors.deepPurple,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 4.5,
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: Expanded(
                            child: Container(
                              color: Colors.indigoAccent,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Container(
                            child: GridView.builder(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: 10, itemBuilder: (context,i){
                              return Container(
                                color: Colors.indigoAccent,
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    });
  }
}