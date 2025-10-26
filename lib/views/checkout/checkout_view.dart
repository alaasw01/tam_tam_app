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
part 'widgets/coupun.dart';
part 'widgets/discounts.dart';
part 'widgets/payment_title_and_value.dart';
part 'widgets/payment_method.dart';

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
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                          SizedBox(width: 6),
                          Image.asset(
                            AppImages.gift,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 10),
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
                    Coupon(),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.discounts.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Discounts(
                            discount: cubit.discounts[index],
                            isSelected: index == cubit.selectedDiscount,
                            onTap: () => cubit.changeSelectedDiscount(index),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Payment Summary',
                      style: AppStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.only(top: 15, right: 15, left: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          PaymentTitleAndValue(
                            title: 'Subtotal',
                            value: 'IQD 700.00',
                          ),
                          PaymentTitleAndValue(
                            title: 'Shipping',
                            value: 'IQD 25.00',
                          ),
                          PaymentTitleAndValue(title: 'Tax', value: 'IQD 3.70'),
                          PaymentTitleAndValue(
                            title: 'Total',
                            value: 'IQD707.00',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pay Via Wallet',
                          style: AppStyles.textStyle20.copyWith(
                            fontWeight: FontWeight.w700,
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
                            value: cubit.payViaWallet ?? false,
                            onChanged: cubit.changePayViaWalletValue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Wallet Balance', style: AppStyles.textStyle16),
                          Text(
                            'IQD 000.00',
                            style: AppStyles.textStyle14.copyWith(
                              color: AppColors.blueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Payment Method',
                      style: AppStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15),
                    PaymentMethod(
                      image: AppImages.wallet,
                      paymentMethod: 'Credit ,Debit, Apple Pay',
                      isSelected: cubit.selectedPaymentMethod == 'wallet',
                      onTap: () => cubit.changePaymentMethod('wallet'),
                    ),
                    SizedBox(height: 15),
                    PaymentMethod(
                      image: AppImages.cash,
                      paymentMethod: 'Cash',
                      isSelected: cubit.selectedPaymentMethod == 'cash',
                      onTap: () => cubit.changePaymentMethod('cash'),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: CustomButton(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        onPressed: () {},
                        raduis: 50,
                        text: 'Pay Now',
                      ),
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
