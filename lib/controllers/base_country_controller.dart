import 'package:get/get.dart';
import '../models/country_model.dart';

abstract class BaseCountryController extends GetxController {
  RxList<Country> get list;
  RxString get searchQuery;
  RxString get selectedRegion;
  RxBool get isAscending;

  List<String> get regions;

  void applyFilters();
  void setSearchQuery(String value);
  void setRegion(String region);
  void toggleSortOrder();
}
