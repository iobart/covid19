import 'package:covid19/core/data/models/covid_data_model.dart';

abstract class IHomeRepository{
  Future<CovidDataModel> getDataCovid();
}