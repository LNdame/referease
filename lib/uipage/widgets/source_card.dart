import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referease/model/source.dart';


class SourceCard extends StatelessWidget{
  final Source source;

  SourceCard({this.source});

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

        ),
      ),
    );
  }

}

class Constants{
  static const String havard = "Harvard";
  static const String apa = "APA";

  static const List<String> options = <String>[havard,apa];
}