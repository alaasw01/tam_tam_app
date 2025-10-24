import 'package:flutter/material.dart';

Future<void> showCustomDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmText = "OK",
  VoidCallback? onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            if (onConfirm != null) onConfirm();
          },
          child: Text(confirmText),
        ),
      ],
    ),
  );
}
