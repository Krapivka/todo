import 'package:flutter/widgets.dart';
import 'package:todo/core/utils/constants/Palette.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static SnackBar show(BuildContext context, String message) {
    return SnackBar(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
