part of '../home_view.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,

    this.selectedItem = false,
    required this.title,
    this.onItemTap,
  });

  final bool? selectedItem;
  final String title;
  final void Function()? onItemTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: BoxDecoration(
          color: selectedItem == true ? AppColors.blueColor : Color(0xffE7F8FF),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          title,
          style: AppStyles.textStyle14.copyWith(
            color: selectedItem == true ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
