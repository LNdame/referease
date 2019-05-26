import 'package:flutter/material.dart';
import 'package:referease/uipage/registration/about.dart';
import 'package:referease/uipage/search/help.dart';
import 'package:referease/uipage/search/search.dart';
import 'package:referease/uipage/search/support.dart';
import 'uiutility/colors.dart';
import 'package:referease/uipage/landing.dart';
import 'package:referease/uipage/registration/login.dart';
import 'package:referease/uipage/registration/signin.dart';
import 'package:referease/uipage/registration/register.dart';

import 'package:referease/uipage/registration/profile.dart';
import 'package:referease/uipage/summary/summarydetail.dart';
import 'package:referease/uipage/summary/summarylist.dart';
import 'package:referease/uipage/source/sourcelist.dart';
import 'package:referease/uipage/source/authorlist.dart';
import 'package:referease/uipage/source/addsource.dart';
import 'package:referease/testzone/pageviewdemo.dart';


import 'splashpage.dart';

class ReferEase extends StatelessWidget{

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Refer Easy",
      home: LandingPage(),
      initialRoute: '/splash',
      routes: {
        '/login': (context)=> SignInPage(),
        '/register': (context)=> SignupPage(),
        '/landing':(context)=> LandingPage(),
        '/summarylist':(context)=> SummaryList(),
        '/summarydetail':(context)=> SummaryDetail(),
        '/sourcelist':(context)=> SourceList(),
        '/profile':(context)=> UserProfile(),
        '/authorlist':(context)=> AuthorList(),
        '/addsource':(context)=> AddSource(),
        '/pageview':(context)=> PageViewDemo(),
        '/search':(context)=> Search(),
        '/about':(context)=> About(),
        '/support':(context)=> Support(),
        '/help':(context)=>Help(1),

      },

      onGenerateRoute: _getRoute,

      theme: _kReferTheme,

    );
  }

   Route<dynamic> _getRoute(RouteSettings settings) {
     if (settings.name != '/splash') {
       return null;
     }

     return MaterialPageRoute<void>(
     settings: settings,
     builder: (BuildContext context) => SplashPage(),
     fullscreenDialog: true,
     );
   }
}

final ThemeData _kReferTheme = _buildShrineTheme();
ThemeData _buildShrineTheme(){
  final ThemeData base= ThemeData.light();
  return base.copyWith(
    accentColor: kReferAccent,
    primaryColor: kReferPrimary,
    buttonColor: kReferAccent,
    scaffoldBackgroundColor: kReferSurfaceWhite,
    cardColor: kReferBackgroundWhite,
    textSelectionColor: kReferPrimaryAltText,
    errorColor: kReferErrorRed,

    textTheme: _buildReferTextTheme(base.textTheme),
    primaryTextTheme: _buildReferTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildReferTextTheme(base.accentTextTheme),

    primaryIconTheme: base.iconTheme.copyWith(
        color: kReferAccentDark
    ),

    inputDecorationTheme: InputDecorationTheme(
      border:OutlineInputBorder( borderRadius: BorderRadius.circular(4.0)
      ),
    ),

  );
}


TextTheme _buildReferTextTheme(TextTheme base){

  return base.copyWith(

    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),

  ).apply(
    //fontFamily: 'Rubik',
    displayColor: kReferPrimaryAltText,
    bodyColor: kReferPrimaryAltText,
  );
}