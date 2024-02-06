
import 'package:covid19/core/domain/entities/usecases/login_user_use_case.dart';
import 'package:covid19/core/domain/repositories/api/covid_api.dart';
import 'package:covid19/core/domain/repositories/user/i_user_repository.dart';
import 'package:covid19/core/domain/repositories/user/user_local_data_source.dart';
import 'package:covid19/core/domain/repositories/user/user_remote_data_source.dart';
import 'package:covid19/core/domain/repositories/user/user_repository.dart';
import 'package:covid19/core/presentation/pages/login/login_view_model.dart';
import 'package:covid19/core/presentation/pages/splash/splash_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance..allowReassignment  = true;

void setupLocator() {

  //viewModels
  locator.registerLazySingleton<SplashViewModel>(() => SplashViewModel());
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());

  //Repositories
  locator.registerLazySingleton<IUserRepository>(() => UserRepository());

  //DataSources
  locator.registerLazySingleton<UserRemotoDataSource>(() => UserRemotoDataSource());
  locator.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource());


  //UseCases
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase());

  //api
  locator.registerLazySingleton<CovidAPi>(() => CovidAPi());
}
