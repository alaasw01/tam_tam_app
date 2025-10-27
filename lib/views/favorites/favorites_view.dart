import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/custom_widgets/custom_item.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 20,

              child: Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => CustomItem(
            image: AppImages.unicorn,
            title: 'Rainbocorns Fairycorn Pink Color with other toys',
            price: 'IQD 700.00',
            isFavorite: true,
            onFavoriteTap: () {},
            onAddTap: () {},
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 10,
            childAspectRatio: 0.68,
          ),
        ),
      ),
    );
  }
}
