import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/core/routing/routes_name.dart';
import 'package:tam_tam_app/custom_widgets/custom_button.dart';
import 'package:tam_tam_app/custom_widgets/custom_selection_containers.dart';
part '../initial_and_select_lang/cubit/initial_and_select_lang_cubit.dart';
part '../initial_and_select_lang/cubit/initial_and_select_lang_state.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

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
          create: (context) => InitialAndSelectLangCubit(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                BlocBuilder<
                  InitialAndSelectLangCubit,
                  InitialAndSelectLangState
                >(
                  builder: (context, state) {
                    final cubit = context.read<InitialAndSelectLangCubit>();
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
                              .read<InitialAndSelectLangCubit>()
                              .onSelectLanguageTap('English'),
                        ),
                        SizedBox(height: 20),
                        CustomSelectionContainers(
                          title: 'Arabic',
                          isSelect: cubit.selectedLang == 'Arabic',
                          onTap: () => context
                              .read<InitialAndSelectLangCubit>()
                              .onSelectLanguageTap('Arabic'),
                        ),
                        SizedBox(height: 20),
                        CustomSelectionContainers(
                          title: 'Kurdish',
                          isSelect: cubit.selectedLang == 'Kurdish',
                          onTap: () => context
                              .read<InitialAndSelectLangCubit>()
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
