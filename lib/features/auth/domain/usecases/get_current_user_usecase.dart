

import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserUseCase extends UseCase<UserEntity?, void> {
  final AuthRepository authRepository;

  GetCurrentUserUseCase(this.authRepository);

  @override
  Future<UserEntity?> call({required void params}) async {
    return await authRepository.getCurrentUser();
  }
}
