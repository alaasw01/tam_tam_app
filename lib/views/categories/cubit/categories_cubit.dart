part of '../categories_view.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  final List<Map<String, dynamic>> categories = [
    {
      'image': AppImages.category2,
      'title': 'Ride-on and scooters',
      'color': Color(0xffD2F1FF),
    },
    {
      'image': AppImages.category1,
      'title': 'Play Sets',
      'color': Color(0xffFFF8D0),
    },
    {
      'image': AppImages.category2,
      'title': 'Ride-on and scooters',
      'color': Color(0xffD2F1FF),
    },
    {
      'image': AppImages.category1,
      'title': 'Play Sets',
      'color': Color(0xffFFF8D0),
    },
    {
      'image': AppImages.category2,
      'title': 'Ride-on and scooters',
      'color': Color(0xffD2F1FF),
    },
    {
      'image': AppImages.category1,
      'title': 'Play Sets',
      'color': Color(0xffFFF8D0),
    },
    {
      'image': AppImages.category2,
      'title': 'Ride-on and scooters',
      'color': Color(0xffD2F1FF),
    },
    {
      'image': AppImages.category1,
      'title': 'Play Sets',
      'color': Color(0xffFFF8D0),
    },
    {
      'image': AppImages.category1,
      'title': 'Play Sets',
      'color': Color(0xffFFF8D0),
    },
    {
      'image': AppImages.category1,
      'title': 'Play Sets',
      'color': Color(0xffFFF8D0),
    },
  ];
}
