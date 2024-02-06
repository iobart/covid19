import 'package:covid19/core/data/models/user_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/entities/usecases/login_user_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginViewModel({
    LoginUseCase? loginUseCase,
  }) : _loginUseCase = loginUseCase ?? locator<LoginUseCase>();

  Future<UserModel?> loginUser(
      String typeDoc, String number, String password) async {
    try {
      final UserModel loginSuccess =
          await _loginUseCase.invoke(typeDoc, number, password);

      if (loginSuccess.typeDoc != null && loginSuccess.number != null) {
        return loginSuccess;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
