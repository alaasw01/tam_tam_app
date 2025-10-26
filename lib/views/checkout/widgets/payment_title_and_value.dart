part of '../checkout_view.dart';

class PaymentTitleAndValue extends StatelessWidget {
  const PaymentTitleAndValue({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            value,
            style: AppStyles.textStyle16.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.blueColor,
            ),
          ),
        ],
      ),
    );
  }
}
