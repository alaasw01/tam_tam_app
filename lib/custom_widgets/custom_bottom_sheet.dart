import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/constants.dart';

Future<void> showCustomBottomSheet({required Widget child, double? height}) {
  return showModalBottomSheet(
    context: AppConstants.navigatorKey.currentContext!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
    ),
    builder: (_) => SizedBox(width: double.infinity, child: child),
  );
}
