part of '../home_view.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onMenuTap;

  const CustomAppBar({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 5,
          children: [
            Text(
              'Welcome Sara',
              style: AppStyles.textStyle20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(AppImages.girl),
          ],
        ),
        Row(
          spacing: 20,
          children: [
            Image.asset(AppImages.notification),
            GestureDetector(
              onTap: onMenuTap,
              child: Image.asset(AppImages.menu),
            ),
          ],
        ),
      ],
    );
  }
}
