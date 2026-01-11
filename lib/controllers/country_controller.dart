import 'package:get/get.dart';
import '../api/api_service.dart';
import '../models/country_model.dart';

class CountryController extends GetxController {
  static CountryController get instance => Get.find<CountryController>();

  final ApiService _apiService = ApiService();

  var isLoading = true.obs;

  // Full list from API
  final allCountries = <Country>[].obs;

  // Filtered + sorted list 
  final countryList = <Country>[].obs;

  // Search & filter states
  final searchQuery = ''.obs;
  final selectedRegion = 'All'.obs;
  final isAscending = true.obs;

  // Region list for filter UI
  final regions = ['All', 'Africa', 'Americas', 'Asia', 'Europe', 'Oceania'];

  @override
  void onInit() {
    super.onInit();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    try {
      isLoading(true);
      final countries = await _apiService.fetchCountries();

      allCountries.assignAll(countries);

      applyFilters(); // initial sort + filter
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Apply search + filter + sort
  void applyFilters() {
    List<Country> tempList = List.from(allCountries);

    // Search filter
    if (searchQuery.value.isNotEmpty) {
      tempList = tempList
          .where(
            (c) => c.commonName.toLowerCase().contains(
              searchQuery.value.toLowerCase(),
            ),
          )
          .toList();
    }

    // Region filter
    if (selectedRegion.value != 'All') {
      tempList = tempList
          .where((c) => c.region == selectedRegion.value)
          .toList();
    }

    // Sort
    tempList.sort((a, b) {
      final cmp = a.commonName.compareTo(b.commonName);
      return isAscending.value ? cmp : -cmp;
    });

    countryList.assignAll(tempList);
  }

  // Called from search field
  void setSearchQuery(String value) {
    searchQuery.value = value;
    applyFilters();
  }

  // Called from region filter
  void setRegion(String region) {
    selectedRegion.value = region;
    applyFilters();
  }

  // Toggle sort
  void toggleSortOrder() {
    isAscending.toggle();
    applyFilters();
  }
}
