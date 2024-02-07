import 'dart:convert';

import 'package:covid19/core/data/dtos/covid_data_model_dto.dart';
import 'package:covid19/core/data/dtos/user_model_dto.dart';
import 'package:covid19/core/presentation/constansts/api_constant.dart';
import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:covid19/core/presentation/utils/network_utils.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
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

  Future<CovidDataModelDto?> getDataCovid() async {
    final Response call = await _get(kDataCovid);
    final dynamic callBody = jsonDecode(call.body);
    if (callBody is Map<String, dynamic>) {
      return CovidDataModelDto.fromJson(callBody);
    } else if (callBody is List<dynamic> && callBody.isNotEmpty) {
      if (callBody[0] is Map<String, dynamic>) {
        return CovidDataModelDto.fromJson(callBody[0]);
      }
    }

    return null;
  }


  /// Generic method to make a GET request
  Future<Response> _get(String url) async {
    Uri uri = Uri.parse(url);
    Response callResponse = (await apiCall(get(uri)))!;
    return callResponse;
  }
}