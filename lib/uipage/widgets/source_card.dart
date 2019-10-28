import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referease/model/source.dart';
import 'package:referease/model/source_model.dart';

class SourceCard extends StatelessWidget {
  final SourceModel source;

  SourceCard({this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: GestureDetector(
        onTap: () {
          // TODO implement a gesture
        },
        child: Card(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(getIcon(source.source_type_id)),
                    SizedBox(
                      width: 18.0,
                    ),
                    Text(
                      "Source",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(DateFormat('H:m yyy-MM-dd').format(DateTime.now())),
                    SizedBox(
                      width: 18.0,
                    ),
                    Icon(Icons.delete),
                  ],
                ), //row
                SizedBox(
                  height: 18.0,
                ),
                Expanded(child: Text(source.title)),
                SizedBox(
                  height: 18.0,
                ),
                Text("Author: ${source.authors}"),
                SizedBox(
                  height: 18.0,
                ),
                Text("Year: ${source.year} "),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.edit),
                    SizedBox(
                      width: 18.0,
                    ),
                    PopupMenuButton<String>(
                      onSelected: (option) {
                        print(option);
                      },
                      itemBuilder: (BuildContext context) {
                        return Constants.options.map((String option) {
                          return PopupMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList();
                      },
                    )
                  ],
                ),
              ], //children
            ),
          ), //column
        ),
      ),
    );
  }

  IconData getIcon(int id) {
    switch (id) {
      case 1:
        return Icons.book;
        break;
      case 2:
        return Icons.description;
        break;
      case 3:
        return Icons.import_contacts;
        break;
      case 4:
        return Icons.public;
        break;
      default:
        return Icons.book;
        break;
    }
  }
}

class Constants {
  static const String havard = "Harvard";
  static const String apa = "APA";

  static const List<String> options = <String>[havard, apa];
}
