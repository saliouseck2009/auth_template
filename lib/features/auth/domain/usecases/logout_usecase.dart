

import '../../../../core/data_state/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase extends UseCase<DataState<void>, void> {
  final AuthRepository authRepository;

  LogoutUseCase(this.authRepository);

  @override
  Future<DataState<void>> call({required void params}) async {
    return await authRepository.logout();
  }
}
