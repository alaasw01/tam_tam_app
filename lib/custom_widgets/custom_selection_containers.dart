import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_style.dart';

class CustomSelectionContainers extends StatelessWidget {
  const CustomSelectionContainers({
    super.key,
    required this.title,
    this.onTap,
    this.isSelect,
    this.width,
  });
  final String title;
  final void Function()? onTap;
  final bool? isSelect;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width ?? MediaQuery.sizeOf(context).width * 0.6,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelect == true ? const Color(0xFFCCF0FF) : Colors.white,
          border: Border.all(
            color: isSelect == true ? AppColors.blueColor : AppColors.greyColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: AppStyles.textStyle16.copyWith(
            color: isSelect == true ? AppColors.blueColor : AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
