import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  List Mylist = [
    {
      "Name": "Pullover",
      "Color": "Black",
      "Size": "L",
      "Price": 51,
      "count": 1,
      "Image": "images/a1.jpg"
    },
    {
      "Name": "Apple",
      "Color": "Black",
      "Size": "L",
      "Price": 100,
      "count": 1,
      "Image": "images/a1.jpg"
    },
    {
      "Name": "Orange",
      "Color": "Black",
      "Size": "L",
      "Price": 150,
      "count": 1,
      "Image": "images/a1.jpg"
    },


  ];

  int get totalAmount {
    return Mylist.fold<int>(0,
            (total, product) => total + product['Price'] * product["count"] as int);
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '  My Bag',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 7,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            Mylist[index]["Image"], height: 120,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text(Mylist[index]["Name"]),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [Text(Mylist[index]["Color"]),
                                  SizedBox(width: 10,),
                                  Text(Mylist[index]["Size"]),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(onTap: (){
                                    Mylist[index]["count"]-=1;
                                    setState(() {
                                    });

                                  },
                                      child: Image.asset( "images/minus.png",height: 50,)),
                                  Text(Mylist[index]["count"].toString()),

                                  GestureDetector( onTap: (){Mylist[index]["count"]+=1;
                                    setState(() {

                                    });
                                    },

                                      child: Image.asset( "images/minus.png",height: 50,)),
                                ],

                              ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.more_vert_sharp),
                          SizedBox(height: 50,),
                          Text("${Mylist[index]["Price"]*Mylist[index]["count"]}\$"
                              )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

           

          ],
        ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Amount"),
                  Text("\$${totalAmount}")
                ],
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text("Checkout"),style:ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
            ),),
          ],
     
    ),
    )
    );
  }
}
