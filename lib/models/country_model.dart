class Country {
  final String commonName;
  final List<String> capital;
  final String region;
  final int population;
  final String flagPng;
  final String? coatOfArmsPng;
  final List<String> timezones;
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
