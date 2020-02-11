
import 'dart:math';

enum SourceType{book, conference_proceeding, journal_article, web}

abstract class Source {

  final String authors;
  final String title;
  final String docID;


  Source(this.authors, this.title, this.docID);

  String toApa();
  String toHarvard();

}

class Book extends Source {


 final String authors, city, title, doi, edition, editors, isbn, publisher, type, uid, year, pages;
 final String docID;

 Book({this.authors, this.city, this.title, this.doi, this.edition, this.editors,
     this.isbn, this.publisher, this.type, this.uid, this.year, this.pages, this.docID}):super(authors, title,docID);




 var now = DateTime.now();
 Map<String, dynamic> saveToJson()=>{
   'type': "book",
   'title' : title,
   'authors':authors,
   'year':year,
   'city': city,
   'edition': edition,
   'editors':editors,
   'pubisher':publisher,
   'pages':pages,
   'doi':doi,
   'isbn':isbn,
   'uid':uid,
   'created_date': now.toString()
 };


 Map<String, dynamic> updateToJson()=>{

   'title' : title,
   'authors':authors,
   'year':year,
   'city': city,
   'edition': edition,
   'editors':editors,
   'pubisher':publisher,
   'doi':doi,
   'isbn':isbn,
   'uid':uid,

 };




 int numAuthors(){

   if(authors.isNotEmpty && authors!=null){
     List<String>aths = authors.split(';');

     if(aths[0].isEmpty){
       return aths.length -1;
     } else{
       return aths.length;
     }
   }else{
     return 0;
   }


 }


 @override
  String toString() {
    // TODO: implement toString
    return "${title} ${authors} ${year}";
  }


  @override
  String toApa(){

      String citation ="";

      String authorsLine= createAuthorList(authors.split(';'));
      String editorsLine="";//

      if(editors.isNotEmpty)
       editorsLine=createAuthorList(editors.split(';'));

      //add authors
      citation="${authorsLine} ";

      //override authors if editors
      if(editorsLine.isNotEmpty)
      citation="${editorsLine} (Eds.). ";

      //add year
      citation+="(${year}). ";
      //add title
      citation+=" ${title}";
      //add edition if any
      if(edition.isNotEmpty){
       citation+=" (${edition})";
      }
      //add city and publisher
       citation+=". ${city}: ${publisher}.";

      return citation;


  }

 @override
  String toHarvard(){
    String citation ="";

    String authorsLine= createAuthorList(authors.split(';'));
    String editorsLine="";//

    if(editors.isNotEmpty)
      editorsLine=createAuthorList(editors.split(';'));

    //add authors
    citation="${authorsLine} ";

    //override authors if editors
    if(editorsLine.isNotEmpty)
      citation="${editorsLine} (eds.). ";

    //add year
    citation+="${year}. ";
    //add title
    citation+="${title}.";
    //add edition if any
    if(edition.isNotEmpty){
      citation+=" ${edition}";
    }
    //add city and publisher
    citation+=". ${city}: ${publisher}.";

    return citation;



  }






}
String createAuthorList(List<String>authors){

  String authCompile ="";

  if(authors.length<=7) {
    for (int i = 0; i < authors.length; i++) {
      if (i == 0) {
        authCompile = formatAuthor(authors[i]);
      } else if (i == authors.length - 1) {
        authCompile += " & ${formatAuthor(authors[i])}";
      } else {
        authCompile += ", ${formatAuthor(authors[i])}";
      }
    }
  }else{

    for (int i = 0; i < authors.length; i++) {
      if (i == 0) {
        authCompile = formatAuthor(authors[i]);
      }else if (i == authors.length - 1) {
        authCompile += ", ... ${formatAuthor(authors[i])}";
      }else if (i > 5) {
        authCompile += "";
      }  else {
        authCompile += ", ${formatAuthor(authors[i])}";
      }
    }

  }






  return authCompile;

}

String formatAuthor(String author){

  List<String> name = author.split(",");
  String nameComp ="";

  if(name[0].isNotEmpty){
    nameComp+=name[0];
  }

  try{
    if(name[1]!=null && name[1].isNotEmpty){
      nameComp+=", ${name[1].trim().substring(0,1).toUpperCase()}.";
    }
  } on RangeError catch (r){
    print(r.message);

  }on Exception catch (e){
    print(e);
  }

  return nameComp;
}


class ConferenceProceeding extends Source{
  final String title, authors,proceTitle, year, pages , city,  doi,  editors, url, publisher, type, uid;
  final String docID;

  ConferenceProceeding({this.title, this.authors, this.proceTitle, this.year,
      this.pages, this.city, this.doi, this.editors, this.url, this.publisher,
      this.type, this.uid, this.docID}): super(authors,title,docID);



  var now = DateTime.now();
  Map<String, dynamic> saveToJson()=>{
    'type': "conference proceeding",
    'title' : title,
    'authors':authors,
    'year':year,
    'city': city,
    'proceeding_title': proceTitle,
    'editors':editors,
    'publisher':publisher,
    'doi':doi,
    'url':url,
    'pages':pages,
    'uid':uid,
    'created_date': now.toString()
  };


  Map<String, dynamic> updateToJson()=>{

    'type': "conference proceeding",
    'title' : title,
    'authors':authors,
    'year':year,
    'city': city,
    'proceeding_title': proceTitle,
    'editors':editors,
    'publisher':publisher,
    'doi':doi,
    'url':url,
    'pages':pages,
    'uid':uid,
    'created_date': now.toString()

  };

  @override
  String toApa(){

    String citation ="";

    String authorsLine= createAuthorList(authors.split(';'));
    String editorsLine="";//

    if(editors.isNotEmpty)
      editorsLine=createAuthorList(editors.split(';'));

    //add authors
    citation="$authorsLine ";

    //override authors if editors
    if(editorsLine.isNotEmpty)
      citation="${editorsLine} (Eds.). ";

    //add year
    citation+="(${year}). ";
    //add title
    citation+=" ${title}.";
    //add proctitle

      citation+=" ${proceTitle}.";

     //add the pages
    citation+=" ${pages}.";


    //add doi if any
    if(doi.isNotEmpty)
    citation+=". ${doi}";

    return citation;


  }

  @override
  String toHarvard(){
    String citation ="";

    String authorsLine= createAuthorList(authors.split(';'));
    String editorsLine="";//

    if(editors.isNotEmpty)
      editorsLine=createAuthorList(editors.split(';'));

    //add authors
    citation="${authorsLine} ";

    //override authors if editors
    if(editorsLine.isNotEmpty)
      citation="${editorsLine} (eds.). ";

    //add year
    citation+="${year}. ";
    //add title
    citation+=" ${title}.";
    //add proctitle

    citation+=" ${proceTitle}:";

    //add the pages
    citation+=" ${pages}.";


    //add doi if any
    if(doi.isNotEmpty)
      citation+=". ${doi}";
    return citation;



  }



}


class JournalArticle extends Source{
  final String title, authors, journal, year, pages,  doi, volume, issue, url, publisher,  type, uid ;
  final String docID;

  JournalArticle({this.title, this.authors, this.journal, this.year, this.pages,
      this.doi, this.volume, this.issue, this.url, this.type, this.publisher, this.uid,
      this.docID}):super(authors, title,docID);


  var now = DateTime.now();
  Map<String, dynamic> saveToJson()=>{
    'type': "journal article",
    'title' : title,
    'authors':authors,
    'year':year,
    'journal':journal,
    'volume': volume,
    'issue':issue,
    'publisher':publisher,
    'doi':doi,
    'url':url,
    'pages':pages,
    'uid':uid,
    'created_date': now.toString()
  };


  Map<String, dynamic> updateToJson()=>{

    'type': "journal article",
    'title' : title,
    'authors':authors,
    'year':year,
    'journal':journal,
    'volume': volume,
    'issue':issue,
    'publisher':publisher,
    'doi':doi,
    'url':url,
    'pages':pages,
    'uid':uid,


  };

  @override
  String toApa(){

    String citation ="";

    String authorsLine= createAuthorList(authors.split(';'));



    //add authors
    citation="${authorsLine} ";


    //add year
    citation+="(${year}). ";
    //add title
    citation+=" ${title}.";
    //add journal title

      citation+=" ${journal},";
    //add volume
    citation+=" ${volume}";

    //add issue if any
    if(issue.isNotEmpty)
      citation+="(${issue})";

    //add pages
    citation+=", ${pages}.";

    return citation;


  }

//todo format this properly
  @override
  String toHarvard(){
    String citation ="";

    String authorsLine= createAuthorList(authors.split(';'));
    String editorsLine="";//

    //add authors
    citation="${authorsLine} ";


    //add year
    citation+="(${year}). ";
    //add title
    citation+=" ${title}.";
    //add journal title

    citation+=" ${journal},";
    //add volume
    citation+=" ${volume}";

    //add issue if any
    if(issue.isNotEmpty)
      citation+="(${issue})";

    //add pages
    citation+=", ${pages}.";
    return citation;



  }



}


class Web extends Source{
  final String authors,  title,  publication,  year, dateAccessed, url, uid,doi ,pages, type;
  final String docID;

  Web({this.authors, this.title, this.publication, this.year, this.dateAccessed,
      this.url, this.uid, this.doi,this.pages, this.type, this.docID}):super(authors, title,docID);


  var now = DateTime.now();
  Map<String, dynamic> saveToJson()=>{
    'type': "web",
    'title' : title,
    'authors':authors,
    'year':year,
    'date_accessed': dateAccessed,

    'url':url,
    'doi':doi,

    'pages':pages,
    'uid':uid,
    'created_date': now.toString()
  };


  Map<String, dynamic> updateToJson()=>{

    'type': "web",
    'title' : title,
    'authors':authors,
    'year':year,
    'date_accessed': dateAccessed,

    'url':url,
    'doi':doi,

    'pages':pages,
    'uid':uid,

  };


  @override
  String toApa(){

    String citation ="";

    String authorsLine= createAuthorList(authors.split(';'));

    //add authors
    citation="${authorsLine} ";

    //add year
    citation+="(${year}). ";
    //add title
    citation+=" ${title}.";
    //add add url if any

      citation+=" Retrieved ${dateAccessed} from ${url}";

    //add date accessed and publisher
    //citation+=". ${dateAccessed}.";

    return citation;


  }

  @override
  String toHarvard(){
    String citation ="";

    String authorsLine= createAuthorList(authors.split(';'));

    //add authors
    citation="${authorsLine} ";

    //add authors
    citation="${authorsLine} ";

    //add year
    citation+="${year}. ";
    //add title
    citation+="${title}.";
    //add add url if any

    citation+=" Available: ${url}";

    //add date accessed and publisher
    citation+=" [${dateAccessed}].";

    return citation;



  }



}


class TypeConstant{
  static const String book = "book";
  static const String conference_proceeding = "conference proceeding";
  static const String journal_article = "journal article";
  static const String web = "web";
}