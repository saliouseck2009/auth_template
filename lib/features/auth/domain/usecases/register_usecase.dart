

import '../../../../core/data_state/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterParams {
  final String username;
  final String email;
  final String password;
  final String? phone;

  const RegisterParams({
    required this.username,
    required this.email,
    required this.password,
    this.phone,
  });
}

class RegisterUseCase extends UseCase<DataState<UserEntity>, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<DataState<UserEntity>> call({required RegisterParams params}) async {
    return await authRepository.register(
      username: params.username,
      email: params.email,
      password: params.password,
      phone: params.phone,
    );
  }
}
