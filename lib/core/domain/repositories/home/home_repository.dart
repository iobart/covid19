import 'package:covid19/core/data/dtos/covid_data_model_dto.dart';
import 'package:covid19/core/data/models/covid_data_model.dart';
import 'package:covid19/core/di/di_locator.dart';

import 'home_remote_data_source.dart';
import 'i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepository({
    HomeRemoteDataSource? homeRemoteDataSource,
  }) : _homeRemoteDataSource =
            homeRemoteDataSource ?? locator<HomeRemoteDataSource>();

  @override
  Future<CovidDataModel> getDataCovid() async {
    final CovidDataModelDto _covidDataModelDto =
        await _homeRemoteDataSource.getDataCovid();
    final CovidDataModel covidDataModel =
        CovidDataModel.fromCovidDataDtoModel(model: _covidDataModelDto);
    return covidDataModel;
  }
}
