part of '../auth_view.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key, required this.cubit});

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(label: 'Name', controller: cubit.nameController),
        SizedBox(height: 15),
        CustomTextFormField(
          label: 'Date Of Birth',
          suffixIcon: Icons.calendar_today_rounded,
          controller: cubit.birthDateController,
        ),
        SizedBox(height: 15),
        CustomTextFormField(
          label: 'Phone Number',
          keyboardType: TextInputType.phone,
          controller: cubit.phoneNumberController,
        ),
        SizedBox(height: 15),
        CustomTextFormField(
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: cubit.emailController,
        ),
        SizedBox(height: 15),
        CustomTextFormField(
          label: 'Password',
          onSuffixIconTap: cubit.changeVisibility,
          obscureText: cubit.obscureText,
          suffixIcon: cubit.obscureText == true
              ? Icons.visibility_off
              : Icons.visibility,
          keyboardType: TextInputType.visiblePassword,
          controller: cubit.passwordController,
        ),
        SizedBox(height: 15),
        CustomTextFormField(
          label: 'Confirm Password',
          keyboardType: TextInputType.visiblePassword,
          controller: cubit.confirmPasswordController,
        ),
        SizedBox(height: 20),
        Center(
          child: CustomButton(
            width: MediaQuery.sizeOf(context).width * 0.8,
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.navBar);
            },
            raduis: 50,
            text: 'Sign Up',
          ),
        ),
      ],
    );
  }
}
