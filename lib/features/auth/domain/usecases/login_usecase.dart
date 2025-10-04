

import '../../../../core/data_state/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

class LoginUseCase extends UseCase<DataState<UserEntity>, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<DataState<UserEntity>> call({required LoginParams params}) async {
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}
