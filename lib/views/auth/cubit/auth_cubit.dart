part of '../auth_view.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? selectedAuth = 'Login';
  bool obscureText = true;
  // login controllers
  TextEditingController loginPhoneNumberController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  // sign up controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void onSelectLanguageTap(String lang) {
    selectedAuth = lang;
    emit(AuthInitialUpdateSelectionAuth());
  }

  changeVisibility() {
    obscureText = !obscureText;
    emit(AuthInitialUpdateVisibility());
  }
}
