import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool? isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double? raduis;

  const CustomButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
    this.width,
    this.raduis,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueColor,
        minimumSize: Size(width ?? 150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(raduis ?? 10),
        ),
      ),
      child: isLoading == true
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.red,
              ),
            )
          : Text(
              text,
              style: AppStyles.textStyle18.copyWith(color: Colors.white),
            ),
    );
  }
}
