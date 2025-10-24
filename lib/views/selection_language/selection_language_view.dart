import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/core/routing/routes_name.dart';
import 'package:tam_tam_app/custom_widgets/custom_button.dart';
import 'package:tam_tam_app/custom_widgets/custom_selection_containers.dart';
part 'cubit/selection_lang_cubit.dart';
part 'cubit/selection_lang_state.dart';

class SelectionLanguageView extends StatelessWidget {
  const SelectionLanguageView({super.key});

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
        child: BlocProvider(
          create: (context) => SelectionLangCubit(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<SelectionLangCubit, SelectionLangState>(
              builder: (context, state) {
                final cubit = context.read<SelectionLangCubit>();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.selectLangImg),
                    Text(
                      'Select Language ',
                      style: AppStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomSelectionContainers(
                      title: 'English',
                      isSelect: cubit.selectedLang == 'English',
                      onTap: () => context
                          .read<SelectionLangCubit>()
                          .onSelectLanguageTap('English'),
                    ),
                    SizedBox(height: 20),
                    CustomSelectionContainers(
                      title: 'Arabic',
                      isSelect: cubit.selectedLang == 'Arabic',
                      onTap: () => context
                          .read<SelectionLangCubit>()
                          .onSelectLanguageTap('Arabic'),
                    ),
                    SizedBox(height: 20),
                    CustomSelectionContainers(
                      title: 'Kurdish',
                      isSelect: cubit.selectedLang == 'Kurdish',
                      onTap: () => context
                          .read<SelectionLangCubit>()
                          .onSelectLanguageTap('Kurdish'),
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.auth);
                      },
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      raduis: 50,
                      text: 'Continue',
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
