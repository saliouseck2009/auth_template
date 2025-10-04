import 'package:flutter/material.dart';

import '../../../core/config/theme/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final Color backgroundColor;
  final double? appBarHeight;
  final double horizontalPadding;

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.trailing,
    this.backgroundColor = AppColor.surface,
    this.appBarHeight,
    this.horizontalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        color: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leading != null) leading!,
            const SizedBox(width: 4),
            (title != null)
                ? Expanded(
                    child: Align(alignment: Alignment.centerLeft, child: title),
                  )
                : const Spacer(),
            if (trailing != null) ...[const SizedBox(width: 8), trailing!],
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? kToolbarHeight);
}
