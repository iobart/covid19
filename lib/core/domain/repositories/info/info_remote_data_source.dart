import 'package:covid19/core/data/dtos/state_current_model_dto.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/repositories/api/covid_api.dart';

class InfoRemoteDataSource {
  final CovidAPi _covidApi;

  InfoRemoteDataSource({
    CovidAPi? covidApi,
  }) : _covidApi = covidApi ??locator<CovidAPi>();


  Future<List<StateCurrentModelDto?>>getCurrentState()async{
    List<StateCurrentModelDto?>?  stateCurrentModelDto =await _covidApi.getCurrentState();
    return stateCurrentModelDto ?? [StateCurrentModelDto()];
  }
}
