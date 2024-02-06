import 'package:flutter/cupertino.dart';

class SplashViewModel extends ChangeNotifier {
  double _loadingPercent = 0.0;


  double get loadingPercent => _loadingPercent;

  set loadingPercent(double value) {
    _loadingPercent = value;
    notifyListeners();
  }
}