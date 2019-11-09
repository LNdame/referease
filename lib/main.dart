import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:referease/app.dart';
import 'package:logging/logging.dart';

void main() {
  Stetho.initialize();
  _setupLogging();
  runApp(new ReferEase());
}

void _setupLogging(){
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec){
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

