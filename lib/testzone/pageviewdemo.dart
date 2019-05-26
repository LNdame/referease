import 'package:flutter/material.dart';



class PageViewDemo extends StatefulWidget{
  
  
  @override
  _PageViewDemoState createState() => new _PageViewDemoState();
  
}

class _PageViewDemoState extends State<PageViewDemo> {
  
 final  PageController pageController = PageController(initialPage: 0,);


   Widget getPageWidget(String text, MaterialColor backgroundColor){
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
      ),
      
    );
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pageview") ,

      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 400.0, width: 400.0,
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getPageWidget("Page 1", Colors.amber),
                getPageWidget("Page 2", Colors.lightBlue),
                getPageWidget("Page 3", Colors.red),
              ],
            ),
          ),


        ],
      ),

    );
  }
}