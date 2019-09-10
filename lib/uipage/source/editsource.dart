import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:referease/model/source.dart';
import 'package:referease/uipage/search/help.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:referease/model/author.dart';
import 'package:referease/uiutility/reusable.dart';


class EditSource extends StatefulWidget{

  SourceType sourceType;
  final Source aSource;
  final DocumentSnapshot documentSnapshot;


  EditSource({this.aSource, this.documentSnapshot, this.sourceType});

  @override
  _EditSourceState createState() => new _EditSourceState();

}

class _EditSourceState extends State<EditSource> {

  String _sourceType;

  String sourceID =null;


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



    //fill the controller

    titleController.text = widget.aSource.title;
    authorsController.text = widget.aSource.authors;



    getUserData();
    _sourceType = setSourceType();

    Future.delayed(Duration(seconds: 2)).then((dynamic)=>
        Reusable.showOverlayInstruction(context)
    );

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


  getUserData() async{
    _currentUser = await FirebaseAuth.instance.currentUser();
  }




  Widget _FieldRow(String fieldName, TextEditingController cont){
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
                    labelText: fieldName
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

      Book book = (widget.aSource as Book);

      yearController.text= book.year ;
      pagesController.text = book.pages;
      cityController.text= book.city ;
      editionController.text = book.edition;

      editorController.text = book.editors;
      publisherController.text= book.publisher;
      DOIController.text = book.doi;
      ISBNController.text = book.isbn ;

      sourceID= book.docID;


      return Column(

        children: <Widget>[
          _FieldRow("Year", yearController),
          _FieldRow("Pages", pagesController),
          _FieldRow("City", cityController),
          _FieldRow("Edition" , editionController),
          _FieldRow("Editors", editorController),
          _FieldRow("Publisher", publisherController),
          _FieldRow("DOI",DOIController),
          _FieldRow("ISBN", ISBNController),
        ],
      );
    } else if(widget.sourceType == SourceType.conference_proceeding){

      ConferenceProceeding ConfPro = (widget.aSource as ConferenceProceeding);

      proceTitleController.text = ConfPro.proceTitle;
      yearController.text = ConfPro.year ;
      pagesController.text =ConfPro.pages ;
      cityController.text =ConfPro.city ;
      editorController.text =ConfPro.editors ;
      publisherController.text =ConfPro.publisher ;
      urlController.text =ConfPro.url ;
      DOIController.text =ConfPro.doi ;
      sourceID= ConfPro.docID;

      return Column(
        children: <Widget>[
          _FieldRow("Proceeding Title", proceTitleController),
          _FieldRow("Year", yearController),
          _FieldRow("Pages", pagesController),
          _FieldRow("City", cityController),

          _FieldRow("Editors", editorController),
          _FieldRow("Publisher" , publisherController),
          _FieldRow("URL", urlController),
          _FieldRow("DOI",DOIController),

        ],
      );

    }else if(widget.sourceType == SourceType.journal_article){

      JournalArticle journal = (widget.aSource as JournalArticle);
      yearController.text = journal.year;
      journalController.text = journal.journal;
      volumeController.text = journal.volume;
      issueController.text = journal.issue;
      pagesController.text = journal.pages;
      urlController.text = journal.url;
      DOIController.text = journal.doi;
      sourceID= journal.docID;

      return Column(
        children: <Widget>[
          _FieldRow("Year", yearController),
          _FieldRow("Journal", journalController),
          _FieldRow("Volume" , volumeController),
          _FieldRow("Issue", issueController),
          _FieldRow("Pages", pagesController),
          _FieldRow("URL", urlController),
          _FieldRow("DOI",DOIController),

        ],
      );

    }else if(widget.sourceType == SourceType.web){

      Web web = (widget.aSource as Web);

      yearController.text= web.year ;
      publicationController.text= web.publication;
      pagesController.text = web.pages;
      dateAccessController.text= web.dateAccessed;
      urlController.text= web.url ;
      DOIController.text = web.doi;
      sourceID= web.docID;

      return Column(
        children: <Widget>[
          _FieldRow("Year", yearController),
          _FieldRow("Publication", publicationController),
          _FieldRow("Pages", pagesController),
          _FieldRow("Date Accessed", dateAccessController),

          _FieldRow("URL", urlController),
          _FieldRow("DOI",DOIController),

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
        title: Text("Edit a source"), //Text('Add Source'),

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
                      Text('${_sourceType}',
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


                    _FieldRow("Author(s) (separated by ; )" , authorsController),

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

                              _buildOtherFields(),/*
                              _FieldRow("Year", yearController),
                              _FieldRow("Pages", pagesController),
                              _FieldRow("City", cityController),
                              _FieldRow("Edition" , editionController),
                              _FieldRow("Editors", editorController),
                              _FieldRow("Publisher", publisherController),
                              _FieldRow("DOI",DOIController),
                              _FieldRow("ISBN", ISBNController),*/
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


          if(widget.documentSnapshot!=null){
             var value;
            Firestore.instance.runTransaction((Transaction trans) async{

              if(widget.sourceType == SourceType.book){
                await trans.update(widget.documentSnapshot.reference, {
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
                  'uid':_currentUser.uid,});



              }else if(widget.sourceType == SourceType.conference_proceeding){

                await trans.update(widget.documentSnapshot.reference, {
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
                  'uid':_currentUser.uid,});


              }else if (widget.sourceType == SourceType.journal_article){
                await trans.update(widget.documentSnapshot.reference, {
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
                  'uid':_currentUser.uid,});

              }else if(widget.sourceType == SourceType.web) {

                await trans.update(widget.documentSnapshot.reference, {
                  'type': TypeConstant.web,
                  'title' : titleController.text,
                  'authors':authorsController.text,
                  'year':yearController.text,
                  'date_accessed': dateAccessController.text,
                  'publication': publicationController.text,
                  'url':urlController.text,
                  'doi':DOIController.text,
                  'pages':pagesController.text,
                  'uid':_currentUser.uid,});
              }



            });//end run transaction

             Fluttertoast.showToast(msg: "The source has been updated" ,
                 toastLength: Toast.LENGTH_LONG,
                 gravity: ToastGravity.CENTER,
                 timeInSecForIos: 2,
                 backgroundColor: kReferAccentDark,
                 textColor: Colors.white
             );

          }

            /*


                Fluttertoast.showToast(msg: "The source has been updated" ,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 2,
                  backgroundColor: kReferAccentDark,
                  textColor: Colors.white
                );

             Firestore.instance.collection('sources').document(sourceID).get().then(
                    (DocumentSnapshot docSnap){
                      Firestore.instance.runTransaction((Transaction transaction) async{
                        await transaction.update(docSnap.reference,
                            //replace this with the update to json
                            {

                              'title' : titleController.text,
                              'authors':authorsController.text,
                              'year':yearController.text,
                              'city': cityController.text,
                              'edition': editionController.text,
                              'editors':editorController.text,
                              'publisher':publisherController.text,
                              'doi':DOIController.text,
                              'isbn':ISBNController.text,
                              'uid':_currentUser.uid,


                            }).then((value){
                       //   Navigator.of(context).popAndPushNamed('/landing');
                        }).catchError((error){print(error);});
                      });
              
            });

           Firestore.instance.runTransaction((Transaction transaction) async{
              CollectionReference reference = Firestore.instance.collection('sources');
              await reference.add({
                'type': "book",
                'title' : titleController.text,
                'authors':authorsController.text,
                'year':yearController.text,
                'city': cityController.text,
                'edition': editionController.text,
                'editors':editorController.text,
                'publisher':publisherController.text,
                'doi':DOIController.text,
                'isbn':ISBNController.text,
                'uid':_currentUser.uid,
                'created_date': now.toString()

              }).then((value){
                Navigator.of(context).popAndPushNamed('/landing');

              }).catchError((error){print(error);});

            } ); */



          }),
      /*FancyButton( inst: "Save Source", icon: Icons.save ,
          onPressed: (){
           // Navigator.pushNamed(context, '/summarydetail');
          }) ,*/

      bottomNavigationBar: BottomAppBar( elevation: 8.0,

        color: kReferPrimary,
        child: Container( height: 50.0,
          padding: EdgeInsets.only(left: 16.0, right: 16.0),

        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );//scaffold
  }
}