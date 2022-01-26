import 'package:drinkero/model/drink.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_drinks.g.dart';

@JsonSerializable()
class ResponseDrinks {
  List<Drink>? drinks;

  ResponseDrinks({required this.drinks});

  factory ResponseDrinks.fromJson(Map<String, dynamic> json) =>
      _$ResponseDrinksFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDrinksToJson(this);
}
