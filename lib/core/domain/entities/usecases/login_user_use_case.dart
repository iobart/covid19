

import 'package:covid19/core/data/models/user_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/repositories/user/i_user_repository.dart';

class LoginUseCase {
  final IUserRepository _iUserRepository;

  LoginUseCase({IUserRepository? iUserRepository})
      : _iUserRepository = iUserRepository ?? locator<IUserRepository>();

  Future<UserModel> invoke(String typeDoc, String number,String password) async {

    final UserModel user = UserModel(typeDoc:typeDoc,number: number, password: password,);
    final userData = await _iUserRepository.authUser(user);
    _iUserRepository.updateUser(userData);
    return _iUserRepository.user;
  }
}