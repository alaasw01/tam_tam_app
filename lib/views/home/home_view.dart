import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final cubit = context.read<HomeCubit>();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CustomAppBar(),
                    SizedBox(height: 20),
                    CustomSearchBar(),
                    SizedBox(height: 20),
                    CarouselSlider.builder(
                      itemCount: 5,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        initialPage: 2,
                        autoPlayAnimationDuration: Duration(milliseconds: 300),
                      ),
                      itemBuilder:
                          (
                            BuildContext context,
                            int itemIndex,
                            int pageViewIndex,
                          ) => Image.asset(AppImages.sliderImg),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AppImages.boysGroup),
                        Image.asset(AppImages.girlsGroup),
                      ],
                    ),
                    SizedBox(height: 40),
                    TitleAndSeeAll(title: 'Categories', onTap: () {}),
                    SizedBox(height: 15),
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
                    SizedBox(height: 20),
                    TitleAndSeeAll(title: 'Top Selling', onTap: () {}),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    SizedBox(height: 30),
                    Image.asset(AppImages.slideGroup),
                    SizedBox(height: 20),
                    TitleAndSeeAll(title: 'Hot Offers', onTap: () {}),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    SizedBox(height: 20),
                    TitleAndSeeAll(title: 'Brands', onTap: () {}),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.brands.length,
                        itemBuilder: (context, index) =>
                            Image.asset(cubit.brands[index]),
                      ),
                    ),
                    SizedBox(height: 20),
                    TitleAndSeeAll(title: 'Babies', onTap: () {}),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
