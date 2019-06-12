import 'package:flutter/material.dart';
import 'package:referease/commonwidget/drawerwidget.dart';
import 'package:referease/uiutility/colors.dart';


class About extends StatefulWidget {
  @override
  AboutState createState() {
    return new AboutState();
  }
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        brightness: Brightness.light,
        title: Text('About'),
        elevation: 0.0,

        backgroundColor:kReferBackgroundWhite ,


        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, semanticLabel: 'search',),
            onPressed: (){
              print('Search button');
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
                      Text('About Refer Easy',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/images/refereasylogo.png", height: 150.0,),
                  ],
                ),//row
                Text('Refer Easy (Test Version)', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                RichText(textAlign: TextAlign.justify,
                    text:TextSpan(
                           text:  "Refer Easy ", style: TextStyle(fontSize: 14.0,  color: Colors.black,fontWeight: FontWeight.w400),
                            children:<TextSpan>[
                              TextSpan(

                                  text: " is a mobile software application designed to support writers and researchers with aspects of academic writing."
                                      " The application was developed after a research project explored student academic writing challenges at "
                                      "Nelson Mandela University. "
                                      "\nListing top difficulties during academic writing, the most commonly reported challenges were:\n"
                                      "\ni. Referencing,"
                                      "\nii. Uncertainty about Own voice vs Other voices,"
                                      "\niii. Paraphrasing Academic Texts.",
                                  style: TextStyle(fontSize: 13.0, color: Colors.black,  fontStyle: FontStyle.normal, fontFamily: "Montserrat" )
                                )
                            ],
                        )
                ), //Richtext
                SizedBox(height: 16.0,),

                Text('Refer Easy V1 Two Main Functions', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                RichText(textAlign: TextAlign.justify,
                    text:TextSpan(

                      children:<TextSpan>[
                        TextSpan(

                            text: "1. To analyse and summarise research (and other) texts using a guiding question protocol. Summaries can be emailed or shared directly for further editing and feedback.\n "
                                "\n2.  To generate appropriate source references and attributions for formal academic purposes. Now available for Harvard and APA styles.\n"
                               ,
                            style: TextStyle(fontSize: 13.0, color: Colors.black,  fontStyle: FontStyle.normal, fontFamily: "Montserrat" )
                        )
                      ],
                    )
                ), //Richtext

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                     Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/images/triangle.png", height: 40.0,width: 40.0,),
                          Container(
                            margin: EdgeInsets.only(top:8.0, bottom: 8.0),
                            child: Text("Summary Generator", style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: kReferPrimaryAltText
                            ),) ,
                          )
                        ],

                      ),
                    //column

                     Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/images/circle.png", height: 40.0,width: 40.0,),
                          Container(
                            margin: EdgeInsets.only(top:8.0, bottom: 8.0),
                            child: Text("Source Generator", style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: kReferPrimaryAltText
                            ),) ,
                          )
                        ],

                      ),//column
                    //gesture




                  ],
                ), //end row


                SizedBox(height: 16.0,),

                Text('Disclaimer', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                RichText(textAlign: TextAlign.justify,
                    text:TextSpan(
                      text:  "This is a test version of the Refer Easy app. ", style: TextStyle(fontSize: 14.0,  color: Colors.black,fontWeight: FontWeight.w400),
                      children:<TextSpan>[
                        TextSpan(

                            text: " is a mobile application seeking to support better writing while using the functionalities"
                                  " and conveniences of a mobile device. Refer Easy is not the answer to writing challenges. Refer Easy may be variously "
                                  "effective, across diverse user inputs and areas of competence in English, which is currently the language of interface. "
                                  "Users should use and develop the content generated by using Refer Easy in conjunction with an up-to-date word processing "
                                  "software package. Users should also run spellchecks, explore grammatical analysis of content, and submit all content "
                                  "generated to a plagiarism check application, like Turnitin. Many universities have subscriptions to these services, "
                                  "Nelson Mandela University does. Consult your Faculty Officer or Librarian for more.\n\n Users should note that this test version is "
                                "not for sharing, and that all functionalities possible have not been enabled. "
                                "The test will provide data and feedback regarding the use, functionality, and experiences of the app, and will be shared in the "
                                "form of research outputs including statistical and written analysis",
                            style: TextStyle(fontSize: 13.0, color: Colors.black,  fontStyle: FontStyle.normal, fontFamily: "Montserrat" ),


                        ),
                        TextSpan(
                          text:". If you experience any issues with the app, try logging out, and then logging in again. If issues persist, "
                              "email Gino.Fransman@mandela.ac.za with details.",
                          style: TextStyle(fontSize: 13.0, color: Colors.black,  fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold, fontFamily: "Montserrat" )

                        )
                      ],
                    )
                ), //Richtext

                SizedBox(height: 16.0,),

               /* Text('Contact', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                RichText(textAlign: TextAlign.justify,
                    text:TextSpan(

                      children:<TextSpan>[
                        TextSpan(

                            text: "For training and help with your writing contact "
                                "\nGino Fransman: Gino.Fransman@mandela.ac.za.\n"
                                "\nTo get in touch with the developer contact "
                                "\nLoic Ndame: Loic.Ndame@mandela.ac.za",
                            style: TextStyle(fontSize: 13.0, color: Colors.black,  fontStyle: FontStyle.normal, fontFamily: "Montserrat" )
                        )
                      ],
                    )
                ), //Richtext */

                  /*  was designed in response to student voice of writing challenges at university,"
                    " and acknowledges the Open Resources from the US Library of Congress, and their Source Attribution Tool."
                    " Merging some of the functionalities and threads from the Source Attribution Tool, and adding features"
                    " available on for-pay word processing platforms, Refer Easy adds a summarising facility that helps to"
                    " generate original, lesser plagiarised reflections and discussions of academic and other texts.")*/



              ],
            ),
          )

        ],//children widget
      ),
    );//scaffold
  }
}