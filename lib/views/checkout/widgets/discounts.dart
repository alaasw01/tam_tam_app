part of '../checkout_view.dart';

class Discounts extends StatelessWidget {
  const Discounts({
    super.key,
    this.isSelected = false,
    this.onTap,
    required this.discount,
  });
  final bool? isSelected;
  final void Function()? onTap;
  final int discount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
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
            Text(
              '$discount% Discount',
              style: AppStyles.textStyle16.copyWith(
                color: isSelected == true ? AppColors.blueColor : Colors.black,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                'Apply',
                style: AppStyles.textStyle14.copyWith(
                  color: isSelected == true
                      ? AppColors.blueColor
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
