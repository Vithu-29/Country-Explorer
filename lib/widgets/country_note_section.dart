import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CountryNoteSection extends StatelessWidget {
  const CountryNoteSection({super.key, required this.countryName});

  final String countryName;

  @override
  Widget build(BuildContext context) {
    final controller = NoteController.instance;
    controller.loadNoteForCountry(countryName);

    return Obx(() {
      if (!controller.hasNote.value && !controller.isEditing.value) {
        return Center(
          child: OutlinedButton.icon(
            icon: const Icon(Icons.note_add),
            label: const Text("Add Note"),
            onPressed: () => controller.setEditing(true),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Note", style: Theme.of(context).textTheme.titleLarge),
              Row(
                children: [
                  if (!controller.isEditing.value && controller.hasNote.value)
                    IconButton(
                      onPressed: () => controller.setEditing(true),
                      icon: const Icon(Iconsax.edit_copy),
                    ),
                  if (controller.isEditing.value)
                    IconButton(
                      onPressed: () => controller.saveNote(),
                      icon: const Icon(Iconsax.save_2_copy),
                    ),
                  const SizedBox(width: AppSizes.spaceBtwItems / 4),
                  if (controller.hasNote.value)
                    IconButton(
                      onPressed: () => controller.deleteNote(),
                      icon: Icon(Icons.delete, color: AppColors.error),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          TextField(
            maxLines: 5,
            readOnly: !controller.isEditing.value,
            controller: controller.textController,
            decoration: InputDecoration(
              hintText: "Write something about this country...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
              ),
            ),
          ),
        ],
      );
    });
  }
}
