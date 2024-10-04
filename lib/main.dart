import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage/bloc_observer.dart';
import 'package:voyage/features/auth/data/repository/repositories.dart';
import 'package:voyage/features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:voyage/features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_event.dart';
import 'package:voyage/features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_state.dart';
import 'package:voyage/features/auth/presentation/bussiness_logic/bloc/signup_bloc/signup_bloc.dart';
import 'package:voyage/features/auth/presentation/screen/login_screen.dart';
import 'package:voyage/route_generator.dart';
import 'package:voyage/themes/palette.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const VoyageApp());
}

class VoyageApp extends StatelessWidget {
  const VoyageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationBloc>(
                create: (context) {
                  return AuthenticationBloc()..add(AppStarted());
                },
              ),
              BlocProvider(
                create: (context) =>
                    SignupBloc(userRepository: context.read<UserRepository>()),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              theme: ThemeData(
                useMaterial3: true,
                fontFamily: 'Rubik',
                primarySwatch: Palette.kToDark,
              ),
              home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      if (state is AuthenticationAuthenticated) {
                        return const MainPage();
                      }
                      if (state is AuthenticationUnauthenticated) {
                        //return IntroPage(userRepository: userRepository);
                        return const LoginScreen();
                      }
                      if (state is AuthenticationLoading) {
                        return Scaffold(
                          body: Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 25.0,
                                  width: 25.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Theme.of(context).colorScheme.primary),
                                    strokeWidth: 4.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      return Scaffold(
                        body: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 25.0,
                                width: 25.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).colorScheme.primary),
                                  strokeWidth: 4.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                listener: (context, state) {
                  ///This part is used when deconnection button is pressed
                  if (state is AuthenticationUnauthenticated) {
                    // Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName);
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.routeName, (route) => false);
                  }
                },
              ),
            )));
  }
}

class MainPage extends StatelessWidget {
  static const routeName = '/home';
  const MainPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Demo Home Page'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ));
  }
}
