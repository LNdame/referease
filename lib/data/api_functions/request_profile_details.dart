import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/model/user_model.dart';
import '../profile_api_service.dart';

Future<Response<UserModel>> profileDetailsRequest(context) async {
  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  print("bearer is in add $bearer");
  final response = await Provider.of<ProfileApiService>(context)
      .profileDetailsRequest(bearer);
  return response;
}
