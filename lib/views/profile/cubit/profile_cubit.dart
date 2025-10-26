part of '../profile_view.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final List<String> languages = ['English', 'Arabic', 'Kurdish'];
  String selectedLanguage = 'English';

  void changeLanguage(String lang) {
    selectedLanguage = lang;
    // Navigator.pop(AppConstants.navigatorKey.currentContext!);
    emit(ProfileLanguageChanged());
  }

  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
