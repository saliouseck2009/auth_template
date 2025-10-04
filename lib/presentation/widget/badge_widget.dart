import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String label;
  final Color color;
  final TextStyle style;
  final double horizontalPadding;
  final double verticalPadding;
  final double radius;
  final void Function()? onTap;

  const BadgeWidget({
    super.key,
    required this.label,
    this.color = Colors.white,
    this.style = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.horizontalPadding = 15,
    this.verticalPadding = 5,
    this.radius = 20,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(label, textAlign: TextAlign.center, style: style),
      ),
    );
  }
}
