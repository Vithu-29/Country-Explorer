import 'package:country_explorer/widgets/custom_app_bar.dart';
import 'package:country_explorer/widgets/search_and_filter.dart';
import 'package:flutter/material.dart';

import '../utils/constants/app_sizes.dart';
//import '../widgets/country_tile.dart';

class BucketListScreen extends StatelessWidget {
  const BucketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('My Bucket List'), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            SearchAndFilter(),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppSizes.spaceBtwItems,
                    ),
                    //child: CountryTile(country: ,),
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
