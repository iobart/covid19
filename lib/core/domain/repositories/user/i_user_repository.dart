


import 'package:covid19/core/data/dtos/user_model_dto.dart';
import 'package:covid19/core/data/models/user_model.dart';

abstract class IUserRepository {
  /// Returns a Future
  Future<UserDTO>authUser(UserModel user);

  Future <bool> registerUser(UserModel user);

  UserModel get user;

  void updateUser(UserDTO user);

  Future<void> logoutUser();
}