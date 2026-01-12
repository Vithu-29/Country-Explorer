import 'package:country_explorer/widgets/custom_app_bar.dart';
import 'package:country_explorer/widgets/search_and_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favourites_controller.dart';
import '../utils/constants/app_sizes.dart';
import '../widgets/country_tile.dart';

class BucketListScreen extends StatelessWidget {
  const BucketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favController = FavouritesController.instance;
    return Scaffold(
      appBar: CustomAppBar(title: Text('My Bucket List'), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            SearchAndFilter(controller: favController),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Expanded(
              child: Obx(() {
                if (favController.favouritesList.isEmpty) {
                  return const Center(child: Text("No favourites added"));
                }
                return ListView.builder(
                  itemCount: favController.favouritesList.length,
                  itemBuilder: (context, index) {
                    final country = favController.favouritesList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CountryTile(country: country),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
