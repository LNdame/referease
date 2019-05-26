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
