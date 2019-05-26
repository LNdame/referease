import 'package:flutter/material.dart';
import 'package:referease/uiutility/colors.dart';


class Help extends StatefulWidget{

  final int flag;


  Help(this.flag);

  @override
  _HelpState createState() {
    return new _HelpState();
  }
}

class _HelpState extends State<Help> {

  Widget _renderHelp(){
    if(widget.flag==1){
      return LandingHelp();
    } else if(widget.flag==2){
      return SummaryHelp();
    }else if(widget.flag==3){
      return NewSummaryHelp();
    }else if(widget.flag==4){
      return EditSourceHelp();
    }else if(widget.flag==5){
      return NewSourceHelp();
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        title: Text('Help'),
        elevation: 0.0,

        backgroundColor:kReferSurfaceWhite ,
      ),//appbar
      body: ListView(
        shrinkWrap: true,

        children: <Widget>[


          _renderHelp(),
        ],
      ),
    );
  }
}




class EditSourceHelp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/images/help/edit_source.png')
        ],
      ),
    );
  }
}


class LandingHelp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/images/help/landing.png'),
          SizedBox(height: 10.0,),
          Image.asset('assets/images/help/landing_2.png'),
          SizedBox(height: 10.0,),
          Image.asset('assets/images/help/landing_3.png'),
        ],
      ),
    );
  }
}

class NewSourceHelp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/images/help/new_source.png')
        ],
      ),
    );
  }
}


class SummaryHelp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/images/help/summary.png')
        ],
      ),
    );
  }
}


class NewSummaryHelp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/images/help/new_summary.png')
        ],
      ),
    );
  }
}
/* padding: EdgeInsets.symmetric(horizontal: 18.0),
              children: <Widget>[
                SizedBox(height: 20.0),
                Column(
                  children: <Widget>[
                    Image.asset('assets/icons/logo.png',
                     // color: kShrineAltYellow,
                    ),

                  ],
                ),*/