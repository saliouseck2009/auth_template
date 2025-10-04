import 'package:flutter/material.dart';

import '../../features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_bloc.dart';
import '../../features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_event.dart';
import '../../service_locator.dart';

class HomePage extends StatelessWidget {
  static const String routePath = '/home';
  static const String routeName = 'Home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              // Trigger logout event
              locator.get<AuthenticationBloc>().add(LoggedOut());
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Disconnect',
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 80, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Welcome to Home Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'This is your sample home page',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
