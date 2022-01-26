import 'package:dio/dio.dart';
import 'package:drinkero/swapi/people.dart';
import 'package:retrofit/retrofit.dart';

part 'swapi_client.g.dart';

@RestApi(baseUrl: "https://swapi.dev/api")
abstract class SwapiClient {
  factory SwapiClient(Dio dio, {String baseUrl}) = _SwapiClient;

  @GET("/people/{id}")
  Future<People> getPeopleById(@Path("id") String id);
}
