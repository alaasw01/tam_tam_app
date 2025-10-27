part of '../auth_view.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key, required this.cubit});

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          // hint: 'Enter Phone Number',
          label: 'phone nubmer',
          keyboardType: TextInputType.phone,
          controller: cubit.loginPhoneNumberController,
        ),
        SizedBox(height: 30),
        Text(
          'Password',
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          obscureText: cubit.obscureText,
          suffixIcon: cubit.obscureText == true
              ? Icon(Icons.visibility_off, color: AppColors.blueColor)
              : Icon(Icons.visibility, color: AppColors.blueColor),

          onSuffixIconTap: cubit.changeVisibility,
          label: 'Password',
          keyboardType: TextInputType.visiblePassword,
          controller: cubit.loginPasswordController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Forget Password?',
              style: AppStyles.textStyle14.copyWith(color: AppColors.blueColor),
            ),
          ],
        ),
        SizedBox(height: 20),
        Center(
          child: CustomButton(
            width: MediaQuery.sizeOf(context).width * 0.8,
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.navBar);
            },
            raduis: 50,
            text: 'Login',
          ),
        ),
        SizedBox(height: 15),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'By Login in means agreeing to the ',
            style: AppStyles.textStyle18.copyWith(color: AppColors.greyColor),
            children: [
              TextSpan(
                text: 'terms ',
                style: AppStyles.textStyle18.copyWith(
                  color: AppColors.blueColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint('Terms tapped');
                  },
              ),
              TextSpan(
                text: 'and ',
                style: AppStyles.textStyle18.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
              TextSpan(
                text: 'conditions.',
                style: AppStyles.textStyle18.copyWith(
                  color: AppColors.blueColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint('Conditions tapped');
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
