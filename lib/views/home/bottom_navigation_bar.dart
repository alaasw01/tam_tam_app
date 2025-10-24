import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/views/home/home_view.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return PersistentTabView(
            context,
            controller: cubit.controller,
            screens: cubit.buildScreens(),
            items: cubit.navBarsItems(),
            padding: const EdgeInsets.all(5),
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,

            hideNavigationBarWhenKeyboardAppears: true,
            decoration: NavBarDecoration(
              border: BoxBorder.all(color: AppColors.greyColor, width: 1.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              colorBehindNavBar: Colors.white,
            ),
            navBarHeight: kBottomNavigationBarHeight + 10,
            navBarStyle: NavBarStyle.style15, // floating center button
          );
        },
      ),
    );
  }
}
