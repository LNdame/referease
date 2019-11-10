import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referease/model/summary.dart';
import 'package:referease/model/summary_model.dart';


class SummaryCard extends StatelessWidget{
  final SummaryModel summary;

  SummaryCard({this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: GestureDetector(
        onTap: (){
          // TODO implement a gesture
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
                    child: Text("Title: ${summary.title}",
                      overflow: TextOverflow.ellipsis,)),
                SizedBox(height: 8.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Author: ${summary.authors}"),
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
        ),
      ),
    );
  }

}