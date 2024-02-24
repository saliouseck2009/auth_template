import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage/main.dart';

import '../bussiness_logic/bloc/auth_bloc/auth_bloc.dart';
import '../bussiness_logic/bloc/auth_bloc/auth_event.dart';
import '../screen/login_screen.dart';
import 'drawer_list_tyle.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomDrawerHeader(),
        DrawerListTile(
            imgpath: "home.png",
            name: "Home",
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const MainPage(),
                ),
              );
            }),

        DrawerListTile(
            imgpath: "exit.png",
            name: "Logout",
            ontap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.routeName, (route) => false);
            }),
        // DrawerListTile(
        //     imgpath: "notification.png", name: "Notification", ontap: () {}),
      ],
    );
  }
}

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/DaaraScience.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: SizedBox.shrink(),
    );
  }
}
