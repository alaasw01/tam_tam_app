part of '../home_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  PersistentTabController controller = PersistentTabController(initialIndex: 2);
  List<Widget> buildScreens() {
    return [
      const Center(child: Text('Cart')),
      const Center(child: Text('Offers')),
      const HomeView(),
      const Center(child: Text('Categories')),
      const Center(child: Text('Profile')),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage(AppImages.cart)),
        title: ("Cart"),
        activeColorPrimary: AppColors.blueColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage(AppImages.offers)),
        title: ("Offers"),
        activeColorPrimary: AppColors.blueColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
      // The middle Add button
      PersistentBottomNavBarItem(
        icon: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: AppColors.blueColor,
            shape: BoxShape.circle,
          ),
          child: const ImageIcon(AssetImage(AppImages.home)),
        ),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage(AppImages.categories)),
        title: ("Categories"),
        activeColorPrimary: AppColors.blueColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage(AppImages.profile)),
        title: ("Profile"),
        activeColorPrimary: AppColors.blueColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
    ];
  }
}
