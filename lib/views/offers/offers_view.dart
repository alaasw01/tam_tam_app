import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/custom_widgets/custom_item.dart';
import 'package:tam_tam_app/custom_widgets/custom_search_bar.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: [
            Text(
              'Special Offers',
              style: AppStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Image.asset(AppImages.fire, height: 25, fit: BoxFit.contain),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomSearchBar(),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => CustomItem(
                  image: AppImages.unicorn,
                  title: 'Rainbocorns Fairycorn Pink Color with other toys',
                  price: 'IQD 700.00',
                  onFavoriteTap: () {},
                  onAddTap: () {},
                ),
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 10,
                childAspectRatio: 0.68,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
