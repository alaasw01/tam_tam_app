import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/views/home/home_view.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: Center(child: cubit.screens[cubit.selectedIndex]),
            bottomNavigationBar: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(cubit.navItems.length, (index) {
                  if (index == 2) {
                    return Transform.translate(
                      offset: const Offset(10, -20),
                      child: GestureDetector(
                        onTap: () => cubit.changeNavBarIndex(index),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: cubit.selectedIndex == index
                                  ? AppColors.blueColor
                                  : AppColors.greyColor,
                              child: Image.asset(
                                cubit.navItems[index]['icon'],
                                height: 26,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            if (cubit.selectedIndex == index)
                              Text(
                                cubit.navItems[index]['label'],
                                style: AppStyles.textStyle14.copyWith(
                                  fontSize: 12,
                                  color: AppColors.blueColor,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }

                  return GestureDetector(
                    onTap: () => cubit.changeNavBarIndex(index),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Image.asset(
                          cubit.navItems[index]['icon'],
                          height: 26,
                          color: cubit.selectedIndex == index
                              ? AppColors.blueColor
                              : AppColors.greyColor,
                        ),
                        const SizedBox(height: 4),
                        if (cubit.selectedIndex == index)
                          Text(
                            cubit.navItems[index]['label'],
                            style: AppStyles.textStyle14.copyWith(
                              fontSize: 12,
                              color: AppColors.blueColor,
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
