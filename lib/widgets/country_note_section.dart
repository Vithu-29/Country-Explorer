import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';

class CountryNoteSection extends StatelessWidget {
  const CountryNoteSection({
    super.key,
    this.hasNote = true,
    this.isEditing = true,
  });

  final bool hasNote;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    // If no note yet
    if (!hasNote && !isEditing) {
      return Center(
        child: OutlinedButton.icon(
          icon: const Icon(Icons.note_add),
          label: const Text("Add Note"),
          onPressed: () {},
        ),
      );
    }

    // Editor or Viewer
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Your Note", style: Theme.of(context).textTheme.titleLarge),
            Row(
              children: [
                if (!isEditing && hasNote)
                  IconButton(onPressed: () {}, icon: Icon(Iconsax.edit_copy)),

                if (isEditing)
                  IconButton(onPressed: () {}, icon: Icon(Iconsax.save_2_copy)),

                const SizedBox(width: AppSizes.spaceBtwItems / 4),

                if (hasNote)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: AppColors.error),
                  ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        TextField(
          maxLines: 5,
          readOnly: !isEditing,
          decoration: InputDecoration(
            hintText: "Write something about this country...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
            ),
          ),
        ),
      ],
    );
  }
}
