part of '../select_language_view.dart';

@immutable
sealed class InitialAndSelectLangState {}

final class InitialAndSelectLangInitial extends InitialAndSelectLangState {}

final class InitialAndSelectLangUpdateSelection
    extends InitialAndSelectLangState {}
