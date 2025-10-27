import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/constants/constants.dart';
import 'package:tam_tam_app/core/routing/routes_name.dart';
import 'package:tam_tam_app/custom_widgets/custom_bottom_sheet.dart';
import 'package:tam_tam_app/custom_widgets/custom_button.dart';
import 'package:tam_tam_app/custom_widgets/custom_category.dart';
import 'package:tam_tam_app/custom_widgets/custom_item.dart';
import 'package:tam_tam_app/custom_widgets/custom_search_bar.dart';
import 'package:tam_tam_app/views/cart/cart_view.dart';
import 'package:tam_tam_app/views/categories/categories_view.dart';
import 'package:tam_tam_app/views/offers/offers_view.dart';
import 'package:tam_tam_app/views/profile/profile_view.dart';

part 'cubit/home_cubit.dart';
part 'cubit/home_state.dart';
part 'widgets/custom_app_bar.dart';
part 'widgets/title_and_see_all.dart';
part 'widgets/drawer_item.dart';
part 'widgets/drawer_body.dart';
part 'widgets/filter_bottom_sheet.dart';
part 'widgets/bottom_sheet_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();

          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: Stack(
              children: [
                // Drawer Layer
                DrawerBody(cubit: cubit),
                //   Main Home Content
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  transform:
                      Matrix4.translationValues(
                          state.isDrawerOpen
                              ? -MediaQuery.of(context).size.width * 0.65
                              : 0,
                          0,
                          0,
                        )
                        ..scale(state.isDrawerOpen ? 0.9 : 1.0)
                        ..rotateZ(state.isDrawerOpen ? 0.002 : 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      state.isDrawerOpen ? 20 : 0,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (state.isDrawerOpen) cubit.toggleDrawer();
                    },
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              CustomAppBar(onMenuTap: cubit.toggleDrawer),
                              const SizedBox(height: 20),
                              CustomSearchBar(
                                onSuffixIconTap: () => showCustomBottomSheet(
                                  child: FilterBottomSheet(
                                    cubit: context.read<HomeCubit>(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              CarouselSlider.builder(
                                itemCount: 5,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.9,
                                  aspectRatio: 2.0,
                                  initialPage: 2,
                                  autoPlayAnimationDuration: const Duration(
                                    milliseconds: 300,
                                  ),
                                ),
                                itemBuilder:
                                    (context, itemIndex, pageViewIndex) =>
                                        Image.asset(AppImages.sliderImg),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(AppImages.boysGroup),
                                  Image.asset(AppImages.girlsGroup),
                                ],
                              ),
                              const SizedBox(height: 40),
                              TitleAndSeeAll(title: 'Categories', onTap: () {}),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.categories.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Customcategory(
                                      title: cubit.categories[index]['title'],
                                      image: cubit.categories[index]['image'],
                                      color: cubit.categories[index]['color'],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TitleAndSeeAll(
                                title: 'Top Selling',
                                onTap: () {},
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 270,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  itemBuilder: (context, index) => CustomItem(
                                    image: AppImages.unicorn,
                                    title:
                                        'Rainbocorns Fairycorn Pink Color with other toys',
                                    price: 'IQD 700.00',
                                    onFavoriteTap: () {},
                                    onAddTap: () {},
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Image.asset(AppImages.slideGroup),
                              const SizedBox(height: 20),
                              TitleAndSeeAll(title: 'Hot Offers', onTap: () {}),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 270,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  itemBuilder: (context, index) => CustomItem(
                                    isOffer: true,
                                    image: AppImages.unicorn,
                                    title:
                                        'Rainbocorns Fairycorn Pink Color with other toys',
                                    price: 'IQD 700.00',
                                    onFavoriteTap: () {},
                                    onAddTap: () {},
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TitleAndSeeAll(title: 'Brands', onTap: () {}),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.brands.length,
                                  itemBuilder: (context, index) =>
                                      Image.asset(cubit.brands[index]),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TitleAndSeeAll(title: 'Babies', onTap: () {}),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 270,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  itemBuilder: (context, index) => CustomItem(
                                    image: AppImages.unicorn,
                                    title:
                                        'Rainbocorns Fairycorn Pink Color with other toys',
                                    price: 'IQD 700.00',
                                    onFavoriteTap: () {},
                                    onAddTap: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
