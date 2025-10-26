part of '../checkout_view.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key, this.addNewAddress = false});

  final bool? addNewAddress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 160,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          addNewAddress == true
              ? CircleAvatar(
                  backgroundColor: AppColors.blueColor,
                  radius: 20,
                  child: Icon(Icons.add, color: Colors.white, size: 30),
                )
              : Image.asset(
                  AppImages.location,
                  height: 50,
                  fit: BoxFit.contain,
                ),
          Spacer(),
          Text(
            addNewAddress == true ? 'Add New Address' : 'Current Location',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle18.copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
