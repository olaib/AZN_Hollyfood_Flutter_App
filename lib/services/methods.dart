import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';


class AppMethods {
  static Future<void> showErrorOrWarningDialog(
      {required BuildContext context,
      required String subtitle,
      required Function func,
      bool isError = true}) async {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: isError ? 'שגיאה' : 'אזהרה',
        message: subtitle,
        contentType: isError ? ContentType.failure : ContentType.warning,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> showSuccessDialog(
      {required BuildContext context,
      required String subtitle,
      required Function func}) async {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: '',
        message: subtitle,
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}