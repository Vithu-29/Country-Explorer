import 'package:country_explorer/controllers/base_country_controller.dart';
import 'package:get/get.dart';

import '../db/bucketlist_db_service.dart';
import '../models/country_model.dart';
import '../utils/helpers/loaders.dart';

class FavouritesController extends GetxController
    implements BaseCountryController {
  static FavouritesController get instance => Get.find();

  final BucketListDbService _dbService = BucketListDbService();

  var favouritesList = <Country>[].obs;

  @override
  RxList<Country> get list => favouritesList;

  @override
  final searchQuery = ''.obs;

  @override
  final selectedRegion = 'All'.obs;

  @override
  final isAscending = true.obs;

  @override
  List<String> get regions => [
    'All',
    'Africa',
    'Americas',
    'Asia',
    'Europe',
    'Oceania',
  ];

  @override
  void onInit() async {
    super.onInit();
    await _dbService.init();
    loadFavourites();
  }

  void loadFavourites() {
    favouritesList.assignAll(_dbService.getFavourites());
    applyFilters();
  }

  bool isFavourite(Country country) => _dbService.isFavourite(country);

  void toggleFavourite(Country country) async {
    if (isFavourite(country)) {
      await _dbService.removeFavourite(country);
      Loaders.customToast(
        message: 'Country has been removed from the Bucket List.',
      );
    } else {
      await _dbService.addFavourite(country);
      Loaders.customToast(
        message: 'Country has been added to the Bucket List.',
      );
    }
    loadFavourites();
  }

  @override
  void applyFilters() {
    var temp = List<Country>.from(_dbService.getFavourites());

    if (searchQuery.value.isNotEmpty) {
      temp = temp
          .where(
            (c) => c.commonName.toLowerCase().contains(
              searchQuery.value.toLowerCase(),
            ),
          )
          .toList();
    }

    if (selectedRegion.value != 'All') {
      temp = temp.where((c) => c.region == selectedRegion.value).toList();
    }

    temp.sort(
      (a, b) => isAscending.value
          ? a.commonName.compareTo(b.commonName)
          : b.commonName.compareTo(a.commonName),
    );

    favouritesList.assignAll(temp);
  }

  @override
  void setSearchQuery(String value) {
    searchQuery.value = value;
    applyFilters();
  }

  @override
  void setRegion(String region) {
    selectedRegion.value = region;
    applyFilters();
  }

  @override
  void toggleSortOrder() {
    isAscending.toggle();
    applyFilters();
  }
}
