import 'package:get_it/get_it.dart';

import 'features/auth/data/repository/repositories.dart';

GetIt locator = GetIt.instance;

Future setup() async {
  locator.registerSingleton<UserRepository>(UserRepository());

}
