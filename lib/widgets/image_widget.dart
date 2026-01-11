import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utils/constants/app_sizes.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.borderRadius = AppSizes.md,
  });

  final double? height, width;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        child: Image(
          image: isNetworkImage
              ? CachedNetworkImageProvider(imageUrl)
              : AssetImage(imageUrl) as ImageProvider,
          fit: fit,
        ),
      ),
    );
  }
}
