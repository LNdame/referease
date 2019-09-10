import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:referease/commonwidget/drawerwidget.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:referease/model/source.dart';
import 'package:referease/uipage/search/help.dart';
import 'package:referease/uipage/source/addsource.dart';
import 'package:referease/uipage/source/editsource.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:share/share.dart';

import 'package:intl/intl.dart';



class SourceList extends StatefulWidget{

  String  currentUser_uid;

  SourceList({this.currentUser_uid});

  @override
  SourceListState createState() => new SourceListState();

}

class SourceListState extends State<SourceList> {


  Future<Null> sourceOpenDialog() async{
    switch(
    await showDialog(context: context,

        builder: (BuildContext context){
          return SimpleDialog(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
            children: <Widget>[
              Container(
                color: kReferPrimary,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        FontAwesomeIcons.braille,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    Text(
                      'Source type',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Please select the type of source',
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
                    ),
                  ],
                ),
              ),//container

              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.book,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Book',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),//simpledialogoption

              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon( Icons.description,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Conference Proceeding',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),//simpledialog

              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon( Icons.import_contacts,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Journal Article',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),//simpledialog


              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 3);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon( Icons.public,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Web',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),//simpledialog

            ],//shildren
          );//simpleDialog
        }//builder

    )//showdialog


    ){
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSource(sourceType:SourceType.book),) );
        break;
      case 1:  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddSource(sourceType:SourceType.conference_proceeding),) );
      break;
      case 2:  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddSource(sourceType:SourceType.journal_article),) );
      break;
      case 3:  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddSource(sourceType:SourceType.web),) );
      break;

    }
  }

  List<Source> _selectedSources;

  @override
  void initState(){
    super.initState();

    _selectedSources= new List();

  }


  Future<Null>openBiblioView(BuildContext context, String reference, String style) async{
    await showDialog(context: context,
        builder:(BuildContext context){

          return SimpleDialog(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0 ),
            children: <Widget>[
              Container(
                color:kReferPrimary,//kReferBackgroundWhite,
                margin: EdgeInsets.all(2.0),
                height: 40.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: kReferPrimary,
                      child: Text("${style} Reference", style: TextStyle(fontSize: 25.0,color: Colors.white, fontWeight: FontWeight.bold)

                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),

                  ],
                ),//column

              ),//container

              SimpleDialogOption(

                child: Column(
                  children: <Widget>[
                    Text(reference, style:TextStyle(inherit: true, color: Colors.black, fontSize: 14.0, fontFamily: "Montserrat") ,),

                  ],
                ),
              ),

              SimpleDialogOption(
                child: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: (){
                          Share.share(" ${reference}");
                        },
                        icon:  Icon(Icons.share),
                      ),
                    ],


                  ),
                ),
              )

            ],//children

          );//simpledialog

        } //builder
    );
  }

  String extractBiblioAPA(List<Source> sourceList){

    String bibliography="";

    sourceList.forEach((source)=>bibliography+=source.toApa()+" \n");
    return bibliography;
  }

  String extractBiblioHARVARD(List<Source> sourceList){

    String bibliography="";
    sourceList.forEach((source)=>bibliography+=source.toHarvard()+" \n");
    return bibliography;
  }


  Widget _buildSource = SizedBox(
    height: 200.0,
    child: Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.book),
                SizedBox(width: 18.0,),
                Text("Source", style: TextStyle(
                  fontSize: 20.0,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,
                ),),
                SizedBox(width: 18.0,),
                Expanded(child: Container(),),
                Text( DateFormat('H:m yyy-MM-dd').format(DateTime.now())),
                SizedBox(width: 18.0,),
                Icon(Icons.delete),

              ],

            ),//row
            SizedBox(height: 18.0,),
            Expanded(child: Text("The impact of alcohol in study progress on the youth")),
            SizedBox(height: 18.0,),
            Text("Author: Coleman J"),
            SizedBox(height: 18.0,),

            Text("Year: 2001 "),
            SizedBox(height: 18.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.edit),
                SizedBox(width: 18.0,),

                PopupMenuButton<String>(
                onSelected: (option){
                  print(option);
                },
                  itemBuilder: (BuildContext context){
                    return Constants.options.map((String option){
                      return PopupMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }

                    ).toList();
                  },
                )
              ],
            ),

          ],//children

        ),
      ),//column

    ),//card
  );//sizebox




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        brightness: Brightness.light,
        title: Text('Refer Easy'),

        /* IconButton(
                icon:Icon(Icons.menu,semanticLabel: 'menu',),

                onPressed: (){
                  _menuController.openMenu(true);
                  print('Menu button');
                }),*/

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.import_export, semanticLabel: 'import',),
            onPressed: (){
              if(_selectedSources!=null){
                if(_selectedSources.length>=2){
                  String reference ="(APA)\n"+ extractBiblioAPA(_selectedSources)+" \n\n"
                      +"(Harvard) \n"+extractBiblioHARVARD(_selectedSources);

                  openBiblioView(context,reference,"APA & Harvard");
                }
                print('import button');
              }
            },
          ),
         FlatButton(
                child: Text('Help'),
                onPressed: (){
                 // Navigator.pushReplacementNamed(context, '/help');

                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Help(4),) );

                },
          ),
        ],
      ),

      drawer: UIDrawer(),

      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.only(left:8.0, right: 8.0, bottom: 60.0),
          child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget>[
                    Text('Sources',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold)
                    ),
                    Text('.',
                        style: TextStyle( color: kReferAccent,
                            fontSize: 40.0, fontWeight: FontWeight.bold)
                    ),
                  ],
                ),//roww
              ),//container
              Expanded(
                child: StreamBuilder(
                    stream: Firestore.instance.collection('sources').where('uid', isEqualTo:widget.currentUser_uid ).snapshots(),

                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if(!snapshot.hasData) return CircularProgressIndicator();

                      return SourceListView(documents: snapshot.data.documents,
                      onSourceSelected: (source){
                        _selectedSources.add(source);
                        print(_selectedSources.length);

                      },
                       onSourceUnSelected: (Source asource){
                         _selectedSources.removeWhere((source)=> source.docID==asource.docID);
                         print(_selectedSources.length);
                       },
                      );
                    }
                ),//streambuilder
              ),//expanded

            ],
          )



        ),
      ),

      floatingActionButton: FancyButton(icon: Icons.add_box,
          inst: "New source",
          onPressed: (){
           // Navigator.pushNamed(context, '/addsource');
            sourceOpenDialog();
          }) ,

    );

  }


  void optionAction()
  {
    print("working");
  }
}


class Constants{
  static const String havard = "Harvard";
  static const String apa = "APA";

  static const List<String> options = <String>[havard,apa];
}

typedef Null SourceSelectedCallback(Source aSource);
typedef Null SourceUnSelectedCallback(Source aSource);
class SourceListView extends StatefulWidget {

  final List<DocumentSnapshot> documents;
  final SourceSelectedCallback onSourceSelected;
  final SourceUnSelectedCallback onSourceUnSelected;

  SourceListView({this.documents, this.onSourceSelected,this.onSourceUnSelected});

  @override
  SourceListViewState createState() {
    return new SourceListViewState();
  }


}

class SourceListViewState extends State<SourceListView> {

  Future<Null>openReferenceView(BuildContext context, String reference, String style) async{
    await showDialog(context: context,
        builder:(BuildContext context){

          return SimpleDialog(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0 ),
            children: <Widget>[
              Container(
                color:kReferPrimary,//kReferBackgroundWhite,
                margin: EdgeInsets.all(2.0),
                height: 40.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: kReferPrimary,
                      child: Text("${style} Reference", style: TextStyle(fontSize: 25.0,color: Colors.white, fontWeight: FontWeight.bold)

                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),

                  ],
                ),//column

              ),//container

              SimpleDialogOption(

                child: Column(
                  children: <Widget>[
                    Text(reference, style:TextStyle(inherit: true, color: Colors.black, fontSize: 14.0, fontFamily: "Montserrat") ,),

                  ],
                ),
              ),

              SimpleDialogOption(
                child: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: (){
                          Share.share(" ${reference}");
                        },
                        icon:  Icon(Icons.share),
                      ),
                    ],


                  ),
                ),
              )

            ],//children

          );//simpledialog

        } //builder
    );
  }


 List<bool> selectedStateList;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedStateList = new List<bool>(widget.documents.length);
    for(int i =0; i< selectedStateList.length;i++){
      bool b= false;
      selectedStateList[i]= b ;
    }
  }

  _selectedSource(Source aSource){
    widget.onSourceSelected(aSource);
  }

  _unSelectedSource(Source aSource){
    widget.onSourceUnSelected(aSource);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


   // selectedStateList.forEach((b)=>b=false);

    return ListView.builder(itemCount: widget.documents.length,
        itemBuilder: (BuildContext context, int index){

          String id  = widget.documents[index].documentID;

          String year= widget.documents[index].data['year'].toString();
          String authors= widget.documents[index].data['authors'].toString();
          String title= widget.documents[index].data['title'].toString();
          String type= widget.documents[index].data['type'].toString();
          String createdDate= widget.documents[index].data['created_date'].toString();
          String edition =widget.documents[index].data['edition'].toString();
          String city =widget.documents[index].data['city'].toString();
          String doi =widget.documents[index].data['doi'].toString();
          String editor =widget.documents[index].data['editors'].toString();
          String isbn =widget.documents[index].data['isbn'].toString();
          String pages =widget.documents[index].data['pages'].toString();
          String publisher =widget.documents[index].data['publisher'].toString();

          String proceTitle =widget.documents[index].data['proceeding_title'].toString();
          String journal =widget.documents[index].data['journal'].toString();

          String volume =widget.documents[index].data['volume'].toString();
          String issue =widget.documents[index].data['issue'].toString();

          String dateAccessed =widget.documents[index].data['date_accessed'].toString();
          String publication =widget.documents[index].data['publication'].toString();

          String url =widget.documents[index].data['url'].toString();

          String uid =widget.documents[index].data['uid'].toString();
          String docID =widget.documents[index].documentID;

          Source aSource  = null;
          SourceType sType = null;
          var icon;
          //new Book(authors: authors, city: city, title: title, doi:doi,edition: edition, editors: editor,
          //isbn: isbn, publisher: publisher,type: type,uid: uid,year: year,pages: pages);

          if(type==TypeConstant.book){

            aSource = new Book(authors: authors, city: city, title: title, doi:doi,edition: edition, editors: editor,
                isbn: isbn, publisher: publisher,type: type,uid: uid,year: year,pages: pages, docID: docID);
            sType = SourceType.book;
            icon = Icons.book;

          }else if(type==TypeConstant.conference_proceeding){

            aSource = new ConferenceProceeding( title: title, authors: authors, proceTitle: proceTitle, year: year,
                pages: pages, city: city,
          doi:doi, editors: editor, url: url, publisher: publisher,type: type,uid: uid,docID: docID);

            sType = SourceType.conference_proceeding;
            icon = Icons.description;

          }else if(type==TypeConstant.journal_article){

            aSource = new JournalArticle(title: title, authors: authors, journal:journal, year: year,pages: pages ,
                doi:doi,volume: volume, issue: issue, url: url, publisher: publisher,type: type,docID: docID);
            sType = SourceType.journal_article;
            icon = Icons.import_contacts;

          }else if(type==TypeConstant.web){

            aSource = new Web(authors: authors,  title: title, publication:publication,year: year,dateAccessed: dateAccessed,
                url: url,uid: uid,  doi:doi, pages: pages,type: type,docID: docID);
            sType = SourceType.web;
            icon = Icons.public;

          }

           var creDate = DateTime.now();

          if(createdDate!=null){
            try{
              creDate= DateTime.parse(createdDate);
            }catch(e) { print(e);}
          }



           return SizedBox(
             height: 245.0,
             child: Card(
               elevation: 3.0,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[

                         Icon(icon),
                         SizedBox(width: 18.0,),
                         Text("${type}", style: TextStyle(
                           fontSize: 20.0,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,
                         ),),
                         SizedBox(width: 18.0,),
                         Expanded(child: Container(),),
                         Text( DateFormat('H:mm yyy-MM-dd').format(creDate)),
                         SizedBox(width: 18.0,),
                         IconButton(
                           onPressed: (){},
                           icon: Icon(Icons.delete),


                         )



                       ],

                     ),//row
                     SizedBox(height: 18.0,),
                     Expanded(child: Text("${title}",maxLines: 2, overflow: TextOverflow.ellipsis,)),
                     SizedBox(height: 28.0,),
                     Text("Author(s): ${authors}", maxLines: 2, overflow: TextOverflow.ellipsis,),
                     SizedBox(height: 18.0,),

                     Text("Year: ${year} "),
                     SizedBox(height: 9.0,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                         Checkbox(
                           onChanged: (bool resp){
                             setState(() {
                               selectedStateList[index]= resp;
                             });

                             if(resp) _selectedSource(aSource);
                             if(!resp) _unSelectedSource(aSource);

                           },
                           value: selectedStateList[index],//false,//
                         ),
                          Expanded(child: Container(),),

                          IconButton(
                           onPressed: (){
                             Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>EditSource(aSource: aSource, documentSnapshot: widget.documents[index] ,sourceType: sType,)));

                           /*  final snackBar = SnackBar(content: Text("This functionality is not yet implemented" ,
                               style: TextStyle(color: kReferErrorRed),),);
                             Scaffold.of(context).showSnackBar(snackBar);*/
                           },
                           icon:  Icon(Icons.edit),

                         ),
                         SizedBox(width: 18.0,),

                         PopupMenuButton<String>(
                           onSelected: (option){
                             if(option==Constants.havard){

                               print(" ${aSource.toHarvard()}");
                               openReferenceView(context, aSource.toHarvard(), "Havard");
                             //  Share.share(" ${abook.toHarvard()}");
                             }else if(option == Constants.apa){
                               openReferenceView(context, aSource.toApa(), "APA");
                               print(" ${aSource.toApa()}");
                            //  Share.share(" ${abook.toApa()}"); //it works on actual device
                             }


                           },
                           itemBuilder: (BuildContext context){
                             return Constants.options.map((String option){
                               return PopupMenuItem<String>(
                                 value: option,
                                 child: Text(option),
                               );
                             }

                             ).toList();
                           },
                         )
                       ],
                     ),

                   ],//children

                 ),
               ),//column

             ),//card
           );//sizebox
        }

    ) ;//litviewBuilder
  }
}