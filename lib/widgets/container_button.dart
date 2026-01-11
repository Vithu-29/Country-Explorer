import 'package:flutter/material.dart';

import '../utils/constants/app_colors.dart';
import '../utils/constants/app_sizes.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    this.buttonSize = 52,
    this.borderRadius = AppSizes.borderRadiusMd,
    this.borderColor = AppColors.borderPrimary,
    required this.iconData,
    required this.onPressed,
  });

  final double buttonSize;
  final double borderRadius;
  final Color borderColor;
  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor),
      ),
      child: IconButton(icon: Icon(iconData), onPressed: onPressed),
    );
  }
}
