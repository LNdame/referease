import 'package:flutter/material.dart';
import 'package:referease/uipage/pages/profile_page.dart';
import 'package:referease/uipage/pages/questionnaire_page.dart';
import 'package:referease/uipage/pages/source_page.dart';
import 'package:referease/uipage/pages/summary_page.dart';


class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() {
    return new _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
    int currentTab = 0;

    //Pages
    ProfilePage profilePage;
    QuestionnairePage questionnairePage;
    SourcePage sourcePage;
    SummaryPage summaryPage;

    List<Widget> pages;
    Widget currentPage;


    @override
    void initState() {
      profilePage = new ProfilePage();
      questionnairePage = new QuestionnairePage();
      sourcePage = new SourcePage();
      summaryPage = new SummaryPage();
      pages=[summaryPage,sourcePage,questionnairePage,profilePage];

      currentPage = summaryPage;

      super.initState();
    }

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Image.asset('assets/images/triangle.png', width: 20.0,height: 20.0, color: Colors.blueGrey[200],),
            title: Text("Summary"),
          ),
          BottomNavigationBarItem(
            icon:  Image.asset('assets/images/circle.png', width: 20.0,height: 20.0, color: Colors.blueGrey[200],),
            title: Text("Source"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            title: Text("Questionnaire"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              ),
              
            title: Text("Profile"),
          ),
        ],
      ),
      body: currentPage,
    );
  }
}