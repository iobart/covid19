import 'package:covid19/core/data/models/covid_data_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/entities/usecases/get_data_covid_use_case.dart';
import 'package:covid19/core/domain/entities/usecases/package_info_user_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeViewModel extends ChangeNotifier{
 final PackageInfoUserUseCase _packageInfo;
final GetDataCovidUseCase _getDataCovidUseCase;
  HomeViewModel({
    PackageInfoUserUseCase? packageInfo,
    GetDataCovidUseCase? getDataCovidUseCase,
  }) :  _getDataCovidUseCase = getDataCovidUseCase ?? locator<GetDataCovidUseCase>(),
        _packageInfo = packageInfo ?? locator<PackageInfoUserUseCase>();


  ///returns the package info of the app
  Future<PackageInfo> getPackageInfo() async {
    final PackageInfo info= await _packageInfo.invoke();
    return info;
  }

  ///returns the data of the covid
 Future<CovidDataModel> getDataCovid() async {
  final CovidDataModel covidModel = await _getDataCovidUseCase.invoke();
  return covidModel;
  }
}