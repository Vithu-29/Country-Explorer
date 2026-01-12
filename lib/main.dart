import 'package:country_explorer/main_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'controllers/favourites_controller.dart';
import 'models/country_model.dart';
import 'models/hive_note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register adapter
  Hive.registerAdapter(CountryAdapter());
  Hive.registerAdapter(NoteAdapter());

  // Open favourites box
  await Hive.openBox<Country>('favourites');

  // Put controller
  Get.put(FavouritesController());

  runApp(const MainApp());
}
