import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';

class Customcategory extends StatelessWidget {
  const Customcategory({
    super.key,
    required this.title,
    this.image,
    this.color,
  });

  final String title;
  final String? image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color ?? const Color(0xffFFF8D0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          /// Makes text flexible in any layout
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.2,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Image.asset(
            image ?? AppImages.category1,
            height: 60,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
