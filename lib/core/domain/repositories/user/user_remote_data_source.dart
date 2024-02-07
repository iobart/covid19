import 'package:covid19/core/data/dtos/user_model_dto.dart';
import 'package:covid19/core/data/models/user_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/repositories/api/covid_api.dart';

class UserRemotoDataSource  {
  final CovidAPi _covidApi;

  UserRemotoDataSource({
    CovidAPi? covidApi,
  }) : _covidApi = covidApi ?? locator<CovidAPi>();

  Future<UserDTO> authUser(UserModel user) async {
    UserDTO userDto = UserDTO.fromModel(model: user);
    return await  _covidApi.authUser(userDto);
  }



  Future<void> logoutUser() async {
  // return await  _covidApi.logoutUser();
  }
}