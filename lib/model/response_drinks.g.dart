// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_drinks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDrinks _$ResponseDrinksFromJson(Map<String, dynamic> json) =>
    ResponseDrinks(
      drinks: (json['drinks'] as List<dynamic>?)
          ?.map((e) => Drink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDrinksToJson(ResponseDrinks instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };
