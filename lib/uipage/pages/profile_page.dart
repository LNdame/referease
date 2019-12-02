import 'package:flutter/material.dart';
import 'package:referease/commonwidget/flexiblespacecustom.dart';
import 'package:referease/uipage/registration/profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBarCustom(
                  title: "Profile",
                  pageId: 4,
                )),
          ];
        },
        body: UserProfile(),
      ),
    );
  }
}
