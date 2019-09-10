import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:referease/commonwidget/drawerwidget.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:referease/model/source.dart';
import 'package:referease/uipage/search/help.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:referease/model/author.dart';
import 'package:referease/uiutility/reusable.dart';



class AddSource extends StatefulWidget{
  
  SourceType sourceType;


  AddSource({this.sourceType});

  @override
  _AddSourceState createState() => new _AddSourceState();
  
}

class _AddSourceState extends State<AddSource> {
  
  String _sourcetype = null;

  

  final  PageController pageController = PageController(initialPage: 0,);
  FirebaseUser _currentUser;
  TextEditingController titleController ;
  TextEditingController authorsController ;
  TextEditingController yearController ;

  TextEditingController pagesController ;
  TextEditingController cityController ;
  TextEditingController editionController ;


  TextEditingController editorController ;
  TextEditingController publisherController ;
  TextEditingController DOIController ;
  TextEditingController ISBNController ;
  TextEditingController urlController ;
  TextEditingController volumeController ;
  TextEditingController journalController ;
  TextEditingController issueController ;
  TextEditingController proceTitleController ;
  TextEditingController publicationController ;
  TextEditingController dateAccessController ;




  @override
  void initState() {

     titleController = new TextEditingController();
     authorsController = new TextEditingController();
    yearController= new TextEditingController() ;

     pagesController = new TextEditingController();
    cityController= new TextEditingController() ;
     editionController = new TextEditingController();


   editorController = new TextEditingController();
   publisherController= new TextEditingController() ;
    DOIController = new TextEditingController();
     ISBNController = new TextEditingController() ;

     issueController = new TextEditingController();
     urlController = new TextEditingController();
     volumeController= new TextEditingController() ;
     journalController = new TextEditingController();
     proceTitleController = new TextEditingController() ;
     publicationController = new TextEditingController();
     dateAccessController = new TextEditingController() ;




     getUserData();
     _sourcetype = setSourceType();

     Future.delayed(Duration(seconds: 2)).then((dynamic)=>
         Reusable.showOverlayInstruction(context)
     );

    //  showOverlayInstruction(context);

  }

  getUserData() async{
    _currentUser = await FirebaseAuth.instance.currentUser();
  }



  String setSourceType(){

    switch(widget.sourceType){

      case SourceType.book: return "Book" ;break;
      case SourceType.conference_proceeding:return "Conference" ;break;
      case SourceType.journal_article:return "Journal Article" ;break;
      case SourceType.web:return "Web" ;break;
      default: return "Book"; break;

    }

  }



  Widget _FieldRow(String fieldName, String hintText, TextEditingController cont){
    return Card(

      child: Container(
        height: 85.0,
        child: Padding(
          padding: EdgeInsets.all( 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Flexible(child: TextFormField(
                controller: cont,
                decoration: InputDecoration(
                    labelText: fieldName,
                    hintText :  hintText
                ),
                onFieldSubmitted: (String item){},
              ),
              )

            ],
          ),
        ),
      ),
    );

  }


  Future<Null> openDialog() async{

    TextEditingController lnCont= new TextEditingController();
    TextEditingController midCont= new TextEditingController();
    TextEditingController fnCont = new TextEditingController();

    switch(
    await showDialog(context: context,

        builder: (BuildContext context){
          return SimpleDialog(
            contentPadding: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 0.0),
            children: <Widget>[
              Container(
                color: kReferSurfaceWhite,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    SizedBox(height: 4.0,),
                    Expanded(
                      child: TextFormField(
                        controller: lnCont,
                        decoration: InputDecoration(
                            labelText: "Last Name"
                        ),//input decorator

                        onFieldSubmitted: (value){}, textCapitalization: TextCapitalization.words,),
                    ),

                    SizedBox(height: 8.0,),

                    Expanded(
                      child: TextFormField(
                        controller: midCont,
                        decoration: InputDecoration(
                            labelText: "Middle Name"
                        ),//input decorator

                        onFieldSubmitted: (value){},
                        validator: (input)=>input.length<0?'this field cannot be empty':null,
                      ),
                    ),

                    SizedBox(height: 8.0,),

                    Expanded(
                      child: TextFormField(
                        controller: fnCont,
                        decoration: InputDecoration(
                            labelText: "First Name"
                        ),//input decorator

                        onFieldSubmitted: (value){},
                        validator: (input)=>input.length<0?'this field cannot be empty':null,
                      ),
                    ),


                  ],//widget
                ),
              ),//container

              SimpleDialogOption(

                onPressed: () {
                  Navigator.pop(context, 0);
                },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(bottom: 10.0, top: 0.0),
                        child: Text(
                          'Add Author',
                          style: TextStyle(
                              color: kReferAccent, fontWeight: FontWeight.bold, fontSize: 14.0 ),
                        ),
                      )
                    ],
                  ),

              ),//simpledialogoption



            ],//shildren
          );//simpleDialog
        }//builder

    )//showdialog


    ){
      case 0:

      case 1: setState(() {

        if(authorsController.text.isEmpty){
          authorsController.text =  "${lnCont.text}, ${fnCont.text} ${midCont.text}";
        }else{
          authorsController.text =  "${authorsController.text}; ${lnCont.text}, ${fnCont.text} ${midCont.text}";
        }
      });// Navigator.of(context).pop();

      break;

    }
  }

  Widget  _buildOtherFields(){
    if(widget.sourceType == SourceType.book){
      return Column(
        children: <Widget>[
          _FieldRow("Year", "e.g. 2002", yearController),
          _FieldRow("Pages", "e.g. 16-21", pagesController),
          _FieldRow("City", "e.g. Port Elizabeth", cityController),
          _FieldRow("Edition", "e.g. 3rd", editionController),
          _FieldRow("Editors", "e.g. Allison, James C; Becker, Stacey", editorController),
          _FieldRow("Publisher", "e.g. We Do Reasearch Press", publisherController),
          _FieldRow("DOI", "e.g. 10.1002/182", DOIController),
          _FieldRow("ISBN", "e.g. 987-3-14-168410-1", ISBNController),
        ],
      );
    } else if(widget.sourceType == SourceType.conference_proceeding){
      return Column(
        children: <Widget>[
          _FieldRow("e.g. Proceeding Title", "Working on your research conference", proceTitleController),
          _FieldRow("Year", "e.g 2002", yearController),
          _FieldRow("Pages", "e.g. 16-21",  pagesController),
          _FieldRow("City", "e.g. Port Elizabeth", cityController),
          _FieldRow("Editors", "e.g. Allison, James C; Becker, Stacey", editorController),
          _FieldRow("Publisher", "e.g. We Do Reasearch Press", publisherController),
          _FieldRow("URL", "e.g. http://www.refereasy.co.za", urlController),
          _FieldRow("DOI", "e.g. 10.1002/182", DOIController),

        ],
      );

    }else if(widget.sourceType == SourceType.journal_article){
      return Column(
        children: <Widget>[
          _FieldRow("Year", "e.g. 2002", yearController),
          _FieldRow("Journal", "e.g. Research guidlines weekly", journalController),
          _FieldRow("Volume", "e.g. iii", volumeController),
          _FieldRow("Issue", "e.g. 25", issueController),
          _FieldRow("Pages", "e.g. 16-21", pagesController),
          _FieldRow("Date accessed", "e.g. 19 August 2018", dateAccessController),
          _FieldRow("URL",  "e.g. http://www.refereasy.co.za", urlController),
          _FieldRow("DOI", "e.g. 10.1002/182", DOIController),

        ],
      );

    }else if(widget.sourceType == SourceType.web){
      return Column(
        children: <Widget>[
          _FieldRow("Year", "e.g. 2002", yearController),
          _FieldRow("Publication", "e.g. We Do Reasearch Press", publicationController),
          _FieldRow("Pages", "e.g. http://www.refereasy.co.za/summary", pagesController),
          _FieldRow("Date Accessed", "e.g. 20 January 2019", dateAccessController),

          _FieldRow("URL", "e.g. http://www.refereasy.co.za", urlController),
          _FieldRow("DOI", "e.g. 10.1002/182", DOIController),

        ],
      );
    }
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
        actions: <Widget>[

          FlatButton(
                child: Text('Help'),
                onPressed: (){
                 // Navigator.pushReplacementNamed(context, '/help');

                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Help(5),) );

                },
          ),
        ],

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
                        Text('${_sourcetype}',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[

                        Flexible(
                          child: TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                                labelText: 'Title',
                                hintText: 'e.g. Guide to easy referencing',
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
                              onTap:(){
                                openDialog();
                              } ,//_submit,
                              child: Icon(Icons.add_box)
                          ),
                        ],
                      ),//row


                      _FieldRow("Author(s) (separated by ; )", "e.g. Allison, James C.; Nelson Mandela University", authorsController),

                      Container(
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

                              _buildOtherFields(),


                              ],


                            ),//Column

                            ),//Form

                          )
                      ),
                    ],//children
                  ),//column




                ],//column widget

              ),
            )//column
        ],
      ),//body
      floatingActionButton: FloatingActionButton(child: Icon(Icons.save),
          onPressed: (){

            var now = DateTime.now();

            Firestore.instance.runTransaction((Transaction transaction) async{
              CollectionReference reference = Firestore.instance.collection('sources');

              if(widget.sourceType == SourceType.book){
                  
            if (titleController.text == "" || authorsController.text == "" || yearController.text == "" 
            || cityController.text == "" || publisherController.text == "" || pagesController.text == "")
            {
                noInputDialog(context);
            }
            else {
                          await reference.add({
                  'type': TypeConstant.book,
                  'title' : titleController.text,
                  'authors':authorsController.text,
                  'year':yearController.text,
                  'city': cityController.text,
                  'edition': editionController.text,
                  'editors':editorController.text,
                  'publisher':publisherController.text,
                  'doi':DOIController.text,
                  'isbn':ISBNController.text,
                  'url':urlController.text,
                  'pages':pagesController.text,
                  'uid':_currentUser.uid,
                  'created_date': now.toString()

                }).then((value){
                  Navigator.of(context).popAndPushNamed('/landing');

                }).catchError((error){print(error);});
            }
    

              }else if(widget.sourceType == SourceType.conference_proceeding){
                   if (titleController.text == "" || authorsController.text == "" || yearController.text == "" 
            || cityController.text == "" || publisherController.text == "" || pagesController.text == "" 
            || proceTitleController.text == "" || urlController.text == "")
            {
              noInputDialog(context);
            }
            else{
                   await reference.add({
                  'type': TypeConstant.conference_proceeding,
                  'title' : titleController.text,
                  'authors':authorsController.text,
                  'year':yearController.text,
                  'city': cityController.text,
                  'proceeding_title': proceTitleController.text,
                  'editors':editorController.text,
                  'publisher':publisherController.text,
                  'doi':DOIController.text,
                  'url':urlController.text,
                  'pages':pagesController.text,
                  'uid':_currentUser.uid,
                  'created_date': now.toString()

                }).then((value){
                  Navigator.of(context).popAndPushNamed('/landing');

                }).catchError((error){print(error);});
            }

              }else if (widget.sourceType == SourceType.journal_article){

                      if (titleController.text == "" || authorsController.text == "" || yearController.text == "" 
            || volumeController.text == "" || issueController.text == "" || pagesController.text == "" 
            || journalController.text == "" || urlController.text == "")
            {
              noInputJournalArticle(context);
            }
            else 
            {
              
                await reference.add({
                  'type':TypeConstant.journal_article,
                  'title' : titleController.text,
                  'authors':authorsController.text,
                  'year':yearController.text,
                  'journal':journalController.text,
                  'volume': volumeController.text,
                  'issue':issueController.text,
                  'publisher':publisherController.text,
                  'doi':DOIController.text,
                  'url':urlController.text,
                  'pages':pagesController.text,
                  'uid':_currentUser.uid,
                  'created_date': now.toString()

                }).then((value){
                  Navigator.of(context).popAndPushNamed('/landing');

                }).catchError((error){print(error);});
            }

              }else if(widget.sourceType == SourceType.web){

                
                      if (titleController.text == "" || authorsController.text == "" || yearController.text == "" 
             ||  pagesController.text == "" || urlController.text == "") {
                noInputWeb(context); 
             }
             else {
                            await reference.add({
                  'type': TypeConstant.web,
                  'title' : titleController.text,
                  'authors':authorsController.text,
                  'year':yearController.text,
                  'date_accessed': dateAccessController.text,
                  'publication': publicationController.text,
                  'url':urlController.text,
                  'doi':DOIController.text,

                  'pages':pagesController.text,
                  'uid':_currentUser.uid,
                  'created_date': now.toString()

                }).then((value){
                  Navigator.of(context).popAndPushNamed('/landing');

                }).catchError((error){print(error);});
             }

   
              }



            } );



          }),
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

            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );//scaffold
  }
}

/// everything below here has been rendered irrelevant

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


            _FieldRow("Year"),
            _FieldRow("Pages"),
            _FieldRow("City"),
            _FieldRow("Edition"),
            _FieldRow("Editors"),
            _FieldRow("Publisher"),
            _FieldRow("DOI"),
            _FieldRow("ISBN"),
          ],


            ),//Column

        ),//Form

        )
    );
  }
}

Future<bool> noInputDialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Something went wrong'),
        content: Text('Please enter all fields. Only the DOI and ISBN are optional.'),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
                    Navigator.pop(context);
            },
          )
        ],
      );
    }
  );
}

Future<bool> noInputJournalArticle(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Something went wrong'),
        content: Text('Please enter all fields. Only the Date accessed and DOI are optional.'),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
                    Navigator.pop(context);
            },
          )
        ],
      );
    }
  );
}

Future<bool> noInputWeb(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Something went wrong'),
        content: Text('Please enter all fields. Only the DOI is optional.'),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
                    Navigator.pop(context);
            },
          )
        ],
      );
    }
  );
}