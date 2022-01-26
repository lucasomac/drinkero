import 'package:dio/dio.dart';

import '../model/response_drinks.dart';
import '../service/cocktail_client.dart';

class DrinkController {
  final Dio _dio = Dio(); // Provide a dio instance
  late CocktailClient _client;

  DrinkController() {
    _dio.options.contentType = "application/json";
    _client = CocktailClient(_dio);
  }

  Future<ResponseDrinks>? getDrinksByCaracter(String letra) {
    return _client.getDrinksByName(letra);
  }
}
