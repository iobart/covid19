import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:covid19/core/presentation/constansts/route_constant.dart';
import 'package:covid19/core/presentation/pages/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  final SplashViewModel? _splashViewModel;

  SplashScreen({super.key, SplashViewModel? splashViewModel})
      : _splashViewModel = splashViewModel ?? locator<SplashViewModel>();

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      widget._splashViewModel?.loadingPercent = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Consumer(
        builder: (_, SplashViewModel splashViewModel, __) {
          if (splashViewModel.loadingPercent == 1.0) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed(loginRoute);
            });
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _imageLogo(),
              _linearProgressIndicator(splashViewModel)
            ],
          );
        },
      ),
    );
  }

  Widget _imageLogo() {
    return Expanded(
      flex: 4,
      child: Container(
        padding: EdgeInsets.all(20.w), // Ajusta el valor a tus necesidades
        child: Image.asset(
          kLogoCovid,
        ),
      ),
    );
  }

  Widget _linearProgressIndicator(SplashViewModel splashViewModel) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Loading...',
            style: TextStyle(fontSize: 1.7.h),
          ),
          const SizedBox(height: 10),
          Container(
            width: 50.w,
            height: 2.h,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: Colors.black),
            ),
            child: LinearProgressIndicator(
              value: splashViewModel.loadingPercent,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${(splashViewModel.loadingPercent * 100).toInt()}%',
            style: TextStyle(fontSize: 1.7.h),
          ),
        ],
      ),
    );
  }
}
