
class LoginModel{
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  LoginModel({this.accessToken, this.refreshToken, this.user});

  LoginModel.fromJson(Map<String, dynamic> json)
    :accessToken =json['access_token'],
        refreshToken = json['refresh_token'],
        user = UserModel.fromJson(json['user'])
  ;


//  LoginModel.fromJson(Map<String, dynamic> json)  user = UserModel.fromJson(json['user'])
//    :accessToken =json['access_token'],
//        refreshToken = json['refresh_token'],
//        user = _toObject(json['user'], (e)=> UserModel.fromJson(e))
//  ;
  Map<String, dynamic>toJson()=>{
    'access_token':accessToken,
    'refresh_token':refreshToken,
    'user': user.toJson()
  };


 static T _toObject<T>(user, T Function(Map<String, dynamic>) fromJson){
    if(user==null){
      return null;
    }
    return fromJson(user as Map<String, dynamic>);
  }


}



class UserModel{
   final int id;
   final String username;
   final String password;

   UserModel({this.id, this.username, this.password});

   UserModel.fromJson(Map<String, dynamic>json)
    :id = json['id'],
   username = json['username'],
   password= json['password'];

   Map<String, dynamic>toJson()=>
       {
         'id':id,
         'username':username,
         'password': password
       };

}