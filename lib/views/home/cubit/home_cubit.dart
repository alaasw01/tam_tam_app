part of '../home_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int selectedIndex = 2;
  int selectedAge = 0;
  int selectedPrice = 0;
  int selectedGender = 0;
  TextEditingController searchController = TextEditingController();
  bool isDrawerOpen = false;
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
  final List<Map<String, dynamic>> drawerItem = [
    {'icon': Icons.wallet, 'title': 'Wallet', 'screen': null},
    {
      'icon': Icons.favorite,
      'title': 'Favorite',
      'screen': RouteNames.favorites,
    },
    {'icon': Icons.history, 'title': 'Order History', 'screen': null},
    {'icon': Icons.location_on, 'title': 'My Addresses', 'screen': null},
    {'icon': Icons.description, 'title': 'Terms & Condition', 'screen': null},
    {'icon': Icons.lock, 'title': 'Privacy', 'screen': null},
    {'icon': Icons.help, 'title': 'Help & Support', 'screen': null},
    {'icon': Icons.delete, 'title': 'Delete Account', 'screen': null},
    {'icon': Icons.language, 'title': 'Language', 'screen': null},
    {'icon': Icons.logout, 'title': 'Log out', 'screen': null},
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
  final List ages = ['All', '0-2', '3-5', '6+', '7-12'];
  final List gender = ['All', 'Boys', 'Girls', 'Newborn'];
  final List prices = ['All', '0-10 IQD', '10-20 IQD', '20-10 IQD'];

  changeNavBarIndex(int index) {
    selectedIndex = index;
    emit(HomeChangeNavBarIndex());
  }

  changeSelectedAge(int index) {
    selectedAge = index;
    emit(HomeChangeSelectedAge());
  }

  changeSelectedGender(int index) {
    selectedGender = index;
    emit(HomeChangeSelectedGender());
  }

  changeSelectedPrice(int index) {
    selectedPrice = index;
    emit(HomeChangeSelectedPrice());
  }

  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
    emit(HomeDrawerToggled(isDrawerOpen: isDrawerOpen));
  }

  onDrawerItemTap(int index) {
    final targetScreen = drawerItem[index]['screen'];
    // cubit.toggleDrawer();
    if (targetScreen != null) {
      // Navigate to that screen
      Navigator.pushNamed(
        AppConstants.navigatorKey.currentContext!,
        targetScreen,
      );
    } else {
      // Handle logout here
    }
  }
}
