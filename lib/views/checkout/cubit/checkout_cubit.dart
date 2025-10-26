part of '../checkout_view.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  String? selectedOption;
  bool? giftWrapping;
  bool? payViaWallet;
  int? selectedDiscount;
  String? selectedPaymentMethod = 'wallet';
  changeGiftOption(String? value) {
    selectedOption = value;
    emit(CheckoutChangeGiftOption());
  }

  changeGiftWrappingValue(bool? value) {
    giftWrapping = value;
    emit(CheckoutChangeGiftWrapping());
  }

  changePayViaWalletValue(bool? value) {
    payViaWallet = value;
    emit(CheckoutChangePayViaWallet());
  }

  changePaymentMethod(String method) {
    selectedPaymentMethod = method;
    emit(CheckoutChangePaymentMethod());
  }

  changeSelectedDiscount(int index) {
    selectedDiscount = index;
    emit(CheckoutChangeSelectedDiscount());
  }

  List discounts = [35, 20, 50, 75];
}
