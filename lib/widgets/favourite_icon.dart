import 'package:country_explorer/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favourites_controller.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';

class FavouriteIcon extends StatelessWidget {
  final Country country;
  const FavouriteIcon({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    final favController = Get.find<FavouritesController>();

    return Obx(() {
      // Check if the country exists in the observable list
      final isFav = favController.favouritesList.any(
        (c) => c.commonName == country.commonName,
      );

      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isFav
              ? AppColors.error.withValues(alpha: 0.9)
              : AppColors.white.withValues(alpha: 0.9),
        ),
        child: IconButton(
          onPressed: () => favController.toggleFavourite(country),
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? AppColors.white : AppColors.error,
            size: AppSizes.lg,
          ),
        ),
      );
    });
  }
}
