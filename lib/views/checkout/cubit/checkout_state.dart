part of '../checkout_view.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutChangeGiftOption extends CheckoutState {}

final class CheckoutChangeGiftWrapping extends CheckoutState {}

final class CheckoutChangePayViaWallet extends CheckoutState {}

final class CheckoutChangeSelectedDiscount extends CheckoutState {}

final class CheckoutChangePaymentMethod extends CheckoutState {}
