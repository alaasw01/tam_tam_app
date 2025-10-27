import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_style.dart';

class CustomItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final void Function()? onFavoriteTap;
  final void Function()? onAddTap;
  final bool isFavorite;
  final bool isOffer;

  const CustomItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.onFavoriteTap,
    this.onAddTap,
    this.isFavorite = false,
    this.isOffer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isOffer == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF7B3DD),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text('10%', style: AppStyles.textStyle14),
                    ),
                    GestureDetector(
                      onTap: onFavoriteTap,
                      child: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isFavorite
                            ? Color(0xffC084FC)
                            : AppColors.greyColor,
                        size: 30,
                      ),
                    ),
                  ],
                )
              : Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Icon(
                      isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isFavorite
                          ? Color(0xffC084FC)
                          : AppColors.greyColor,
                      size: 30,
                    ),
                  ),
                ),

          Center(child: Image.asset(image, height: 100, fit: BoxFit.contain)),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.w700),
          ),
          // const Spacer(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: AppStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onAddTap,
                child: CircleAvatar(
                  backgroundColor: AppColors.blueColor,
                  radius: 18,
                  child: const Icon(Icons.add, color: Colors.white, size: 22),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
