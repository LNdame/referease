
import 'package:flutter/material.dart';

Widget fieldRow(String fieldName, TextEditingController cont) {
  return Card(
    child: Container(
      height: 85.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: TextFormField(
                controller: cont,
                decoration: InputDecoration(labelText: fieldName),
                onFieldSubmitted: (String item) {},
              ),
            )
          ],
        ),
      ),
    ),
  );
}