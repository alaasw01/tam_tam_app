part of '../checkout_view.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    required this.paymentMethod,
    required this.image,
    this.isSelected = false,
    this.onTap,
  });
  final String paymentMethod;
  final String image;
  final bool? isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected == true
                ? AppColors.blueColor
                : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Image.asset(image),
                Text(paymentMethod, style: AppStyles.textStyle16),
              ],
            ),
            Icon(
              Icons.check_circle_outline_rounded,
              color: isSelected == true
                  ? AppColors.blueColor
                  : Colors.grey.shade400,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
