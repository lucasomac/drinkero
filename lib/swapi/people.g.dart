// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      name: json['name'] as String?,
      height: json['height'] as String?,
      mass: json['mass'] as String?,
      hairColor: json['hairColor'] as String?,
      skinColor: json['skinColor'] as String?,
      eyeColor: json['eyeColor'] as String?,
      birthYear: json['birthYear'] as String?,
      gender: json['gender'] as String?,
      homeworld: json['homeworld'] as String?,
      films:
          (json['films'] as List<dynamic>?)?.map((e) => e as String).toList(),
      species:
          (json['species'] as List<dynamic>?)?.map((e) => e as String).toList(),
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      starships: (json['starships'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      created: json['created'] as String?,
      edited: json['edited'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'mass': instance.mass,
      'hairColor': instance.hairColor,
      'skinColor': instance.skinColor,
      'eyeColor': instance.eyeColor,
      'birthYear': instance.birthYear,
      'gender': instance.gender,
      'homeworld': instance.homeworld,
      'films': instance.films,
      'species': instance.species,
      'vehicles': instance.vehicles,
      'starships': instance.starships,
      'created': instance.created,
      'edited': instance.edited,
      'url': instance.url,
    };
