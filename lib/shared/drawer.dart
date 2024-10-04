import 'dart:math';

import 'package:flutter/material.dart';
import 'package:voyage/main.dart';

import '../themes/theme.dart';
import 'constant.dart';

class DrawerStyle extends StatelessWidget {
  DrawerStyle({super.key});
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: <Widget>[
              _createHeader(context),
              const Divider(),
              _createDrawerItem(
                  context: context,
                  icon: Icons.view_list,
                  text: 'Listes des appareils',
                  onTap: () => Navigator.pushReplacementNamed(
                      context, MainPage.routeName)),
            ],
          ),
          ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              title: Text(
                appVersion,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )),
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        //decoration: BoxDecoration(
        // image: DecorationImage(
        //     fit: BoxFit.fill,
        //     image:  AssetImage('path/to/header_background.png'))),
        child: const Stack(children: [
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(appliName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData? icon,
      String? text,
      GestureTapCallback? onTap,
      required BuildContext context}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text!,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
