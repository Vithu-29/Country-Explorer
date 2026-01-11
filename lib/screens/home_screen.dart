// ignore_for_file: deprecated_member_use

import 'package:country_explorer/controllers/country_controller.dart';
import 'package:country_explorer/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../controllers/theme_controller.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';
import '../widgets/country_tile.dart';
import '../widgets/search_and_filter.dart';
import 'bucket_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final countryController = Get.put(CountryController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: AppColors.darkGrey),
            ),
            Text('Explorer', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        actions: [
          Obx(() {
            return IconButton(
              icon: Icon(
                ThemeController.instance.isDark.value
                    ? Iconsax.sun_1_copy
                    : Iconsax.moon_copy,
              ),
              onPressed: ThemeController.instance.toggleTheme,
            );
          }),
          IconButton(
            onPressed: () => Get.to(() => const BucketListScreen()),
            icon: const Icon(Iconsax.heart_copy),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            SearchAndFilter(),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // Country List
            Expanded(
              child: Obx(() {
                if (countryController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (countryController.countryList.isEmpty) {
                  return const Center(child: Text("No countries found"));
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: countryController.countryList.length,
                  itemBuilder: (context, index) {
                    final country = countryController.countryList[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppSizes.spaceBtwItems,
                      ),
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

void openFilterSheet(BuildContext context) {
  final controller = CountryController.instance;

  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filter by Region",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // Region List
            ...controller.regions.map((region) {
              return Obx(() {
                return RadioListTile<String>(
                  title: Text(region),
                  value: region,
                  groupValue: controller.selectedRegion.value,
                  onChanged: (value) {
                    controller.setRegion(value!);
                    Navigator.pop(context); // close sheet
                  },
                );
              });
            }),
          ],
        ),
      );
    },
  );
}
