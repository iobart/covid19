
import 'package:covid19/core/domain/entities/usecases/get_current_state_use_case.dart';
import 'package:covid19/core/domain/entities/usecases/get_data_covid_use_case.dart';
import 'package:covid19/core/domain/entities/usecases/get_state_info_use_case.dart';
import 'package:covid19/core/domain/entities/usecases/login_user_use_case.dart';
import 'package:covid19/core/domain/entities/usecases/package_info_user_use_case.dart';
import 'package:covid19/core/domain/repositories/api/covid_api.dart';
import 'package:covid19/core/domain/repositories/home/home_remote_data_source.dart';
import 'package:covid19/core/domain/repositories/home/home_repository.dart';
import 'package:covid19/core/domain/repositories/home/i_home_repository.dart';
import 'package:covid19/core/domain/repositories/info/i_info_repository.dart';
import 'package:covid19/core/domain/repositories/info/info_remote_data_source.dart';
import 'package:covid19/core/domain/repositories/info/info_repository.dart';
import 'package:covid19/core/domain/repositories/user/i_user_repository.dart';
import 'package:covid19/core/domain/repositories/user/user_local_data_source.dart';
import 'package:covid19/core/domain/repositories/user/user_remote_data_source.dart';
import 'package:covid19/core/domain/repositories/user/user_repository.dart';
import 'package:covid19/core/presentation/pages/info/info_view_model.dart';
import 'package:covid19/core/presentation/pages/login/login_view_model.dart';
import 'package:covid19/core/presentation/pages/splash/splash_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance..allowReassignment  = true;

void setupLocator() {

  //viewModels
  locator.registerLazySingleton<SplashViewModel>(() => SplashViewModel());
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  locator.registerLazySingleton<InfoViewModel>(() => InfoViewModel());

  //Repositories
  locator.registerLazySingleton<IUserRepository>(() => UserRepository());
  locator.registerLazySingleton<IHomeRepository>(() => HomeRepository());
  locator.registerLazySingleton<IfoRepository>(() => InfoRepository());

  //DataSources
  locator.registerLazySingleton<UserRemotoDataSource>(() => UserRemotoDataSource());
  locator.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource());
  locator.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource());
  locator.registerLazySingleton<InfoRemoteDataSource>(() => InfoRemoteDataSource());


  //UseCases
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase());
  locator.registerLazySingleton<PackageInfoUserUseCase>(() => PackageInfoUserUseCase());
  locator.registerLazySingleton<GetDataCovidUseCase>(() => GetDataCovidUseCase());
  locator.registerLazySingleton<GetCurrentstateUseCase>(() => GetCurrentstateUseCase());
  locator.registerLazySingleton<GetStateInfoUseCase>(() => GetStateInfoUseCase());

  //api
  locator.registerLazySingleton<CovidAPi>(() => CovidAPi());
}
