part of '../home_view.dart';

@immutable
sealed class HomeState {
  final bool isDrawerOpen;
  const HomeState({this.isDrawerOpen = false});
}

final class HomeInitial extends HomeState {}

final class HomeChangeNavBarIndex extends HomeState {}

final class HomeChangeSelectedAge extends HomeState {}

final class HomeChangeSelectedGender extends HomeState {}

final class HomeChangeSelectedPrice extends HomeState {}

final class HomeDrawerToggled extends HomeState {
  const HomeDrawerToggled({required super.isDrawerOpen});
}
