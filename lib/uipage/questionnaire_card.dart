import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referease/data/questionnaire_api_service.dart';
import 'package:referease/uiutility/colors.dart';
import 'dart:convert';
import 'package:provider/provider.dart';



class Questionnaire_Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _buildBody(context),
      
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    // FutureBuilder is perfect for easily building UI when awaiting a Future
    // Response is the type currently returned by all the methods of PostApiService
    return FutureBuilder<Response>(
      // In real apps, use some sort of state management (BLoC is cool)
      // to prevent duplicate requests when the UI rebuilds
      future: Provider.of<QuestionnairesApiService>(context).getQuestionnaires(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Snapshot's data is the Response
          // You can see there's no type safety here (only List<dynamic>)

          
          final List posts = json.decode(snapshot.data.bodyString);
          return _buildPosts(context, posts);
        } else {
          // Show a loading indicator while waiting for the posts
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  

  ListView _buildPosts(BuildContext context, List posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Container(
      height: 250,
          child: GestureDetector(
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
                       
                        
                        Text(posts[index]['questionnaire_type'], style: TextStyle(
                          fontSize: 20.0,fontWeight: FontWeight.w600,fontStyle: FontStyle.normal,
                        ),),
                        SizedBox(width: 18.0,),
                        Expanded(child: Container(),),
                       

                      ],

                    ),//row

                    SizedBox(height: 8.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(posts[index]['authors']),
                      ],//widget
                    ),//row
                    SizedBox(height: 8.0,),
                    ConstrainedBox(constraints:BoxConstraints.expand( width:600.0, height: 20.0) ,
                        child: Text(posts[index]['title'],
                          overflow: TextOverflow.ellipsis,)),
                   
                    Expanded(child: Text(posts[index]['description'],
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      softWrap: true,
                    )),

                  ],//children

                ),
              ),//column
            ),
          ),
        );
      },
    );
  }

}