import 'package:flutter/material.dart';
import 'package:referease/commonwidget/drawerwidget.dart';
import 'package:referease/uiutility/colors.dart';



class Support extends StatefulWidget{

  @override
  _SupportState createState() {
    return new _SupportState();
  }
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
      appBar:AppBar(
        brightness: Brightness.light,
        title: Text('Support'),
        elevation: 0.0,

        backgroundColor:kReferBackgroundWhite ,


      /*  actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, semanticLabel: 'search',),
            onPressed: (){
              print('Search button');
            },
          ),

        ],*/
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
                      Text('How to Refer Easy',
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
                Text('3 Tips to support even better writing using Refer Easy\n\n ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                RichText(textAlign: TextAlign.justify,
                    text:TextSpan(
                      text:  "1.", style: TextStyle(fontSize: 14.0,  color: Colors.black,fontWeight: FontWeight.w400),
                      children:<TextSpan>[
                        TextSpan(

                            text: " Use full sentences when responding to prompts. Read the text carefully before and while you answer the questions. "
                                "Detail is good, but still, remember to stick to the point of each prompting question."
                                "\n Check again, afterwards. (See?)",
                            style: TextStyle(fontSize: 13.0, color: Colors.black,  fontStyle: FontStyle.normal, fontFamily: "Montserrat" )
                        )
                      ],
                    )
                ), //Richtext
                SizedBox(height: 16.0,),

                Text('', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                RichText(textAlign: TextAlign.justify,
                    text:TextSpan(
                      text:  "2.", style: TextStyle(fontSize: 14.0,  color: Colors.black,fontWeight: FontWeight.w400),
                      children:<TextSpan>[
                        TextSpan(

                            text: " Generate a summary only once all question prompts have been completed. "
                                "TIP: Use both the REFLECT & DISCUSS feature for every piece of writing if possible. "
                                "It provides loads of additional content that you create! "
                                "Email or share summaries to yourself, peers or supervisors for further development and, most importantly, more feedback."
                                " It's easy, and possible via automatically linked apps on most smart mobile devices. "
                                "Then: spellcheck and more, so your writing's even better than before!"
                            ,
                            style: TextStyle(fontSize: 13.0, color: Colors.black,  fontStyle: FontStyle.normal, fontFamily: "Montserrat" )
                        )
                      ],
                    )
                ), //Richtext




                SizedBox(height: 16.0,),

                Text('', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                RichText(textAlign: TextAlign.justify,
                    text:TextSpan(
                      text:  "3.", style: TextStyle(fontSize: 14.0,  color: Colors.black,fontWeight: FontWeight.w400),
                      children:<TextSpan>[
                        TextSpan(

                            text: " Create proper electronic Harvard and APA format references for your assignment and paper bibliographies "
                                "by using the Refer Easy SOURCE GENERATOR feature.",
                            style: TextStyle(fontSize: 13.0, color: Colors.black,  fontStyle: FontStyle.normal, fontFamily: "Montserrat" )
                        )
                      ],
                    )
                ), //Richtext

                SizedBox(height: 16.0,),

                 Text('', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                RichText(textAlign: TextAlign.justify,
                    text:TextSpan(

                      children:<TextSpan>[
                        TextSpan(

                            text: "Let us know if Refer Easy helped you with your academic writing!\n"
                                  "Email us and share your experience and suggestions",
                            style: TextStyle(fontSize: 13.0, color: Colors.black,  fontStyle: FontStyle.normal, fontFamily: "Montserrat" )
                        )
                      ],
                    )
                ), //Richtext */
                SizedBox(height: 26.0,),

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
    );//scaffold;
  }
}
