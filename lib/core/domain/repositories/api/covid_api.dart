import 'dart:convert';

import 'package:covid19/core/data/dtos/user_model_dto.dart';
import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class CovidAPi{
  final Logger _logger = Logger();

  Future<UserDTO> authUser(UserDTO user) async {
    String jsonString = await rootBundle.loadString(kCredentials);
    Map<String, dynamic> credentials = jsonDecode(jsonString);

    if (user.typeDoc == credentials['credentials']['tipoDocumento'] &&
        user.number == credentials['credentials']['numeroDocumento'] &&
        user.password == credentials['credentials']['password']) {
      UserDTO userDTO = UserDTO(
        typeDoc:  credentials['credentials']['tipoDocumento'],
        number:  credentials['credentials']['numeroDocumento'],
        password: credentials['credentials']['password'],
      );
      return userDTO;
    } else {
      return UserDTO();
    }
  }
}