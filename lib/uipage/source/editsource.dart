import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:referease/data/api_functions/source/request_update_source_api.dart';
import 'package:referease/model/source.dart';
import 'package:referease/model/source_model.dart';
import 'package:referease/model/source_type.dart';
import 'package:referease/uipage/search/help.dart';
import 'package:referease/uipage/widgets/source_field_row.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:referease/model/author.dart';
import 'package:referease/uiutility/reusable.dart';

class EditSource extends StatefulWidget {
  SourceTypeName sourceTypeName;
  final SourceModel aSource;

  EditSource({this.aSource,  this.sourceTypeName});

  @override
  _EditSourceState createState() => new _EditSourceState();
}

class _EditSourceState extends State<EditSource> {
  String _sourceType;
  String sourceID = null;

  final PageController pageController = PageController(
    initialPage: 0,
  );

  TextEditingController titleController;

  TextEditingController authorsController;

  TextEditingController yearController;

  TextEditingController pagesController;

  TextEditingController cityController;

  TextEditingController editionController;

  TextEditingController editorController;

  TextEditingController publisherController;

  TextEditingController DOIController;

  TextEditingController ISBNController;

  TextEditingController urlController;

  TextEditingController volumeController;

  TextEditingController journalController;

  TextEditingController issueController;

  TextEditingController proceTitleController;

  TextEditingController publicationController;

  TextEditingController dateAccessController;

  @override
  void initState() {
    titleController = new TextEditingController();
    authorsController = new TextEditingController();
    yearController = new TextEditingController();

    pagesController = new TextEditingController();
    cityController = new TextEditingController();
    editionController = new TextEditingController();

    editorController = new TextEditingController();
    publisherController = new TextEditingController();
    DOIController = new TextEditingController();
    ISBNController = new TextEditingController();

    issueController = new TextEditingController();
    urlController = new TextEditingController();
    volumeController = new TextEditingController();
    journalController = new TextEditingController();
    proceTitleController = new TextEditingController();
    publicationController = new TextEditingController();
    dateAccessController = new TextEditingController();

    titleController.text = widget.aSource.title;
    authorsController.text = widget.aSource.authors;

    _sourceType = setSourceType();

    Future.delayed(Duration(seconds: 2))
        .then((dynamic) => Reusable.showOverlayInstruction(context));
  }

  String setSourceType() {
    switch (widget.sourceTypeName) {
      case SourceTypeName.book:
        return "Book";
        break;
      case SourceTypeName.conference_proceeding:
        return "Conference";
        break;
      case SourceTypeName.journal_article:
        return "Journal Article";
        break;
      case SourceTypeName.web:
        return "Web";
        break;
      default:
        return "Book";
        break;
    }
  }

  Future<Null> openAuthorDialog() async {
    TextEditingController lnCont = new TextEditingController();
    TextEditingController midCont = new TextEditingController();
    TextEditingController fnCont = new TextEditingController();

    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 0.0),
            children: <Widget>[
              Container(
                color: kReferSurfaceWhite,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      height: 4.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: lnCont,
                        decoration: InputDecoration(labelText: "Last Name"),
                        //input decorator
                        onFieldSubmitted: (value) {},
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: midCont,
                        decoration: InputDecoration(
                            labelText: "Middle Name"),
                        onFieldSubmitted: (value) {},
                        validator: (input) => input.length < 0
                            ? 'this field cannot be empty'
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: fnCont,
                        decoration: InputDecoration(
                            labelText: "First Name"),
                        onFieldSubmitted: (value) {},
                        validator: (input) => input.length < 0
                            ? 'this field cannot be empty'
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0, top: 0.0),
                      child: Text(
                        'Add Author',
                        style: TextStyle(
                            color: kReferAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        } //builder
        )) {
      case 0:
      case 1:
        setState(() {
          if (authorsController.text.isEmpty) {
            authorsController.text =
                "${lnCont.text}, ${fnCont.text} ${midCont.text}";
          } else {
            authorsController.text =
                "${authorsController.text}; ${lnCont.text}, ${fnCont.text} ${midCont.text}";
          }
        });
        break;
    }
  }

  Widget _buildOtherFields() {
    if (widget.sourceTypeName == SourceTypeName.book) {

      yearController.text = widget.aSource.year;
      pagesController.text = widget.aSource.pages;
      cityController.text = widget.aSource.city;
      editionController.text = widget.aSource.edition;

      editorController.text = widget.aSource.editors;
      publisherController.text = widget.aSource.publisher;
      DOIController.text = widget.aSource.doi;
      ISBNController.text = widget.aSource.isbn;
      //sourceID = widget.aSource.id;

      return Column(
        children: <Widget>[
          fieldRow("Year", yearController),
          fieldRow("Pages", pagesController),
          fieldRow("City", cityController),
          fieldRow("Edition", editionController),
          fieldRow("Editors", editorController),
          fieldRow("Publisher", publisherController),
          fieldRow("DOI", DOIController),
          fieldRow("ISBN", ISBNController),
        ],
      );
    } else if (widget.sourceTypeName == SourceTypeName.conference_proceeding) {

      proceTitleController.text = widget.aSource.proceeding_title;
      yearController.text = widget.aSource.year;
      pagesController.text = widget.aSource.pages;
      cityController.text = widget.aSource.city;
      editorController.text = widget.aSource.editors;
      publisherController.text = widget.aSource.publisher;
      urlController.text = widget.aSource.url;
      DOIController.text = widget.aSource.doi;
      //sourceID = ConfPro.docID;

      return Column(
        children: <Widget>[
          fieldRow("Proceeding Title", proceTitleController),
          fieldRow("Year", yearController),
          fieldRow("Pages", pagesController),
          fieldRow("City", cityController),
          fieldRow("Editors", editorController),
          fieldRow("Publisher", publisherController),
          fieldRow("URL", urlController),
          fieldRow("DOI", DOIController),
        ],
      );
    } else if (widget.sourceTypeName == SourceTypeName.journal_article) {

      yearController.text = widget.aSource.year;
      journalController.text = widget.aSource.journal;
      volumeController.text = widget.aSource.volume;
      issueController.text = widget.aSource.issue;
      pagesController.text = widget.aSource.pages;
      urlController.text = widget.aSource.url;
      DOIController.text = widget.aSource.doi;
      //sourceID = journal.docID;

      return Column(
        children: <Widget>[
          fieldRow("Year", yearController),
          fieldRow("Journal", journalController),
          fieldRow("Volume", volumeController),
          fieldRow("Issue", issueController),
          fieldRow("Pages", pagesController),
          fieldRow("URL", urlController),
          fieldRow("DOI", DOIController),
        ],
      );
    } else if (widget.sourceTypeName == SourceTypeName.web) {

      yearController.text = widget.aSource.year;
      publicationController.text = widget.aSource.publication;
      pagesController.text = widget.aSource.pages;
      dateAccessController.text = widget.aSource.date_accessed;
      urlController.text = widget.aSource.url;
      DOIController.text = widget.aSource.doi;
      //sourceID = web.docID;
      return Column(
        children: <Widget>[
          fieldRow("Year", yearController),
          fieldRow("Publication", publicationController),
          fieldRow("Pages", pagesController),
          fieldRow("Date Accessed", dateAccessController),
          fieldRow("URL", urlController),
          fieldRow("DOI", DOIController),
        ],
      );
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        title: Text("Edit a source"),
        //Text('Add Source'),
        elevation: 0.0,
        backgroundColor: kReferSurfaceWhite,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.help_outline,
              semanticLabel: 'help',
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Help(5),
                  ));
            },
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('${_sourceType}',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold)),
                      Text('.',
                          style: TextStyle(
                              color: kReferAccent,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: kReferAltDarkGrey),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: kReferAccent))),
                        ),
                      )
                    ],
                  ),
                ), //padding heading

                /*--------source type------- */

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Add authors',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ), //text
                        Expanded(
                          child: Container(),
                        ),
                        GestureDetector(
                            onTap: () {
                              openAuthorDialog();
                            }, //_submit,
                            child: Icon(Icons.add_box)),
                      ],
                    ),
                    fieldRow("Author(s) (separated by ; )", authorsController),
                    Container(
                        child: Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Other fields',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                            _buildOtherFields(),
                          ],
                        ), //Column
                      ), //Form
                    )),
                  ], //children
                ), //column
              ], //column widget
            ),
          ) //column
        ],
      ),
      //body
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            updateSource(context);
          }),

      bottomNavigationBar: BottomAppBar(
        elevation: 8.0,
        color: kReferPrimary,
        child: Container(
          height: 50.0,
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ); //scaffold
  }


  void updateSource(BuildContext context) {
    SourceModel sourceModel = null;

    if (widget.sourceTypeName == SourceTypeName.book) {
      sourceModel = SourceModel((b) =>
      b
        ..id= widget.aSource.id
        ..authors = authorsController.text
        ..city = cityController.text
        ..title = titleController.text
        ..doi = DOIController.text
        ..edition = editionController.text
        ..editors = editorController.text
        ..isbn = ISBNController.text
        ..publisher = publisherController.text
        ..year = yearController.text
        ..pages = pagesController.text
        ..source_type_id = 1
      );
    } else if (widget.sourceTypeName == SourceTypeName.conference_proceeding) {
      sourceModel = SourceModel((b) =>
      b
        ..id= widget.aSource.id
        ..authors = authorsController.text
        ..city = cityController.text
        ..title = titleController.text
        ..proceeding_title = proceTitleController.text
        ..doi = DOIController.text
        ..url = urlController.text
        ..editors = editorController.text
        ..publisher = publisherController.text
        ..year = yearController.text
        ..pages = pagesController.text
        ..source_type_id = 2
      );
    } else if (widget.sourceTypeName == SourceTypeName.journal_article) {
      sourceModel = SourceModel((b) =>
      b
        ..id= widget.aSource.id
        ..authors = authorsController.text
        ..title = titleController.text
        ..journal = journalController.text
        ..doi = DOIController.text
        ..url = urlController.text
        ..volume = volumeController.text
        ..issue = issueController.text
        ..publisher = publisherController.text
        ..year = yearController.text
        ..pages = pagesController.text
        ..source_type_id = 3
      );
    } else if (widget.sourceTypeName == SourceTypeName.web) {
      sourceModel = SourceModel((b) =>
      b
        ..id= widget.aSource.id
        ..authors = authorsController.text
        ..city = cityController.text
        ..title = titleController.text
        ..doi = DOIController.text
        ..url = urlController.text
        ..date_accessed = dateAccessController.text
        ..publication = publicationController.text
        ..year = yearController.text
        ..pages = pagesController.text
        ..source_type_id = 4
      );
    }

    requestUpdateSource(context, sourceModel).then((saved) {
      if (saved) {
        Navigator.of(context).popAndPushNamed('/home');
      }
    }).catchError((error) {
      print(error);
    });
  }
}
