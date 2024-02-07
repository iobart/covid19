
import 'package:covid19/core/data/dtos/user_model_dto.dart';
import 'package:covid19/core/data/models/user_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/repositories/user/user_local_data_source.dart';
import 'package:covid19/core/domain/repositories/user/user_remote_data_source.dart';
import 'i_user_repository.dart';

class UserRepository implements IUserRepository {
  final UserRemotoDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  UserRepository({
    UserRemotoDataSource? userRemoteDataSource,
    UserLocalDataSource? userLocalDataSource,
  }) : _userLocalDataSource = userLocalDataSource ?? locator<UserLocalDataSource>(),
        _userRemoteDataSource = userRemoteDataSource ?? locator<UserRemotoDataSource>();

  @override
  Future<UserDTO> authUser(UserModel user) {
   return _userRemoteDataSource.authUser(user);
  }
  
  @override
  UserModel get user => UserModel.formUserDTO(_userLocalDataSource.user);

  @override
  void updateUser(UserDTO user) => _userLocalDataSource.setUser(user);

  @override
  Future<void> logoutUser() {
  return _userRemoteDataSource.logoutUser();
  }

  @override
  Future<bool> registerUser(UserModel user) {
    throw UnimplementedError();
  }

}