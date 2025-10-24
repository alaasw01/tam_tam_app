part of '../select_language_view.dart';

class InitialAndSelectLangCubit extends Cubit<InitialAndSelectLangState> {
  InitialAndSelectLangCubit() : super(InitialAndSelectLangInitial());
  String? selectedLang;

  void onSelectLanguageTap(String lang) {
    selectedLang = lang;
    emit(InitialAndSelectLangUpdateSelection());
  }
}
