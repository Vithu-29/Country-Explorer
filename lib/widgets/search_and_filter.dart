// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../controllers/base_country_controller.dart';
import '../utils/constants/app_sizes.dart';
import 'container_button.dart';

class SearchAndFilter<T extends BaseCountryController> extends StatelessWidget {
  const SearchAndFilter({super.key, required this.controller});

  final T controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Filter Button
        ContainerButton(
          iconData: Iconsax.filter_copy,
          onPressed: () => openFilterSheet(context, controller),
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

void openFilterSheet<T extends BaseCountryController>(
  BuildContext context,
  T controller,
) {
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
