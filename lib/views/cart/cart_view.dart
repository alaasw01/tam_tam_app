import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/core/routing/routes_name.dart';
import 'package:tam_tam_app/custom_widgets/custom_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Cart',
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.unicorn),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        child: Text(
                          'Rainbocorns Fairycorn Pink Color with other toys',
                          style: AppStyles.textStyle18.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'IQD 700.00',
                        style: AppStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        spacing: 10,
                        children: [
                          Image.asset(
                            AppImages.delete,
                            height: 28,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            '1',
                            style: AppStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.blueColor,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: CustomButton(
                width: MediaQuery.sizeOf(context).width * 0.8,
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.checkout);
                },
                raduis: 50,
                text: 'Checkout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
