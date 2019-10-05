import 'package:flutter/material.dart';

import 'package:referease/data/register_api_service.dart';
import 'package:referease/data/source_type_api_service.dart';
import 'package:referease/services/router.dart';

import 'package:referease/uipage/main_screen.dart';
import 'package:referease/uipage/registration/about.dart';
import 'package:referease/uipage/search/help.dart';
import 'package:referease/uipage/search/search.dart';
import 'package:referease/uipage/search/support.dart';
import 'data/base_api_service.dart';
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
import 'package:provider/provider.dart';
import 'data/login_api_service.dart';

import 'splashpage.dart';

class ReferEase extends StatelessWidget{

   @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MultiProvider(
      providers: [
        Provider( builder: (_)=> LoginApiService.create(),
          dispose: (_, LoginApiService service)=> service.client.dispose(),),
        Provider( builder: (_)=> RegisterApiService.create(),
          dispose: (_, RegisterApiService service)=> service.client.dispose(),),
        Provider( builder: (_)=> SourceTypeApiService.create(),
          dispose: (_, SourceTypeApiService service)=> service.client.dispose(),)
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Refer Easy TEST1",
          home: SplashPage(),
          initialRoute: '/',
//          routes: {
//            '/login': (context)=> SignInPage(),
//            '/register': (context)=> SignupPage(),
//            '/landing':(context)=> LandingPage(),
//            '/summarylist':(context)=> SummaryList(),
//            '/summarydetail':(context)=> SummaryDetail(),
//            '/sourcelist':(context)=> SourceList(),
//            '/profile':(context)=> UserProfile(),
//            '/authorlist':(context)=> AuthorList(),
//            '/addsource':(context)=> AddSource(),
//            '/pageview':(context)=> PageViewDemo(),
//            '/search':(context)=> Search(),
//            '/about':(context)=> About(),
//            '/support':(context)=> Support(),
//            '/help':(context)=>Help(1),
//
//          },

          onGenerateRoute: Router.generateRoute,

          theme: _kReferTheme,



      ),
    );
  }


//   Route<dynamic> _getRoute(RouteSettings settings) {
//     if (settings.name != '/splash') {
//       return null;
//     }
//
//     return MaterialPageRoute<void>(
//     settings: settings,
//   //  builder: (BuildContext context) => SplashPage(),
//       //builder: (BuildContext context) => MainScreen(),
//       builder: (BuildContext context) => LoginPage(),
//     fullscreenDialog: true,
//     );
//   }

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