part of '../profile_view.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLanguageChanged extends ProfileState {}
