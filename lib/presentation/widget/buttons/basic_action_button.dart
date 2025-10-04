import 'package:flutter/material.dart';

import '../../../core/config/theme/app_color.dart';

class BasicActionButton extends StatelessWidget {
  final Function()? onPressed;
  final Color containerColor;
  final Color contentColor;
  final String label;
  final double horizontalPadding;
  const BasicActionButton({
    super.key,
    required this.onPressed,
    this.containerColor = AppColor.blue,
    this.contentColor = Colors.white,
    this.horizontalPadding = 32,
    this.label = "Label",
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: containerColor,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 6,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: contentColor,
        ),
      ),
    );
  }
}
