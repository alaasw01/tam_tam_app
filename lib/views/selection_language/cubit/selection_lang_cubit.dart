part of '../selection_language_view.dart';

class SelectionLangCubit extends Cubit<SelectionLangState> {
  SelectionLangCubit() : super(SelectionLangInitial());
  String? selectedLang;

  void onSelectLanguageTap(String lang) {
    selectedLang = lang;
    emit(InitialAndSelectLangUpdateSelection());
  }
}
