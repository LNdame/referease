import 'package:flutter/material.dart';
import 'package:referease/commonwidget/drawerwidget.dart';
import 'package:referease/uiutility/colors.dart';


class Search extends StatefulWidget{
  @override
  _SearchState createState() => new _SearchState();

}

class _SearchState extends State<Search> {

  TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        brightness: Brightness.light,
        title: Text(''),
        elevation: 0.0,

        backgroundColor:kReferBackgroundWhite ,
        /* IconButton(
                icon:Icon(Icons.menu,semanticLabel: 'menu',),

                onPressed: (){
                  _menuController.openMenu(true);
                  print('Menu button');
                }),*/

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, semanticLabel: 'search',),
            onPressed: (){
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(Icons.tune, semanticLabel: 'filter',),
            onPressed: (){
              print('Filter button');
            },
          ),
        ],
      ),

      drawer: UIDrawer(),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: <Widget>[
                      Text('Search',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold)
                      ),
                      Text('.',
                          style: TextStyle( color: kReferAccent,
                              fontSize: 40.0, fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                ),//container

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: <Widget>[

                      Flexible(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                             // labelText: 'Title',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: kReferAltDarkGrey),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: kReferAccent))
                          ),
                        ),
                      )
                    ],
                  ),
                ),//padding heading

              ],
            ),
          )

        ],//children widget
      ),
    );
  }
}