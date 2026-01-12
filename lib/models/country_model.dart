import 'package:hive/hive.dart';

part 'country_model.g.dart'; // <-- for code generation

@HiveType(typeId: 0)
class Country extends HiveObject {
  @HiveField(0)
  final String commonName;

  @HiveField(1)
  final List<String> capital;

  @HiveField(2)
  final String region;

  @HiveField(3)
  final int population;

  @HiveField(4)
  final String flagPng;

  @HiveField(5)
  final String? coatOfArmsPng;

  @HiveField(6)
  final List<String> timezones;

  @HiveField(7)
  final Map<String, String>? languages;

  Country({
    required this.commonName,
    required this.capital,
    required this.region,
    required this.population,
    required this.flagPng,
    required this.coatOfArmsPng,
    required this.timezones,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      commonName: json['name']['common'] ?? '',
      capital: json['capital'] != null
          ? List<String>.from(json['capital'])
          : [],
      region: json['region'] ?? '',
      population: json['population'] ?? 0,
      flagPng: json['flags']['png'] ?? '',
      coatOfArmsPng: json['coatOfArms']['png'],
      timezones: json['timezones'] != null
          ? List<String>.from(json['timezones'])
          : [],
      languages: json['languages'] != null
          ? Map<String, String>.from(json['languages'])
          : null,
    );
  }
}
