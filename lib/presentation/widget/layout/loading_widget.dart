import 'package:flutter/material.dart';

import '../../../core/config/theme/app_color.dart';

class LoadingWidget extends StatelessWidget {
  final double height;
  final Color color;
  const LoadingWidget({
    super.key,
    this.height = 30,
    this.color = AppColor.green,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          height: height,
          width: height,
          child: CircularProgressIndicator.adaptive(backgroundColor: color),
        ),
      ),
    );
  }
}
