import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

class ApiService {
  static const String _baseUrl =
      "https://restcountries.com/v3.1/all?fields=name,capital,region,population,flags,coatOfArms,timezones,languages";

  Future<List<Country>> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Country> countries = data
            .map((item) => Country.fromJson(item))
            .toList();
        return countries;
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
