import 'package:flutter/material.dart';

import '../../themes/theme.dart';

typedef VoidCallbackWithContextArgs = Function(BuildContext context);

class CustomListTyle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color color;
  final Image? image;
  final String? trailing;
  final bool? isActive;
  final IconData? icon;
  final GestureTapCallback? onTap;

  const CustomListTyle(
      {Key? key,
      required this.title,
      this.subtitle,
      this.icon,
      required this.onTap,
      this.isActive,
      this.trailing,
      required this.color,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white24),
        child: ListTile(
          enabled: isActive ?? true,
          onTap: onTap,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
                border: Border(right: BorderSide(width: 1.0, color: color))),
            child: image,
          ),
          title: Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(subtitle ?? "",
                        style: TextStyle(
                          color: color,
                        ))),
              )
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(trailing ?? ""),
              if (icon != null)
                Icon(
                  icon,
                  color: CustomColors.mainColor,
                  size: 35,
                )
            ],
          ),
        ),
      ),
    );
  }
}
