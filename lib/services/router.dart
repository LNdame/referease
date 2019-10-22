
import 'package:flutter/material.dart';
import 'package:referease/splashpage.dart';
import 'package:referease/testzone/pageviewdemo.dart';
import 'package:referease/uipage/landing.dart';
import 'package:referease/uipage/main_screen.dart';
import 'package:referease/uipage/registration/about.dart';
import 'package:referease/testzone/test_page.dart';
import 'package:referease/uipage/registration/register.dart';
import 'package:referease/uipage/registration/signin.dart';
import 'package:referease/uipage/search/help.dart';
import 'package:referease/uipage/search/support.dart';

class Router{
  static Route<dynamic>generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/': return MaterialPageRoute(builder: (_)=> SplashPage());
      case '/home': return MaterialPageRoute(builder: (_)=> MainScreen());
      case '/login': return MaterialPageRoute(builder: (_)=> SignInPage());
      case '/register': return MaterialPageRoute(builder: (_)=> SignupPage());
      case '/landing': return MaterialPageRoute(builder: (_)=> LandingPage());
      case '/pageview': return MaterialPageRoute(builder: (_)=> PageViewDemo());
      case '/about': return MaterialPageRoute(builder: (_)=> About());
      case '/support': return MaterialPageRoute(builder: (_)=> Support());
      case '/help': return MaterialPageRoute(builder: (_)=> Help(1));
      case '/test': return MaterialPageRoute(builder: (_)=> TestPage());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}' )
            ),
          );
        });

    }
  }
}

//'/login': (context)=> SignInPage(),
//'/register': (context)=> SignupPage(),
//'/landing':(context)=> LandingPage(),
//'/summarylist':(context)=> SummaryList(),
//'/summarydetail':(context)=> SummaryDetail(),
//'/sourcelist':(context)=> SourceList(),
//'/profile':(context)=> UserProfile(),
//'/authorlist':(context)=> AuthorList(),
//'/addsource':(context)=> AddSource(),
//'/pageview':(context)=> PageViewDemo(),
//'/search':(context)=> Search(),
//'/about':(context)=> About(),
//'/support':(context)=> Support(),
//'/help':(context)=>Help(1),