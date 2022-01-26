import 'package:dio/dio.dart';
import 'package:drinkero/swapi/people.dart';
import 'package:drinkero/swapi/swapi_client.dart';

class PeopleController {
  final Dio _dio = Dio(); // Provide a dio instance
  late SwapiClient _client;

  PeopleController() {
    _dio.options.contentType = "application/json";
    _client = SwapiClient(_dio);
  }

  Future<People>? getDrinksByCaracter(String id) {
    return _client.getPeopleById(id);
  }
}
