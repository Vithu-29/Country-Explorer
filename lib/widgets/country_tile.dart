import 'package:country_explorer/utils/helpers/helper_functions.dart';
import 'package:country_explorer/widgets/favourite_icon.dart';
import 'package:country_explorer/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/country_detail_screen.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';

class CountryTile extends StatelessWidget {
  const CountryTile({super.key});

  final String imageUrl = 'https://flagcdn.com/w320/lk.png';
  final String name = 'Sri Lanka';
  final String capital = 'Colombo';
  final String region = 'Asia';

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return InkWell(
      onTap: () => Get.to(() => CountryDetailsScreen()),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
          color: dark ? AppColors.darkerGrey : AppColors.softGrey,
        ),
        child: Row(
          children: [
            // Flag Container
            Container(
              height: 90,
              width: 120,
              padding: const EdgeInsets.all(AppSizes.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                color: dark ? AppColors.dark : AppColors.light,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ImageWidget(
                      imageUrl: imageUrl,
                      isNetworkImage: true,
                      applyImageRadius: false,
                    ),
                  ),

                  Positioned(top: 0, right: 0, child: FavouriteIcon()),
                ],
              ),
            ),

            const SizedBox(width: AppSizes.defaultSpace / 2),

            // Country Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Country Name
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: AppSizes.sm),

                    // Capital
                    Text(
                      'Capital: $capital',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: AppSizes.xs),

                    // Region
                    Text(
                      'Region: $region',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
