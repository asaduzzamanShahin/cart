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
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatefulWidget {

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}
MyAlertDialog(context){
  return showDialog(
      context: context,
      builder: (BuildContext context){
        return Expanded(child: AlertDialog(
          title: Text("Congratulations!"),
          content: Text("You have added 5 Products on your bag!"),
          actions: [
            ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("OkAY"),style:ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 20), backgroundColor: Colors.orange,),


            )],
        )
        );
      });

}

class _HomeActivityState extends State<HomeActivity> {

  List Mylist = [
    {
      "Name": "Tshirt",
      "Color": "Color:  ""Black",
      "Size": "Size  " "L",
      "Price": 51,
      "count": 1,
      "Image": "images/Tshirt.png"
    },
    /*{
      "Name": "Watch",
      "Color": "Color:  ""Black",
      "Size": "Size  " "M",
      "Price": 100,
      "count": 1,
      "Image": "images/Watch.png"
    },*/
    {
      "Name": "Shoe",
      "Color": "Color:  ""Black",
      "Size": "Size  ""L",
      "Price": 150,
      "count": 1,
      "Image": "images/Shoe.png"
    },
    {
      "Name": "Headphone",
      "Color": "Color:  " "Black",
      "Size": "Size  ""M",
      "Price": 150,
      "count": 1,
      "Image": "images/Headphone.png"
    },


  ];

  int get totalAmount {
    return Mylist.fold<int>(0,
            (total, product) => total + product['Price'] * product["count"] as int);
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white38,
        appBar: AppBar(
            backgroundColor:Colors.white38,
          elevation: 0,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search),)],
    iconTheme: IconThemeData(
    color: Colors.orange),

        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '  My Bag',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 5,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {

                return Card(
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
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
                              SizedBox(height: 10,),
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

                                      child: Image.asset( "images/plus.png",height: 50,)),
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
                              ),
                        ],
                      ),
                    ],
                  ),
                ));
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
            ElevatedButton(onPressed: (){MyAlertDialog(context);}, child: Text("Checkout"),style:ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              backgroundColor: Colors.orange,
            ),),
          ],
     
    ),
    ),
    );
  }
}
