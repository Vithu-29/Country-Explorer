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
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppSizes.spaceBtwItems,
                    ),
                    child: CountryTile(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void openFilterSheet(BuildContext context) {
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
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Apply"),
              ),
            ),
          ],
        ),
      );
    },
  );
}
