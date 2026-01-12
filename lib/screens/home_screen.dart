// ignore_for_file: deprecated_member_use

import 'package:country_explorer/controllers/country_controller.dart';
import 'package:country_explorer/widgets/country_shimmer.dart';
import 'package:country_explorer/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../controllers/theme_controller.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';
import '../widgets/country_tile.dart';
import '../widgets/offline_error_widget.dart';
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
            SearchAndFilter(controller: countryController),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // Country List
            Expanded(
              child: Obx(() {
                if (countryController.isLoading.value) {
                  return CountryShimmer();
                }

                if (countryController.isOffline.value) {
                  return OfflineErrorWidget(
                    onRetry: countryController.fetchCountries,
                  );
                }

                if (countryController.countryList.isEmpty) {
                  return const Center(child: Text("No countries found"));
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    await countryController.fetchCountries();
                  },
                  child: ListView.builder(
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
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
