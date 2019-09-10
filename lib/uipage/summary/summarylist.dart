import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:referease/commonwidget/drawerwidget.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:referease/model/summary.dart';
import 'package:referease/uipage/search/help.dart';
import 'package:referease/uipage/summary/summarydetail.dart';
import 'package:referease/uipage/summary/summaryedit.dart';
import 'package:referease/uiutility/colors.dart';

import 'package:intl/intl.dart';
import 'package:share/share.dart';



class SummaryList extends StatefulWidget{

  String  currentUser_uid;


  SummaryList({this.currentUser_uid});

  @override
  SummaryListState createState() => new SummaryListState();

}

class SummaryListState extends State<SummaryList> {

 // FirebaseUser _currentUser;

  getUserData() async{
   // _currentUser = await FirebaseAuth.instance.currentUser();
   // print(_currentUser.uid);
  }


  @override
  void initState() {
    //super.initState();

    //getUserData();
  }

  Future<Null> openDialog() async{
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
                        FontAwesomeIcons.wpforms,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    Text(
                      'Summary type',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Please select the type of summary',
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
                        FontAwesomeIcons.cogs,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Reflect',
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
                      child: Icon( FontAwesomeIcons.commentDots,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Discuss',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

            ],//shildren
          );//simpleDialog
        }//builder

    )//showdialog


    ){
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SummaryDetail(type:"reflect"),) );
        break;
      case 1:  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SummaryDetail(type:"discuss"),) );
      break;

    }
  }

  Widget _buildSummary = SizedBox(
    height: 250.0,
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
                Text("Summary", style: TextStyle(
                  fontSize: 20.0,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,
                ),),
                SizedBox(width: 18.0,),
                Expanded(child: Container(),),
                Text( DateFormat('H:m yyy-MM-dd').format(DateTime.now()))

              ],

            ),//row
            SizedBox(height: 8.0,),
            ConstrainedBox(constraints:BoxConstraints.expand( width:600.0, height: 20.0) ,
                child: Text("Title: The impact of alcohol in study progress on the youth",
                overflow: TextOverflow.ellipsis,)),
            SizedBox(height: 8.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Author: Coleman J"),
                SizedBox(width: 30.0,),
                Text("Year: 2001 "),
              ],//widget
            ),//row

            SizedBox(height: 8.0,),
            Text("Summary Type: Reflection "),

            SizedBox(height: 8.0,),
            Expanded(child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum imperdiet condimentum facilisis. Sed vel pharetra purus. In a erat vel tellus porta aliquam sed et orci. Integer in enim et arcu ullamcorper ultrices. Donec eu interdum velit. Sed volutpat enim odio. Nulla facilisi. Suspendisse consequat quam",
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              softWrap: true,
            )),


            SizedBox(height: 18.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.edit),
                SizedBox(width: 18.0,),
                Icon(Icons.delete)


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
            icon: Icon(Icons.search, semanticLabel: 'search',),
            onPressed: (){
              print('Search button');
            },
          ),
         FlatButton(
                child: Text('Help'),
                onPressed: (){
                 // Navigator.pushReplacementNamed(context, '/help');

                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Help(2),) );

                },
          ),
        ],
      ),

      drawer: UIDrawer(),

      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.only(left:8.0, right: 8.0, bottom: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget>[
                    Text('Summaries',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold)
                    ),
                    Text('.',
                        style: TextStyle( color: kReferAccent,
                            fontSize: 40.0, fontWeight: FontWeight.bold)
                    ),
                  ],
                ),//row
              ),//container,
              Expanded(

                child: StreamBuilder(
                  stream: Firestore.instance.collection('summaries').where('uid', isEqualTo:widget.currentUser_uid ).snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if(!snapshot.hasData) return CircularProgressIndicator();

                      return SummaryListView(documents: snapshot.data.documents,);
                    }
                ),//stream
              )

             // _buildSummary,
            ],
          ),
        ),
      ),

      floatingActionButton: FancyButton(icon: Icons.launch,
          inst: "Start a summary",
          onPressed: (){
            openDialog();//  Navigator.pushNamed(context, '/summarydetail');
          }) ,

    );

  }
}




class SummaryListView extends StatelessWidget{

  final List<DocumentSnapshot> documents;

  SummaryListView({this.documents});


  Future<Null>openSummary(BuildContext context, String summary, Summary asummary, String date) async{
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
                        child: Text("Summary", style: TextStyle(fontSize: 25.0,color: Colors.white, fontWeight: FontWeight.bold)

                        ),
                        margin: EdgeInsets.only(bottom: 10.0),
                      ),

                    ],
                  ),//column

                ),//container

                SimpleDialogOption(

                  child: Column(
                    children: <Widget>[
                      Text(summary, style:TextStyle(inherit: true, color: Colors.black, fontSize: 14.0, fontFamily: "Montserrat") ,),

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
                            Share.share("Title: ${asummary.title};\nAuthors: ${asummary.authors};\nSummary:\n ${summary} "
                                "\n(Generated on ${date}) " );
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


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder( itemCount: documents.length ,
        itemBuilder: (BuildContext context, int index){
        List<String> answers = documents[index].data['answers'].map<String>((item){
          return item.toString();
        }).toList();
        String answer_long ="" ;

        
       answers.forEach((ans)=>answer_long=answer_long+" "+ans+" ");

        String year= documents[index].data['year'].toString();
        String authors= documents[index].data['authors'].toString();
        String title= documents[index].data['title'].toString();
        String type= documents[index].data['type'].toString();
        String uid= documents[index].data['uid'].toString();
        String createdDate= documents[index].data['created_date'].toString();
        
        Summary aSummary = new Summary (
          answers: answers,
          authors: authors,
          title: title,
          type: type,
          year: year,
          uid: uid,

        );
        var creDate = DateTime.now();

        if(createdDate!=null){
          try{
            creDate= DateTime.parse(createdDate);
          }catch(e) { print(e);}
        }


        return SizedBox(
          height: 250.0,
          child: GestureDetector(
            onTap: (){
              openSummary(context, answer_long, aSummary,DateFormat('H:mm yyy-MM-dd').format(creDate));
            },
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
                        (type == "discuss")? Icon(FontAwesomeIcons.commentDots):Icon(FontAwesomeIcons.cogs),
                        SizedBox(width: 18.0,),
                        Text("${type}", style: TextStyle(
                          fontSize: 20.0,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,
                        ),),
                        SizedBox(width: 18.0,),
                        Expanded(child: Container(),),
                        Text( DateFormat('H:mm yyy-MM-dd').format(creDate))

                      ],

                    ),//row
                    SizedBox(height: 8.0,),
                    ConstrainedBox(constraints:BoxConstraints.expand( width:600.0, height: 20.0) ,
                        child: Text("Title:${title}",
                          overflow: TextOverflow.ellipsis,)),
                    SizedBox(height: 8.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Author(s): ${authors}",overflow: TextOverflow.ellipsis,),

                      ],//widget
                    ),//row

                    SizedBox(height: 8.0,),
                    Text("Year:  ${year}  "),

                    SizedBox(height: 8.0,),
                     Expanded(child: Text("${answer_long}",
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        softWrap: true,
                      )),



                    SizedBox(height: 18.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>
                                SummaryEdit(type:type, summary:aSummary, documentSnapshot: documents[index],)));

                           /* final snackBar = SnackBar(content: Text("This functionality is not yet implemented" ,
                              style: TextStyle(color: kReferErrorRed),),);
                            Scaffold.of(context).showSnackBar(snackBar);*/
                          },
                          icon:  Icon(Icons.edit),

                      ),

                        SizedBox(width: 18.0,),
                        IconButton(
                          onPressed: (){
                            Firestore.instance.runTransaction((Transaction transaction) async{
                              DocumentSnapshot snapshot = await transaction.get(
                                documents[index].reference);
                               await transaction.delete(snapshot.reference);
                            });
                          },
                          icon: Icon(Icons.delete),


                        )


                      ],
                    ),

                  ],//children

                ),
              ),//column

            ),
          ),//card
        );//sizebox


        }//itembuilder
    );//list_builder
  }


}
