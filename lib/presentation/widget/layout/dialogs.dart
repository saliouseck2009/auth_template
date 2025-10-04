import 'package:flutter/material.dart';

import '../../../core/config/theme/app_color.dart';
import '../buttons/basic_action_button.dart';

class CustomDialogs {
  static void showLogoutDialog(
    BuildContext context, {
    String title = "Info",
    required String message,
    String textButton = "Oui",
    required Function() onValidate,
    IconData icon = Icons.info,
    bool isInfoDialog = false,
    Color rightButtonContainerColor = AppColor.red,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Column(
            children: [
              Icon(icon, size: 50, color: AppColor.warning),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Text(message, textAlign: TextAlign.center),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            (!isInfoDialog)
                ? TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(foregroundColor: Colors.grey),
                    child: const Text("Annuler"),
                  )
                : const SizedBox.shrink(),
            BasicActionButton(
              containerColor: rightButtonContainerColor,
              contentColor: Theme.of(context).colorScheme.onPrimary,
              label: textButton,
              onPressed: onValidate,
            ),
          ],
        );
      },
    );
  }
}

/* Usage Example:
  - Show loading
LoadingDialog.show(context);

  - Hide loading
LoadingDialog.hide(context);
*/

class LoadingDialog {
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tap
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (_) => const _LoadingContent(),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

class _LoadingContent extends StatelessWidget {
  const _LoadingContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              "Chargement...",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
