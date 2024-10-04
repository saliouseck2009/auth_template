import 'package:flutter/material.dart';

class UtilsScreen {
  static customSnackbar(
      {required BuildContext context,
      int duration = 2,
      required Color colorBackground,
      required String textType,
      required String description}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: Duration(seconds: duration),
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textType,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
