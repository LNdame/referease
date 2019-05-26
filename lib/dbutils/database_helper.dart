
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';






Future<Database> initDb() async{

  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "referease.db");

  //try opening (will work if it exists)
  Database db;
  try{
    db= await openDatabase(path, readOnly: true);
  }on DatabaseException catch ( e){
    print("Error $e");
  }

  if(db==null){

    //should happen on first launch
    print("Creating a copy of db from asset");

    //copy from asset
    ByteData data = await rootBundle.load(join("assets","referease.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await new File(path).writeAsBytes(bytes);
    //open the database
    db= await openDatabase(path, readOnly: true);
    return db = await(openDatabase(path, version: 1));

  }else{
    print("Opening existing database not null found");
    return db = await(openDatabase(path, version: 1));
  }


}




