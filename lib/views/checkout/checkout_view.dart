import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_images.dart';
import 'package:tam_tam_app/constants/app_style.dart';
import 'package:tam_tam_app/custom_widgets/custom_button.dart';
part 'widgets/shipping_address.dart';
part 'cubit/checkout_cubit.dart';
part 'cubit/checkout_state.dart';
part 'widgets/order_summary.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Checkout',
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocProvider(
        create: (context) => CheckoutCubit(),
        child: BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
            final cubit = context.read<CheckoutCubit>();
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      'Shipping Address',
                      style: AppStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      spacing: 20,
                      children: [
                        ShippingAddress(),
                        ShippingAddress(addNewAddress: true),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          //            Radio(
                          //   value: 'gift',

                          //   child: const Icon(Icons.circle, size: 0),
                          // ),
                          Image.asset(
                            AppImages.gift,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Send As Gift',
                            style: AppStyles.textStyle20.copyWith(
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Order Summary',
                      style: AppStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15),
                    OrderSummary(),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gift wrapping :  IQD 7.00',
                            style: AppStyles.textStyle18.copyWith(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Transform.scale(
                            scale: 1.15,
                            child: Switch(
                              activeThumbColor: AppColors.blueColor,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.grey,
                              thumbIcon: WidgetStatePropertyAll(
                                Icon(
                                  Icons.circle_sharp,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              value: cubit.giftWrapping ?? false,
                              onChanged: cubit.changeGiftWrappingValue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Coupon',
                      style: AppStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Code',
                              style: AppStyles.textStyle18.copyWith(
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.blueColor,
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              'Submit',
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyle18.copyWith(
                                color: AppColors.blueColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
