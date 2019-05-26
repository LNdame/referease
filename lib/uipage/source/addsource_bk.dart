import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:referease/commonwidget/drawerwidget.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:referease/model/author.dart';



class AddSource extends StatefulWidget{
  
  
  @override
  _AddSourceState createState() => new _AddSourceState();
  
}

class _AddSourceState extends State<AddSource> {
  
  String _sourcetype = null;
  
  List<String> _sourcetypes = new List<String>();
  final  PageController pageController = PageController(initialPage: 0,);

  @override
  void initState() {
    _sourcetypes.addAll(["Book","Journal Article","Web","Magazine","Conference Proceedings"]);
    _sourcetype = _sourcetypes.elementAt(0);
    
  }

  void _onChanged(String value){
    setState(() {
      _sourcetype = value;
      print(_sourcetype);
    });
  }

  Widget _FieldRow(String fieldName){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '${fieldName}: ',
          style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ),//text
        SizedBox(width: 18.0,),

        Flexible(child: TextFormField(
          initialValue: "",
          onFieldSubmitted: (String item){},
        ),
        )

      ],
    );

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        title: Text("Add a source"), //Text('Add Source'),

        elevation: 0.0,

        backgroundColor:kReferSurfaceWhite ,

      ),//appbar
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[
                        Text('Book',
                            style: TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.bold)
                        ),
                        Text('.',
                            style: TextStyle( color: kReferAccent,
                                fontSize: 40.0, fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[

                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Title',
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

                  /*--------source type------- */

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[
                          Text(
                            'Add authors',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),

                          ),//text
                          Expanded(child: Container(),),

                          GestureDetector(
                              onTap:(){} ,//_submit,
                              child: Icon(Icons.add_box)
                          ),
                        ],
                      ),//row

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: DropdownButton(
                              value: _sourcetype,
                              items: _sourcetypes.map((value){
                                return DropdownMenuItem(
                                  value: value,
                                  child: Row(
                                    children: <Widget>[
                                      Text("${value}"),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged:(value) {
                                _onChanged(value);

                              },
                            ),
                          ),//dropbut
                        ],
                      ) //row
                    ],//children
                  ),//column
                  /*--------End source type------- */

                 // AuthorListPage(),
                 ConstrainedBox(
                     constraints: BoxConstraints(maxHeight: 500.0,
                       minHeight: 300.0,
                       maxWidth:MediaQuery.of(context).size.width, ),

                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        AuthorListPage(),
                        FieldListPage(),
                      ],
                    ),
                  ),


                /*  Text(
                    'Add authors',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),//text

                  StreamBuilder(
                      stream: Firestore.instance.collection('authors').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(!snapshot.hasData) return CircularProgressIndicator();

                        return AuthorListView(documents: snapshot.data.documents);
                      }

                  ),//streambuilder
                  Text(
                    'Fields',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),//text

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kReferAccentDark),
                      borderRadius: BorderRadius.circular(3.0),
                      shape: BoxShape.rectangle
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _FieldRow("Title"),
                        _FieldRow("Year"),
                        _FieldRow("Page"),
                        _FieldRow("City"),
                      ],
                    ),
                  )//container*/




                ],//column widget

              ),
            )//column
        ],
      ),//body
      floatingActionButton: FloatingActionButton(child: Icon(Icons.save),
          onPressed: (){}),
      /*FancyButton( inst: "Save Source", icon: Icons.save ,
          onPressed: (){
           // Navigator.pushNamed(context, '/summarydetail');
          }) ,*/

      bottomNavigationBar: BottomAppBar( elevation: 8.0,

        color: kReferPrimary,
        child: Container( height: 50.0,
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            children: <Widget>[
              GestureDetector(
                  child: Icon(Icons.arrow_left , size: 40.0,),
                onTap: (){
                  pageController.animateToPage(0, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
                },
              ),

              Expanded(child: Container(),),
              GestureDetector(
                onTap: (){
                  pageController.animateToPage(1, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
                },
                  child: Icon(Icons.arrow_right, size: 40.0,)),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );//scaffold
  }
}



class AuthorListView extends StatelessWidget{

  final List<DocumentSnapshot> documents;

  AuthorListView({this.documents});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      shrinkWrap: true,
      itemCount: documents.length,
        itemExtent: 60.0,
        itemBuilder: (BuildContext context, int index){
        String fn = documents[index].data['firstname'].toString();
        String ln = documents[index].data['lastname'].toString();

        return ListTile(
          title: Container(
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(5.0),
                border: Border.all(color: Colors.white)

            ),//box
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Flexible(child: TextFormField(
                  initialValue: fn,
                  onFieldSubmitted: (String item){},
                  ),
            ),

          Flexible(child: TextFormField(
          initialValue: ln,
          onFieldSubmitted: (String item){},
        ),
          )

              //  Text(fn), Text(ln),
              ],

            ),//row


          ),//container

        ); //listtile

        }

    );//builder
  }

}





class AuthorListPage extends StatefulWidget{
  @override
  _AuthorListPageState createState() => new _AuthorListPageState();

}

class _AuthorListPageState extends State<AuthorListPage> {

  List<Author> authors = [
     Author(lastname: "Doe", firstname:"Doe" ),
    new Author(lastname: "clue", firstname:"Jeff" ),
    new Author(lastname: "dane", firstname:"Jane" ),
      ] ;

  final List<GlobalKey<FormState>>  authorFormItemKey = List<GlobalKey<FormState>>();

  void _submit(){

    authors.add(new Author(lastname: "NewDoe", firstname:"JoeNew" ));
    setState(() {

    });

    /*authorFormItemKey.forEach((key){
      if(key.currentState.validate()){

      }

    });*/


   // if(authorFormItemKey.currentState.validate()){

    //}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8.0,),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            Text(
              'Add authors',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),

            ),//text
            Expanded(child: Container(),),

            GestureDetector(
              onTap: _submit,
                child: Icon(Icons.add_box)
            ),
          ],
        ),//row
        Container(

          child: ListView.builder(itemBuilder: (BuildContext context, int index ){
            String fn = authors[index].firstname;
            String ln = authors[index].lastname;
            authorFormItemKey.add (new GlobalKey<FormState>());
            return Card(

              child:Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
               child:
               Form(
                 key: authorFormItemKey[index],
                 child: Row(

                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                     SizedBox(width: 8.0,),
                     Expanded(
                       child: TextFormField(
                         decoration: InputDecoration(
                             labelText: "Last Name"
                         ),//input decorator
                         initialValue: ln,
                         onFieldSubmitted: (value){}, textCapitalization: TextCapitalization.words,),
                     ),
                     SizedBox(width: 18.0,),

                     Expanded(
                       child: TextFormField(
                         decoration: InputDecoration(
                             labelText: "First Name"
                         ),//input decorator
                         initialValue: fn,
                         onFieldSubmitted: (value){},
                         validator: (input)=>input.length<0?'this field cannot be empty':null,
                       ),
                     ),
                     SizedBox(width: 8.0,),
                     GestureDetector(
                         onTap: (){
                           print(index);
                           Author au =   authors.elementAt(index);
                           print(au.lastname);
                         },
                         child: Icon(Icons.delete)
                     ),
                     SizedBox(width: 8.0,),
                   ], //children
                 ),
               ),
              )



            );

          },

            itemCount: authors.length,
            itemExtent: 90.0,
            shrinkWrap: true,
          ),


        ),// container


      ],
    );
  }
}


class AuthorItemList extends StatelessWidget{
  final Author author;

  AuthorItemList(this.author);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Text(author.firstname, style: TextStyle(color: kReferPrimaryAltText),),
    );
  }
}



class FieldListPage extends StatefulWidget{
  @override
  _FieldListPageState createState() => new _FieldListPageState();

}

class _FieldListPageState extends State<FieldListPage> {

  Widget _FieldRow(String fieldName){
    return Card(

      child: Container(
        height: 85.0,
        child: Padding(
         padding: EdgeInsets.all( 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Flexible(child: TextFormField(
                decoration: InputDecoration(
                    labelText: fieldName
                ),
                initialValue: "",
                onFieldSubmitted: (String item){},
              ),
              )

            ],
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child:Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Form(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Other fields',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),

            ),//text

            _FieldRow("Title"),
            _FieldRow("Year"),
            _FieldRow("Page"),
            _FieldRow("City"),
          ],


            ),//Column

        ),//Form

        )
    );
  }
}