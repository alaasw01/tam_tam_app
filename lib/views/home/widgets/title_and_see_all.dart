part of '../home_view.dart';

class TitleAndSeeAll extends StatelessWidget {
  const TitleAndSeeAll({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.w700),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            spacing: 4,
            children: [
              Text(
                'See All',
                style: AppStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blueColor,
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, color: AppColors.blueColor),
            ],
          ),
        ),
      ],
    );
  }
}
