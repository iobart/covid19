import 'package:covid19/core/presentation/pages/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'core/di/di_locator.dart';
import 'core/presentation/pages/login/login_view_model.dart';
import 'core/presentation/pages/splash/splash_view.dart';
import 'core/presentation/path/path_generator.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashViewModel>(create: (_) => locator<SplashViewModel>()),
        ChangeNotifierProvider<LoginViewModel>(create: (_) => locator<LoginViewModel>())
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          canvasColor: Colors.orange,),
        home:  SplashScreen(),
        onGenerateRoute: RouterGenerator.generateRoute,
      );}
    );
  }
}

