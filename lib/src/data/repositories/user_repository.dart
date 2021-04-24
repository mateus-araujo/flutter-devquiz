import 'package:flutter/services.dart';

import 'package:devquiz/src/domain/entities/user_model.dart';
import 'package:devquiz/src/domain/repositories/user_repository.dart';

class UserRepository implements IUserRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/json/user.json");

    final user = UserModel.fromJson(response);
    return user;
  }
}
