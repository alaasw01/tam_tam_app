import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/custom_widgets/custom_text_field.dart';

part 'cubit/profile_cubit.dart';
part 'cubit/profile_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Profile',
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final cubit = context.read<ProfileCubit>();
            return SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Name'),
                  CustomTextFormField(
                    hint: 'Sara T@wfik',
                    suffixIcon: Icon(
                      Icons.edit_outlined,
                      color: AppColors.blueColor,
                      size: 20,
                    ),
                    controller: cubit.nameController,
                  ),
                  const SizedBox(height: 20),

                  _buildLabel('Phone Number'),
                  CustomTextFormField(
                    hint: '01234567890',
                    suffixIcon: Icon(
                      Icons.edit_outlined,
                      color: AppColors.blueColor,
                      size: 20,
                    ),
                    keyboardType: TextInputType.phone,
                    controller: cubit.phoneController,
                  ),
                  const SizedBox(height: 20),

                  _buildLabel('Email'),
                  CustomTextFormField(
                    hint: 'Saratwfik@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit_outlined,
                      color: AppColors.blueColor,
                      size: 20,
                    ),
                    controller: cubit.emailController,
                  ),
                  const SizedBox(height: 20),

                  _buildLabel('Password'),
                  CustomTextFormField(
                    hint: '•••••••',
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: Icon(
                      Icons.edit_outlined,
                      color: AppColors.blueColor,
                      size: 20,
                    ),
                    controller: cubit.passwordController,
                  ),
                  const SizedBox(height: 20),

                  _buildLabel('Language'),
                  const SizedBox(height: 10),
                  // Language Dropdown
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(12),
                      // border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ExpansionTile(
                      backgroundColor: Colors.white,
                      tilePadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: Text(
                        cubit.selectedLanguage,
                        style: AppStyles.textStyle18.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.blueColor,
                        size: 30,
                      ),
                      children: cubit.languages.map((lang) {
                        return ListTile(
                          dense: true,
                          onTap: () => cubit.changeLanguage(lang),
                          title: Text(
                            lang,
                            style: AppStyles.textStyle16.copyWith(
                              color: lang == cubit.selectedLanguage
                                  ? AppColors.blueColor
                                  : Colors.black87,
                            ),
                          ),
                          trailing: Icon(
                            Icons.check_circle_outline_rounded,
                            color: lang == cubit.selectedLanguage
                                ? AppColors.blueColor
                                : Colors.grey.shade300,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLabel(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      title,
      style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.w700),
    ),
  );
}
