import 'package:covid19/core/presentation/pages/home/home_view_model.dart';
import 'package:covid19/core/presentation/pages/splash/splash_view_model.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'core/di/di_locator.dart';
import 'core/presentation/pages/login/login_view_model.dart';
import 'core/presentation/pages/splash/splash_view.dart';
import 'core/presentation/path/path_generator.dart';
import 'core/presentation/utils/theme_helper.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashViewModel>(create: (_) => locator<SplashViewModel>()),
        ChangeNotifierProvider<LoginViewModel>(create: (_) => locator<LoginViewModel>()),
        ChangeNotifierProvider<HomeViewModel>(create: (_) => locator<HomeViewModel>()),
      ],
      child: EasyDynamicThemeWidget(child: const MyApp())));
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
        theme:ThemeHelp().lightThemeData,
        darkTheme: ThemeHelp().darkThemeData,
        themeMode: EasyDynamicTheme.of(context).themeMode,
        home:  SplashScreen(),
        onGenerateRoute: RouterGenerator.generateRoute,
      );}
    );
  }
}

