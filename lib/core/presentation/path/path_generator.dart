import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:covid19/core/presentation/constansts/route_constant.dart';
import 'package:covid19/core/presentation/pages/home/home_view.dart';
import 'package:covid19/core/presentation/pages/home/home_view_model.dart';
import 'package:covid19/core/presentation/pages/info/info_detail_view.dart';
import 'package:covid19/core/presentation/pages/info/info_view.dart';
import 'package:covid19/core/presentation/pages/info/info_view_model.dart';
import 'package:covid19/core/presentation/pages/login/login_view.dart';
import 'package:covid19/core/presentation/pages/login/login_view_model.dart';
import 'package:covid19/core/presentation/utils/image_utils.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        final LoginViewModel viewModel = settings.arguments != null
            ? settings.arguments as LoginViewModel
            : LoginViewModel();
        return MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                LoginView(loginViewModel: viewModel));
      case homeRoute:
        final HomeViewModel viewModel = settings.arguments != null
            ? settings.arguments as HomeViewModel
            : HomeViewModel();
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => HomeView(
                  homeViewModel: viewModel,
                ));
      case stateRoute:
        final InfoViewModel viewModel = settings.arguments != null
            ? settings.arguments as InfoViewModel
            : InfoViewModel();
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => InfoView(
                  homeViewModel: viewModel,
                ));

      case detailRoute:
        final InfoViewModel viewModel = settings.arguments != null
            ? settings.arguments as InfoViewModel
            : InfoViewModel();
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => InfoDetailView(
               infoViewModel: viewModel,
                ));
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getLottieFromJson(
                      fit: BoxFit.contain, height: 300, lottie: kWrongRoute),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, loginRoute),
                    child: const Text('Volver'),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
