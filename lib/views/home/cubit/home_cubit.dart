part of '../home_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int selectedIndex = 2;
  TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> navItems = [
    {'icon': AppImages.offers, 'label': 'Offers'},
    {'icon': AppImages.cart, 'label': 'Cart'},
    {'icon': AppImages.home, 'label': 'Home'},
    {'icon': AppImages.categories, 'label': 'Categories'},
    {'icon': AppImages.profile, 'label': 'Profile'},
  ];
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
  ];
  final List brands = [
    AppImages.barby,
    AppImages.paw,
    AppImages.lol,
    AppImages.barby,
    AppImages.paw,
  ];
  final List<Widget> screens = [
    OffersView(),
    CartView(),
    HomeView(),
    CategoriesView(),
    ProfileView(),
  ];
  changeNavBarIndex(int index) {
    selectedIndex = index;
    emit(HomeChangeNavBarIndex());
  }
}
