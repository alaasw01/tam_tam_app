part of '../home_view.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeChangeNavBarIndex extends HomeState {}
