import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/custom_widgets/custom_text_field.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.onSuffixIconTap});
  final void Function()? onSuffixIconTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: Image.asset(AppImages.search),
      label: 'Search anything...',
      // controller: cubit.searchController,
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.blueColor,
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          child: Image.asset(AppImages.filter),
        ),
      ),
      onSuffixIconTap: onSuffixIconTap,
    );
  }
}
