import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:referease/data/api_functions/request_profile_details.dart';
import 'package:referease/model/user_model.dart';
import 'package:referease/uipage/pages/about_page.dart';
import 'package:referease/uipage/pages/profile_page.dart';
import 'package:referease/uipage/pages/questionnaire_page.dart';
import 'package:referease/uipage/pages/source_page.dart';
import 'package:referease/uipage/pages/summary_page.dart';
import 'package:referease/uiutility/colors.dart';

class MainScreen extends StatefulWidget {
  final pageChange;

  const MainScreen({Key key, this.pageChange}) : super(key: key);

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
  AboutPage aboutPage;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    aboutPage = new AboutPage();
    profilePage = new ProfilePage();
    questionnairePage = new QuestionnairePage();
    sourcePage = new SourcePage();
    summaryPage = new SummaryPage();
    pages = [
      summaryPage,
      sourcePage,
      questionnairePage,
      profilePage,
      aboutPage
    ];
    if (widget.pageChange != null) {
      currentPage = widget.pageChange;
    } else {
      currentPage = summaryPage;
    }

    profileDetailsRequest(context).then((onValue) {
      final UserModel user = onValue.body;
      if (user.first_name == "" && user.last_name == "") {
        noProfileDialog(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            icon:
            Image.asset(
              'assets/images/triangle.png',
              width: 22.0,
              height: 22.0,
              color: Colors.blueGrey[200],
            ),
            title: Text("Summary"),
          ),
          BottomNavigationBarItem(
           icon: FaIcon(FontAwesomeIcons.solidCircle) ,
//
            title: Text("Source"),
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.question)   ,
//
            title: Text("Questionnaire"),
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.solidUser)  ,
//
            title: Text("Profile"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.infoCircle),
            title: Text("About"),
          ),
        ],
      ),
      body: currentPage,
    );
  }

  noProfileDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
            children: <Widget>[
              Container(
                color: kReferPrimary,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 110.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.person_add,
                        size: 40.0,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    Text(
                      'Profile update',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Please update profile',
                      style: TextStyle(color: Colors.white70, fontSize: 12.0),
                    ),
                  ],
                ),
              ), //container

              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                  setState(() {
                    currentTab = 3;
                    currentPage = pages[3];
                  });
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        FontAwesomeIcons.cogs,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Update',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
