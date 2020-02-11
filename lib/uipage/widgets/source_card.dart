import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referease/model/source.dart';
import 'package:referease/model/source_model.dart';
import 'package:referease/model/source_type.dart';
import 'package:referease/uipage/pages/helpers/source_open_reference_view.dart';
import 'package:referease/uipage/source/editsource.dart';

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
                    IconButton(onPressed:(){
                      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>EditSource(aSource: source ,sourceTypeName: getSourceType(source.source_type_id),)));

                    } ,
                        icon: Icon(Icons.edit)),
                    SizedBox(
                      width: 18.0,
                    ),
                    PopupMenuButton<String>(
                      onSelected: (option){
                        Source aSource = getBareSource(source);
                        if(option==Constants.havard){
                        //  print(" ${aSource.toHarvard()}");
                          openReferenceView(context, aSource.toHarvard(), "Havard");
                          //  Share.share(" ${abook.toHarvard()}");
                        }else if(option == Constants.apa){
                          openReferenceView(context, aSource.toApa(), "APA");
                         // print(" ${aSource.toApa()}");
                          //  Share.share(" ${abook.toApa()}"); //it works on actual device
                        }


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

  SourceTypeName getSourceType(int sourceTypeId){
    switch(sourceTypeId){
      case 1: return SourceTypeName.book; break;
      case 2: return SourceTypeName.conference_proceeding; break;
      case 3: return SourceTypeName.journal_article; break;
      case 4: return SourceTypeName.web; break;
      default: return SourceTypeName.book; break;
    }
  }

  Source getBareSource (SourceModel sourceModel){
    switch (sourceModel.source_type_id) {
      case 1:
        return new Book(authors: sourceModel.authors,
            city: sourceModel.city,
            title: sourceModel.title,
            doi: sourceModel.doi,
            edition: sourceModel.edition,
            editors: sourceModel.editors,
            isbn: sourceModel.isbn,
            publisher: sourceModel.publisher,
            year: sourceModel.year,
            pages: sourceModel.pages);
        break;
      case 2:
        return new ConferenceProceeding(title: sourceModel.title,
            authors: sourceModel.authors,
            proceTitle: sourceModel.proceeding_title,
            year: sourceModel.year,
            pages: sourceModel.pages,
            city: sourceModel.city,
            doi: sourceModel.doi,
            editors: sourceModel.editors,
            url: sourceModel.url,
            publisher: sourceModel.publisher);
        break;
      case 3:
        return new JournalArticle(title: sourceModel.title,
            authors: sourceModel.authors,
            journal: sourceModel.journal,
            year: sourceModel.year,
            pages: sourceModel.pages,
            doi: sourceModel.doi,
            volume: sourceModel.volume,
            issue: sourceModel.issue,
            url: sourceModel.url,
            publisher: sourceModel.publisher);
        break;
      case 4:
        return new Web(authors: sourceModel.authors,
            title: sourceModel.title,
            publication: sourceModel.publication,
            year: sourceModel.year,
            dateAccessed: sourceModel.date_accessed,
            url: sourceModel.url,
            doi: sourceModel.doi,
            pages: sourceModel.pages);
        break;
      default:
        return new Book(authors: sourceModel.authors,
            city: sourceModel.city,
            title: sourceModel.title,
            doi: sourceModel.doi,
            edition: sourceModel.edition,
            editors: sourceModel.editors,
            isbn: sourceModel.isbn,
            publisher: sourceModel.publisher,
            year: sourceModel.year,
            pages: sourceModel.pages);
        break;
    }

  }



}

class Constants {
  static const String havard = "Harvard";
  static const String apa = "APA";

  static const List<String> options = <String>[havard, apa];
}

/*
if(type==TypeConstant.book){

aSource = new Book(authors: authors, city: city, title: title, doi:doi,edition: edition, editors: editor,
isbn: isbn, publisher: publisher,type: type,uid: uid,year: year,pages: pages, docID: docID);
sType = prefix0.SourceTypeName.book;
icon = Icons.book;

}else if(type==TypeConstant.conference_proceeding){

aSource = new ConferenceProceeding( title: title, authors: authors, proceTitle: proceTitle, year: year,
pages: pages, city: city,
doi:doi, editors: editor, url: url, publisher: publisher,type: type,uid: uid,docID: docID);

sType = prefix0.SourceTypeName.conference_proceeding;
icon = Icons.description;

}else if(type==TypeConstant.journal_article){

aSource = new JournalArticle(title: title, authors: authors, journal:journal, year: year,pages: pages ,
doi:doi,volume: volume, issue: issue, url: url, publisher: publisher,type: type,docID: docID);
sType = prefix0.SourceTypeName.journal_article;
icon = Icons.import_contacts;

}else if(type==TypeConstant.web){

aSource = new Web(authors: authors,  title: title, publication:publication,year: year,dateAccessed: dateAccessed,
url: url,uid: uid,  doi:doi, pages: pages,type: type,docID: docID);
sType = prefix0.SourceTypeName.web;
icon = Icons.public;

} */