

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class CheckAuthStatusUseCase extends UseCase<bool, void> {
  final AuthRepository authRepository;

  CheckAuthStatusUseCase(this.authRepository);

  @override
  Future<bool> call({required void params}) async {
    return await authRepository.hasValidToken();
  }
}
