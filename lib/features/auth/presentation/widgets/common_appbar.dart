import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage/features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:voyage/features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_event.dart';
import 'package:voyage/themes/theme.dart';

import '../screen/login_screen.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool menuenabled;
  final bool notificationenabled;
  final Function()? ontap;
  const CommonAppBar({
    super.key,
    required this.title,
    required this.menuenabled,
    required this.notificationenabled,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.routeName, (route) => false);
          },
          icon: const Icon(Icons.logout),
          color: Colors.white,
          iconSize: 30,
        )
      ],
      centerTitle: true,
      // backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
