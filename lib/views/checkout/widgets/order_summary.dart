part of '../checkout_view.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 8,
                children: [
                  Image.asset(
                    AppImages.delivery,
                    height: 25,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Delivery Date',
                    style: AppStyles.textStyle16.copyWith(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              Text('20/7/2025', style: AppStyles.textStyle16),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            // height: 20,
            color: Colors.grey.shade300,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
          ),
          Row(
            children: [
              Image.asset(AppImages.unicorn, height: 80, fit: BoxFit.contain),
              SizedBox(width: 15),
              Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.28,
                    child: Text(
                      'Rainbocorns Fairycorn Pink Color with other toys',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textStyle18.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    '1 item',
                    style: AppStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                'IQD 700.00',
                style: AppStyles.textStyle16.copyWith(
                  color: AppColors.blueColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
