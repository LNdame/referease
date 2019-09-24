
import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:referease/data/built_value_converter.dart';
import 'package:referease/model/source_type.dart';
import 'dart:async';

part 'source_type_api_service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class SourceTypeApiService extends ChopperService{
//
  @Get(path:'source_types')
 Future<Response<BuiltList<SourceType>>> getSourceTypes();

  @Get(path: 'source_type/{name}')
  Future<Response<SourceType>> getSourceType(@Path('name') String name);

  static SourceTypeApiService create() {
    final client = ChopperClient(
      baseUrl:  "https://referease-api.herokuapp.com",
      services: [
        _$SourceTypeApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$SourceTypeApiService(client);
  }
}