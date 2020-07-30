import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oktilli',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.white,
      ),
      home: MyHomePage(title: 'Oktilli'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //For Slider of Recently Added Dealership cars
  // var names = <String>[];
  // var images = <String>[];
  // var ver = <String>[];
  // var priceVal = <String>[];
  // var creator = <String>[];
  // var company = <String>[];

  //For Slider of Recently Viewed cars
  final List<String> carnames = ["MERCEDES", "HONDA", "CULTUS"];
  final List<String> carimages = ['assets/images/car1.jpg','assets/images/car2.jpg','assets/images/car3.jpg'];
  final List<String> carver = ['SLC200','SLC300','SLC400'];
  final List<String> carpriceVal = ['125,000','122,000','120,000'];
  final List<String> carcreator = ['MERCEDES LTD','HONDA LTD','CULTUS LTD'];
  final List<String> carcompany = ['by ABC','by XYZ','by ABC'];
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  PageController controller = PageController();

  @override
  void initState(){
      getDataDealership();
  }

  getDataDealership() async{
    String url = 'https://expenseflutterapp.000webhostapp.com/oktilli/viewDealershipCars.php';
    var res = await http.get(Uri.encodeFull(url),headers:{"Accept":"application/json"});
    var responsebody = json.decode(res.body.toString());
    return responsebody;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oktilli.com",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 40,
        ),textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
  
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.blue),
          onPressed: (){
            // _scaffoldKey.currentState.openDrawer(),
          }
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications,color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.deepOrange,
              padding: const EdgeInsets.only(top:50.0,left:50.0,right:50.0,bottom: 30.0),
              child: Row(children: <Widget>[
                CircleAvatar(
                  backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
                            ? Colors.deepOrange
                            : Colors.blue,
                    child: Icon(Icons.person,color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(left:15.0),
                  child: Column(children: <Widget>[
                  Text("John Doe",
                    style: TextStyle(fontSize: 25,color: Colors.white),
                  ),
                  Text("San Francisco, CA",
                    style: TextStyle(fontSize: 15,color: Colors.white),
                  ),
                ],)
                ),
              ],)
            ),
            Container(
              margin: const EdgeInsets.only(top:15.0,left:50.0,right:50.0,bottom: 10.0),
              child: FloatingActionButton.extended(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              icon: const Icon(Icons.add,color: Colors.white),
              label: const Text('NEW AD LISTING',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),),
              onPressed: () { },
            ),
            ),
            ListTile(
              title: Text('MANAGE ADS',
                style: TextStyle(color: Colors.deepOrange,
                fontSize: 15
                ),
              ),
              leading: Icon(Icons.filter, color: Colors.deepOrange),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushReplacementNamed(HomePage.tag);
              },
            ),
            ListTile(
              title: Text('SAVED CARS',
                style: TextStyle(color: Colors.deepOrange,
                fontSize: 15
                ),
              ),
              leading: Icon(Icons.file_download, color: Colors.deepOrange),
              onTap: () {},
            ),
            ListTile(
              title: Text('MY PROFILE',
                style: TextStyle(color: Colors.deepOrange,
                fontSize: 15
                ),
              ),
              leading: Icon(Icons.person, color: Colors.deepOrange),
              onTap: () {},
            ),
            ListTile(
              title: Text('PACKAGE SETTINGS',
                style: TextStyle(color: Colors.deepOrange,
                fontSize: 15
                ),
              ),
              leading: Icon(Icons.card_giftcard, color: Colors.deepOrange),
              onTap: () {},
            ),
            ListTile(
              title: Text('APP SETTINGS',
                style: TextStyle(color: Colors.deepOrange,
                fontSize: 15
                ),
              ),
              leading: Icon(Icons.settings, color: Colors.deepOrange),
              onTap: () {},
            ),
            ListTile(
              title: Text('LOGOUT',
                style: TextStyle(color: Colors.deepOrange,
                fontSize: 15
                ),
              ),
              leading: Icon(Icons.exit_to_app, color: Colors.deepOrange),
              onTap: () {},
            ),
            Container(
              margin: const EdgeInsets.only(left:15.0),
              child: Text("HELP & SUPPORT",
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
              )
            ),
            Container(
              color: Colors.deepOrange,
              margin:const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(1.0),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(children: <Widget>[
              Row(children: <Widget>[
                Icon(Icons.arrow_forward,color: Colors.deepOrange),
                Text("Buy/Sell a car",style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
              ],),
              Row(children: <Widget>[
                Icon(Icons.arrow_forward,color: Colors.deepOrange),
                Text("Pricing",style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
              ],),
              Row(children: <Widget>[
                Icon(Icons.arrow_forward,color: Colors.deepOrange),
                Text("Terms & Conditions",style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
              ],),
              Row(children: <Widget>[
                Icon(Icons.arrow_forward,color: Colors.deepOrange),
                Text("Privacy Policy",style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
              ],),
              Row(children: <Widget>[
                Icon(Icons.arrow_forward,color: Colors.deepOrange),
                Text("Refund Policy",style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
              ],),
              Row(children: <Widget>[
                Icon(Icons.arrow_forward,color: Colors.deepOrange),
                Text("Contact us",style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
              ],),
              Row(children: <Widget>[
                Icon(Icons.arrow_forward,color: Colors.deepOrange),
                Text("FAQs",style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
              ],),
              Row(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top:15.0,left: 15.0,bottom: 15.0),
                  child: Icon(Typicons.social_facebook,color: Colors.deepOrange),
                ),
                Container(
                  margin: const EdgeInsets.only(top:15.0,left: 15.0,bottom: 15.0),
                  child:Icon(Typicons.social_instagram,color: Colors.deepOrange),
                ),
                Container(
                  margin: const EdgeInsets.only(top:15.0,left: 15.0,bottom: 15.0),
                  child:Icon(Typicons.social_twitter,color: Colors.deepOrange),
                ),
              ],),
             
            ],)
            )
            
          ],
        ),
      ),
      body: FutureBuilder(
        future: getDataDealership(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          List snap = snapshot.data;
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return Center(
              child: Text("Error Fetching Data"),
            );
          }
          return CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: new SliverChildBuilderDelegate(
                (context, index) {
                return Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Column(
                        children: [
                            new Container(
                              color: Colors.deepOrange,
                              child: new Column(
                                children: <Widget>[
                                new Container(
                                margin: const EdgeInsets.only(top:20.0,left:15.0,right:15.0),
                                height: 60,
                                // padding: EdgeInsets.all(8),
                                child: TextField(
                                // onChanged: onTextChange,
                                decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(Icons.search,color: Colors.blue),
                                hintText: 'Search Car',
                                hintStyle: TextStyle(color: Colors.blue,fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20), 
                                  borderSide: new BorderSide(
                                  color: Colors.blue,
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero
                              )
                            ),
                          ),
                          new Row(
                            children: <Widget>[
                              new Container(
                                // margin: const EdgeInsets.all(20.0),
                                margin: const EdgeInsets.only(left: 15.0, top:15.0),
                                // margin: new EdgeInsets.symmetric(horizontal: 20.0),
                                child: FloatingActionButton.extended(
                                  foregroundColor: Colors.black54,
                                  backgroundColor: Colors.grey[300],
                                  icon: const Icon(Icons.search,color: Colors.black),
                                  label: const Text('Advance Search',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                  ),),
                                  onPressed: () { },
                                  shape: RoundedRectangleBorder(),
                                ),
                              ),
                              new Container(
                                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
                                child: FloatingActionButton.extended(
                                  foregroundColor: Colors.black54,
                                  backgroundColor: Colors.grey[300],
                                  icon: Icon(Icons.directions_car,color: Colors.black),
                                  label: Text('Sell Now',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                  ),),
                                  onPressed: () { },
                                  shape: RoundedRectangleBorder(),
                                ),
                              )
                            ]),
                            new Container(
                              margin: const EdgeInsets.only(top:15.0),
                              color: Colors.white,
                              child: new Column(
                                children: <Widget>[
                                  new Container(
                                      margin: const EdgeInsets.only(top:15.0),
                                      padding: new EdgeInsets.all(9.0),
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(16.0),
                                        color: Colors.blue,
                                      ),
                                      child: Text("Recently Added Dealership Cars",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15
                                        ),
                                      )
                                    ),
                                    new Container(
                                      padding: new EdgeInsets.all(11.0),
                                      // margin: new EdgeInsets.all(11.0),
                                      height: MediaQuery.of(context).size.height * 0.35,
                                      child: PageView.builder(
                                        // onPageChanged: (index) {
                                        //   _current = index;
                                        // },
                                        controller: controller,
                                        scrollDirection: Axis.horizontal,
                                          itemCount:snap.length, itemBuilder: (context, index) {
                                            // _current = index;
                                            return Container(
                                              // decoration: new BoxDecoration(
                                              //   border: new Border.all(color: Colors.grey)
                                              // ),
                                              width: MediaQuery.of(context).size.width * 0.9,
                                              child: Column(
                                                children: <Widget>[
                                                  Card( 
                                                    color: Colors.grey[300],
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          // padding: const EdgeInsets.only(top:20.0,left: 10.0),
                                                          child: new Center(
                                                            child: new Row(
                                                              children: <Widget>[
                                                                new Column(
                                                                  children: <Widget>[
                                                                    Image.asset(snap[index]['image'],width: 200),
                                                                  ]
                                                                ),
                                                                new Container(
                                                                  margin: const EdgeInsets.all(15.0),
                                                                  child: new Column(
                                                                    children: <Widget>[
                                                                      new Text(
                                                                        snap[index]['name'],
                                                                        // textAlign: TextAlign.right,
                                                                        style: TextStyle(fontWeight:FontWeight.bold),
                                                                      ),
                                                                      new Text(
                                                                        snap[index]['version'],
                                                                        // textAlign: TextAlign.left,
                                                                        style: TextStyle(fontWeight:FontWeight.bold),
                                                                      ),
                                                                      new Text(
                                                                        snap[index]['creator'],
                                                                        // textAlign: TextAlign.right,
                                                                        style: TextStyle(fontWeight:FontWeight.bold,
                                                                        color: Colors.grey,
                                                                        fontSize: 10),
                                                                      ),
                                                                      new Text(
                                                                        snap[index]['company'],
                                                                        // textAlign: TextAlign.left,
                                                                        style: TextStyle(fontWeight:FontWeight.bold,
                                                                        fontSize: 10),
                                                                      ),
                                                                      new Text(
                                                                        snap[index]['price']+"AED",
                                                                        // textAlign: TextAlign.left,
                                                                        style: TextStyle(
                                                                          fontWeight:FontWeight.bold,
                                                                          color: Colors.deepOrange),
                                                                      ),
                                                                      
                                                                    ] 
                                                                  ),
                                                                )
                                                              ]),
                                                          ),
                                                        ),
                                                        
                                                      ],
                                                      
                                                    ),
                                                    
                                                  ),
                                                   Container(
                                                      padding: const EdgeInsets.only(top:15.0),
                                                      child: new DotsIndicator(
                                                          dotsCount: snap.length,
                                                          position: index,
                                                          decorator: DotsDecorator(
                                                            spacing: const EdgeInsets.all(3.0),
                                                          ),
                                                        ),
                                                    ),
                                                ],
                                               
                                              ),
                                              
                                            );
                                        },
                                        ),
                                    ),
                                        new Container(
                                      // margin: const EdgeInsets.all(15.0),
                                      // color: Colors.blue,
                                      padding: new EdgeInsets.all(11.0),
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(16.0),
                                        color: Colors.blue,
                                        
                                      ),
                                      child: Text("Recently Viewed Vehicles",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15
                                        ),
                                      )
                                    ),
                                    new Container(  //Building Slider
                                      padding: new EdgeInsets.all(11.0),
                                      // margin: new EdgeInsets.all(11.0),
                                      height: MediaQuery.of(context).size.height * 0.35,
                                      child: PageView.builder(
                                        // onPageChanged: (index) {
                                        //   _current = index;
                                        // },
                                        controller: controller,
                                        scrollDirection: Axis.horizontal,
                                          itemCount: carimages.length, itemBuilder: (context, index) {
                                            // _current = index;
                                            return Container(
                                              width: MediaQuery.of(context).size.width * 0.9,
                                              child: Column(
                                                children: <Widget>[
                                                  Card( 
                                                    color: Colors.grey[300],
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          // padding: const EdgeInsets.only(top:20.0,left: 10.0),
                                                          child: new Center(
                                                            child: new Row(
                                                              children: <Widget>[
                                                                new Column(
                                                                  children: <Widget>[
                                                                    Image.asset(carimages[index],width: 200),
                                                                  ]
                                                                ),
                                                                new Container(
                                                                  margin: const EdgeInsets.all(15.0),
                                                                  child: new Column(
                                                                    children: <Widget>[
                                                                      new Text(
                                                                        carnames[index],
                                                                        // textAlign: TextAlign.right,
                                                                        style: TextStyle(fontWeight:FontWeight.bold),
                                                                      ),
                                                                      new Text(
                                                                        carver[index],
                                                                        // textAlign: TextAlign.left,
                                                                        style: TextStyle(fontWeight:FontWeight.bold),
                                                                      ),
                                                                      new Text(
                                                                        carcreator[index],
                                                                        // textAlign: TextAlign.right,
                                                                        style: TextStyle(fontWeight:FontWeight.bold,
                                                                        color: Colors.grey,
                                                                        fontSize: 10),
                                                                      ),
                                                                      new Text(
                                                                        carcompany[index],
                                                                        // textAlign: TextAlign.left,
                                                                        style: TextStyle(fontWeight:FontWeight.bold,
                                                                        fontSize: 10),
                                                                      ),
                                                                      new Text(
                                                                        carpriceVal[index]+"AED",
                                                                        // textAlign: TextAlign.left,
                                                                        style: TextStyle(
                                                                          fontWeight:FontWeight.bold,
                                                                          color: Colors.deepOrange),
                                                                      ),
                                                                      
                                                                    ] 
                                                                  ),
                                                                )
                                                              ]),
                                                          ),
                                                        ),
                                                        
                                                      ],
                                                      
                                                    ),
                                                    
                                                  ),
                                                   Container(
                                                      padding: const EdgeInsets.only(top:10.0),
                                                      child: new DotsIndicator(
                                                          dotsCount: carimages.length,
                                                          position: index,
                                                          decorator: DotsDecorator(
                                                            spacing: const EdgeInsets.all(3.0),
                                                          ),
                                                        ),
                                                    ),
                                                ],
                                               
                                              ),
                                              
                                            );
                                        },),
                                    ),
                                ]
                              )
                            )
                            ]
                            ),

                            ),
                            
                            
                          ]
                        )
                ),
                ],
              ),
            );
          },
          childCount: 1,
          ),
          ),
          ],
 

              );
            }
    ),
    );
  }
}
