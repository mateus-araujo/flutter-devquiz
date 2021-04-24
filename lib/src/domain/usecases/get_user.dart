import 'package:devquiz/src/domain/entities/user_model.dart';
import 'package:devquiz/src/domain/repositories/user_repository.dart';

abstract class IGetUser {
  Future<UserModel> call();
}

class GetUser implements IGetUser {
  IUserRepository _userRepository;

  GetUser(this._userRepository);

  @override
  Future<UserModel> call() {
    final user = _userRepository.getUser();

    return user;
  }
}
