import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:referease/dbutils/database_helper.dart';
import 'package:flutter/services.dart';

final String tableAuthor ="authors";
final String columnId ="_id";
final String columnLastName ="lastname";
final String columnFirstName ="firstname";


class Author{
  int _id;
  String lastname;
  String firstname;



  Map<String, dynamic> toMap(){
    var map =<String, dynamic>{

      columnLastName : lastname,
      columnFirstName: firstname

    };
    if(_id!=null){
      map[columnId] = _id;
    }
    return map;
  }

  Author({this.lastname, this.firstname});

  int get id=>_id;
  String get firstName =>firstname;
  String get lastName=> lastname;

  Author.fromMap(Map<String, dynamic> map){
    _id=map[columnId];
    lastname =map[columnLastName];
    firstname =map[columnFirstName];
  }


}

class AuthorDBProvider{

  Database _db;

  Future<Database> get db async{

    if(_db!=null) return _db;

  //  _db= await initDb();
    _db= await initDbInternal();
    return _db;


  }


  AuthorDBProvider (

      );


  Future<Database> initDbInternal() async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "referease.db");

    Database db;
    try{
      db= await openDatabase(path, readOnly: true);
    }on DatabaseException catch ( e){
      print("Error $e");
    }

   if(db==null){
      db = await openDatabase(path, version: 1, onCreate: _onCreate);
      print("Created database,  null found");
      return db;
   }else{
     print("Opening existing database not null found");
     db = await openDatabase(path, version: 1);
     return db;

   }


    }


  void _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE `authors` ( `_id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, `lastname` TEXT NOT NULL, `firstname` TEXT )");

    print("AUthor table added");

    initAuthors();
  }


  Future initAuthors() async{
    var dbProvider = AuthorDBProvider();

    await dbProvider.insert(new Author(lastname:"Patterson",firstname:"James"  ));
    await dbProvider.insert(new Author(lastname:"Besson",firstname:"Luc"  ));
    await dbProvider.insert(new Author(lastname:"Tolkien",firstname:"JR"  ));
    await dbProvider.insert(new Author(lastname:"Park",firstname:"Tony"  ));
    await dbProvider.insert(new Author(lastname:"Brown",firstname:"Loic"  ));

    dbProvider.close();
  }


  Future<Database> Loaddb () async{
    return await db;
  }

  Future<Author> insert (Author author) async{
    var dbClient = await db;
    author._id = await dbClient.insert(tableAuthor, author.toMap());
    return author;
  }


  Future<Author> getAuthor(int id) async{
    List<Map> maps = await _db.query( tableAuthor, columns: [columnId,
      columnLastName, columnFirstName],
      where: "$columnId = ?",
      whereArgs: [id]
    );
    if(maps.length>0){
      return new Author.fromMap(maps.first);
    }
    return null;
  }


  Future <List<Author>> getAuthors() async{
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableAuthor, columns: [columnId,
    columnLastName, columnFirstName]);

    List<Author> authors = new List();

    if(maps.length>0){

      for(int i=0;i< maps.length; i++){
        authors.add(new Author.fromMap(maps[i]));
      }

      return authors;
    }
    return null;

  }


  Future<int> delete(int id) async{
    return await _db.delete(tableAuthor, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> update (Author author) async{
    return await _db.update(tableAuthor, author.toMap(), where: "$columnId = ?", whereArgs: [author._id]);
  }

  Future close() async => _db.close();



}