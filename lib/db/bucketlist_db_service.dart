import 'package:hive_flutter/hive_flutter.dart';
import '../models/country_model.dart';

class BucketListDbService {
  static const String boxName = 'favourites';

  late Box<Country> _favouritesBox;

  /// Initialize Hive and open the box
  Future<void> init() async {
    await Hive.initFlutter();
    _favouritesBox = await Hive.openBox<Country>(boxName);
  }

  /// Get all favourites
  List<Country> getFavourites() {
    return _favouritesBox.values.toList();
  }

  /// Check if country is in favourites
  bool isFavourite(Country country) {
    return _favouritesBox.values.any((c) => c.commonName == country.commonName);
  }

  /// Add a country to favourites
  Future<void> addFavourite(Country country) async {
    await _favouritesBox.add(country);
  }

  /// Remove a country from favourites
  Future<void> removeFavourite(Country country) async {
    final key = _favouritesBox.keys.firstWhere(
      (k) => _favouritesBox.get(k)!.commonName == country.commonName,
      orElse: () => null,
    );

    if (key != null) {
      await _favouritesBox.delete(key);
    }
  }
}
