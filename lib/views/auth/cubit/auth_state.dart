part of '../auth_view.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthInitialUpdateSelectionAuth extends AuthState {}

final class AuthInitialUpdateVisibility extends AuthState {}
