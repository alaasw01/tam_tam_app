import 'package:flutter/material.dart';

Future<void> showCustomBottomSheet(
  BuildContext context, {
  required Widget child,
  double? height,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => SizedBox(width: double.infinity, child: child),
  );
}
