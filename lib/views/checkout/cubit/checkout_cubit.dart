part of '../checkout_view.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  String? selectedOption;
  bool? giftWrapping;
  changeGiftOption(String? value) {
    selectedOption = value;
    emit(CheckoutChangeGiftOption());
  }

  changeGiftWrappingValue(bool? value) {
    giftWrapping = value;
    emit(CheckoutChangeGiftWrapping());
  }
}
