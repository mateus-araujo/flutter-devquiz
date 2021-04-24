import 'package:devquiz/src/domain/entities/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> getUser();
}
