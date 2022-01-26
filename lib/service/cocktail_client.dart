import 'package:dio/dio.dart';
import 'package:drinkero/model/response_drinks.dart';
import 'package:retrofit/retrofit.dart';

part 'cocktail_client.g.dart';

@RestApi(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1")
abstract class CocktailClient {
  factory CocktailClient(Dio dio, {String baseUrl}) = _CocktailClient;

  @GET("/search.php")
  Future<ResponseDrinks> getDrinksByName(@Query("f") String f);
}
