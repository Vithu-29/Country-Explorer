import 'package:country_explorer/utils/helpers/helper_functions.dart';
import 'package:country_explorer/widgets/custom_app_bar.dart';
import 'package:country_explorer/widgets/favourite_icon.dart';
import 'package:country_explorer/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import '../models/country_model.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';
import '../widgets/country_note_section.dart';

class CountryDetailsScreen extends StatelessWidget {
  const CountryDetailsScreen({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(country.commonName),
        showBackArrow: true,
        actions: [FavouriteIcon(country: country)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              padding: EdgeInsets.all(AppSizes.sm),
              border: Border.all(
                color: dark ? AppColors.darkerGrey : AppColors.grey,
              ),
              imageUrl: country.flagPng,
              isNetworkImage: true,
              width: double.infinity,
              borderRadius: 0,
              applyImageRadius: false,
            ),

            const SizedBox(height: AppSizes.spaceBtwSections),

            // Country Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    country.commonName,
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (country.coatOfArmsPng != null &&
                    country.coatOfArmsPng!.isNotEmpty)
                  ImageWidget(
                    imageUrl: country.coatOfArmsPng!,
                    height: 60,
                    width: 60,
                    isNetworkImage: true,
                    applyImageRadius: false,
                  ),
              ],
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // Info Card
            _infoRow("Capital", country.capital.join(', ')),
            _infoRow("Region", country.region),
            _infoRow("Population", country.population.toString()),
            _infoRow("Timezones", country.timezones.join(', ')),
            _infoRow(
              "Languages",
              country.languages != null
                  ? country.languages!.values.join(', ')
                  : '',
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            // Notes Section
            CountryNoteSection(countryName: country.commonName),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              "$title:",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
