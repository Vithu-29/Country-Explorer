import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';
import '../utils/helpers/helper_functions.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: dark
            ? AppColors.black.withValues(alpha: 0.9)
            : AppColors.white.withValues(alpha: 0.9),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Iconsax.heart, color: AppColors.error, size: AppSizes.lg),
      ),
    );
  }
}
