import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/core/routing/routes_name.dart';
import 'package:tam_tam_app/custom_widgets/custom_button.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            stops: [0.2, 0.45],
            end: Alignment.bottomCenter,
            colors: [AppColors.yellowColor, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.initImg),
              SizedBox(height: 50),
              Text(
                'Play makes better humans',
                style: AppStyles.textStyle20.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                'Brose and choose from thousands of toy. Every child deserve to play !',
                style: TextStyle(color: AppColors.greyColor),
              ),
              SizedBox(height: 60),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.selectLang);
                },
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
