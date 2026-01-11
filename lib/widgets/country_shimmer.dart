import 'package:country_explorer/widgets/shimmer_effect_loader.dart';
import 'package:flutter/material.dart';

import '../utils/constants/app_sizes.dart';

class CountryShimmer extends StatelessWidget {
  const CountryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
            ),
            child: Row(
              children: [
                // Flag Container
                ShimmerEffectLoader(
                  width: 120,
                  height: 90,
                  radius: AppSizes.borderRadiusLg,
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
                        ShimmerEffectLoader(width: 150, height: 10),

                        const SizedBox(height: AppSizes.sm),

                        // Capital
                        ShimmerEffectLoader(width: 140, height: 10),

                        const SizedBox(height: AppSizes.xs),

                        // Region
                        ShimmerEffectLoader(width: 130, height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
