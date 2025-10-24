part of '../auth_view.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? selectedAuth = 'Login';
  bool obscureText = true;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void onSelectLanguageTap(String lang) {
    selectedAuth = lang;
    emit(AuthInitialUpdateSelectionAuth());
  }

  changeVisibility() {
    obscureText = !obscureText;
    emit(AuthInitialUpdateVisibility());
  }
}
