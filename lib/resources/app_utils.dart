import 'package:flutter/material.dart';
import 'package:generics_task_digital_future/resources/exception_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static snackBar(String text) {
    scaffoldMessengerKey.currentState!.clearSnackBars();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  static Future<void> openUrl(String phone) async {
    try {
      await launchUrl(
        Uri.parse('tel:$phone'),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      ExceptionManager().showException();
    }
  }
}
