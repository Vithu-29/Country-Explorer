import 'package:country_explorer/utils/helpers/helper_functions.dart';
import 'package:country_explorer/widgets/custom_app_bar.dart';
import 'package:country_explorer/widgets/favourite_icon.dart';
import 'package:country_explorer/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';
import '../widgets/country_note_section.dart';

class CountryDetailsScreen extends StatelessWidget {
  const CountryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    //  Dummy Data
    final name = "Sri Lanka";
    final capital = 'Colombo';
    final region = "Asia";
    final flagUrl = "https://flagcdn.com/w320/lk.png";
    final population = "21,500,000";
    final timezones = "UTC+05:30";
    final languages = "Sinhala, Tamil, English";
    final coatOfArmsUrl =
        "https://www.gov.lk/assets/images/country_overview/Emblem_of_Sri_Lanka.png";

    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Sri Lanka"),
        showBackArrow: true,
        actions: [FavouriteIcon()],
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
              imageUrl: flagUrl,
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
                Text(name, style: Theme.of(context).textTheme.headlineMedium),
                ImageWidget(
                  imageUrl: coatOfArmsUrl,
                  height: 60,
                  isNetworkImage: true,
                  applyImageRadius: false,
                ),
              ],
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // 📄 Info Card
            _infoRow("Capital", capital),
            _infoRow("Region", region),
            _infoRow("Population", population),
            _infoRow("Timezones", timezones),
            _infoRow("Languages", languages),

            const SizedBox(height: AppSizes.spaceBtwSections),

            // 📝 Notes Section
            CountryNoteSection(),
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
