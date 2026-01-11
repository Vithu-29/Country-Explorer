import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../controllers/country_controller.dart';
import '../screens/home_screen.dart';
import '../utils/constants/app_sizes.dart';
import 'container_button.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CountryController.instance;

    return Row(
      children: [
        // Filter Button
        ContainerButton(
          iconData: Iconsax.filter_copy,
          onPressed: () => openFilterSheet(context),
        ),

        const SizedBox(width: AppSizes.spaceBtwItems / 2),

        // Search Field
        Expanded(
          child: TextFormField(
            onChanged: controller.setSearchQuery,
            decoration: InputDecoration(
              hintText: 'Search countries...',
              prefixIcon: const Icon(Iconsax.search_normal_1_copy),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: AppSizes.md),
            ),
          ),
        ),

        const SizedBox(width: AppSizes.spaceBtwItems / 2),

        //  Sort Button
        Obx(() {
          return ContainerButton(
            iconData: controller.isAscending.value
                ? Icons.sort_by_alpha
                : Icons.sort_by_alpha_outlined,
            onPressed: controller.toggleSortOrder,
          );
        }),
      ],
    );
  }
}
