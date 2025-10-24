part of '../selection_language_view.dart';

@immutable
sealed class SelectionLangState {}

final class SelectionLangInitial extends SelectionLangState {}

final class InitialAndSelectLangUpdateSelection extends SelectionLangState {}
