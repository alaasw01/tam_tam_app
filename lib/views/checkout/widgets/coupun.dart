part of '../checkout_view.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Code',
              style: AppStyles.textStyle14.copyWith(
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.blueColor, width: 1.5),
            ),
            child: Text(
              'Submit',
              textAlign: TextAlign.center,
              style: AppStyles.textStyle14.copyWith(color: AppColors.blueColor),
            ),
          ),
        ),
      ],
    );
  }
}
