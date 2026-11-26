import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

abstract class AppToast {
  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required ToastificationType type,
  }) {
    final IconData icon = _getIcon(type);

    toastification.show(
      context: context,
      type: type,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),

      showProgressBar: false,

      icon: Icon(icon, color: Colors.white, size: 30),

      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),

      description: description.isNotEmpty
          ? Text(
              description,
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            )
          : null,

      backgroundColor: _getColor(type).withOpacity(0.8),

      borderRadius: BorderRadius.circular(14),

      borderSide: BorderSide.none,

      boxShadow: [
        BoxShadow(
          blurRadius: 20,
          offset: Offset(0, 5),
          color: Color(0x14000000),
        ),
      ],

      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  static Color _getColor(ToastificationType type) {
    switch (type) {
      case ToastificationType.success:
        return Colors.green;
      case ToastificationType.info:
        return Colors.blue;
      case ToastificationType.warning:
        return Colors.orange;
      case ToastificationType.error:
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  static IconData _getIcon(ToastificationType type) {
    switch (type) {
      case ToastificationType.success:
        return Icons.check_circle;
      case ToastificationType.info:
        return Icons.movie;
      case ToastificationType.warning:
        return Icons.warning_amber;
      case ToastificationType.error:
        return Icons.error;
      default:
        return Icons.notifications;
    }
  }
}
