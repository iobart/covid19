import 'package:covid19/core/data/dtos/covid_data_model_dto.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/repositories/api/covid_api.dart';

class HomeRemoteDataSource  {
  final CovidAPi _covidApi;

  HomeRemoteDataSource({
    CovidAPi? covidApi,
  }) : _covidApi = covidApi ?? locator<CovidAPi>();

  Future<CovidDataModelDto> getDataCovid() async {
    CovidDataModelDto? covidDto = await _covidApi.getDataCovid();
    return covidDto??CovidDataModelDto();
  }
}