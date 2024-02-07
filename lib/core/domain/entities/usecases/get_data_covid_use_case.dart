import 'package:covid19/core/data/models/covid_data_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/repositories/home/i_home_repository.dart';

class GetDataCovidUseCase {
  final IHomeRepository _IhomeRepository;
  GetDataCovidUseCase({IHomeRepository? iHomeRepository})
      : _IhomeRepository = iHomeRepository??locator<IHomeRepository>();
  Future<CovidDataModel> invoke() async {
    return await _IhomeRepository.getDataCovid();
  }
}