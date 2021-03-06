import 'package:flutter/material.dart';
import 'package:referease/data/answer_api_service.dart';

import 'package:referease/data/register_api_service.dart';
import 'package:referease/data/source_type_api_service.dart';
import 'package:referease/services/router.dart';
import 'package:referease/data/questionnaire_api_service.dart';

import 'data/logout_api_service.dart';
import 'data/profile_api_service.dart';
import 'data/refresh_api_service.dart';
import 'data/source_api_service.dart';
import 'data/summary_api_service.dart';
import 'uiutility/colors.dart';
import 'package:referease/testzone/test_page.dart';
import 'package:provider/provider.dart';
import 'data/login_api_service.dart';

import 'splashpage.dart';

class ReferEase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          builder: (_) => LoginApiService.create(),
          dispose: (_, LoginApiService service) => service.client.dispose(),
        ),
        Provider(
          builder: (_) => RegisterApiService.create(),
          dispose: (_, RegisterApiService service) => service.client.dispose(),
        ),
        Provider(
          builder: (_) => SourceTypeApiService.create(),
          dispose: (_, SourceTypeApiService service) =>
              service.client.dispose(),
        ),
        Provider(
          builder: (_) => RefreshApiService.create(),
          dispose: (_, RefreshApiService service) => service.client.dispose(),
        ),
        Provider(
          builder: (_) => SourceApiService.create(),
          dispose: (_, SourceApiService service) => service.client.dispose(),
        ),
        Provider(
          builder: (_) => QuestionnairesApiService.create(),
          dispose: (_, QuestionnairesApiService service) =>
              service.client.dispose(),
        ),
        Provider(
          builder: (_) => SummaryApiService.create(),
          dispose: (_, SummaryApiService service) => service.client.dispose(),
        ),
        Provider(
          builder: (_) => ProfileApiService.create(),
          dispose: (_, ProfileApiService service) => service.client.dispose(),
        ),
        Provider(
          builder: (_) => LogoutApiService.create(),
          dispose: (_, LogoutApiService service) => service.client.dispose(),
        ),
        Provider(
          builder: (_) => AnswerApiService.create(),
          dispose: (_, AnswerApiService service) => service.client.dispose(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Refer Easy TEST1",
        home: SplashPage(), // TestPage(),//SplashPage(),
        initialRoute: '/', //'/test',
        onGenerateRoute: Router.generateRoute,
        theme: _kReferTheme,
      ),
    );
  }
}

final ThemeData _kReferTheme = _buildShrineTheme();
ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kReferAccent,
    primaryColorDark: kReferAccentDark,
    primaryColor: kReferPrimary,
    buttonColor: kReferAccent,
    scaffoldBackgroundColor: kReferSurfaceWhite,
    cardColor: kReferBackgroundWhite,
    textSelectionColor: kReferPrimaryAltText,
    errorColor: kReferErrorRed,
    textTheme: _buildReferTextTheme(base.textTheme),
    primaryTextTheme: _buildReferTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildReferTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: kReferAccentDark),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
    ),
  );
}

TextTheme _buildReferTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        //fontFamily: 'Rubik',
        displayColor: kReferPrimaryAltText,
        bodyColor: kReferPrimaryAltText,
      );
}
