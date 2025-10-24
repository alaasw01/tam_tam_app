import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/core/routing/routes_name.dart';
import 'package:tam_tam_app/custom_widgets/custom_button.dart';
import 'package:tam_tam_app/custom_widgets/custom_selection_containers.dart';
import 'package:tam_tam_app/custom_widgets/custom_text_field.dart';
part '../auth/cubit/auth_cubit.dart';
part '../auth/cubit/auth_state.dart';
part 'widgets/login_body.dart';
part 'widgets/sing_up_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

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
          create: (context) => AuthCubit(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final cubit = context.read<AuthCubit>();
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(AppImages.auth),
                      Text(
                        'Come and Join us',
                        style: AppStyles.textStyle20.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'We are pleased to have you join us.',
                        style: AppStyles.textStyle14,
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSelectionContainers(
                            title: 'Login',
                            width: 150,
                            isSelect: cubit.selectedAuth == 'Login',
                            onTap: () => context
                                .read<AuthCubit>()
                                .onSelectLanguageTap('Login'),
                          ),
                          CustomSelectionContainers(
                            title: 'Sign up',
                            width: 150,
                            isSelect: cubit.selectedAuth == 'Sign up',
                            onTap: () => context
                                .read<AuthCubit>()
                                .onSelectLanguageTap('Sign up'),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      cubit.selectedAuth == 'Login'
                          ? LoginBody(cubit: cubit)
                          : SignUpBody(cubit: cubit),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
