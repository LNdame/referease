
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:referease/dbutils/author_db_helper.dart';

Future<List<Author>> _fetchAuthorFromDB() async{
  var dbProvider = AuthorDBProvider();
  Future<List<Author>> authors = dbProvider.getAuthors();
  return authors;
}



class AuthorList extends StatefulWidget{


  @override
  _AuthorListState createState()=>new _AuthorListState();

}

class _AuthorListState extends State<AuthorList> {

  @override
  void initState() {
    // TODO: implement initState
   // initAuthors();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Author List'),
      ),//appbar

      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder(
            future: _fetchAuthorFromDB(),

            builder: (context, snapshot){
              if(snapshot.hasData){
                return new ListView.builder(
                  itemCount: snapshot.data.length,
                    itemBuilder: (context, index){

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(snapshot.data[index].firstName,
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                        new Text(snapshot.data[index].lastName,
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0)),
                        new Divider()
                      ],
                    );//column


                    }//item builder
                ); //listview

              }else if(snapshot.hasError){
                 return Text("${snapshot.error}");
              }
              return Container(alignment: AlignmentDirectional.center,child: CircularProgressIndicator(),);
            },//builder
        ),  //future builder
      ),//body
    );//scaffold
  }
}