import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double loadingPercent = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        loadingPercent = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_imageLogo(), _linearProgressIndicator()],
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

  Widget _linearProgressIndicator() {
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
              value: loadingPercent,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${(loadingPercent * 100).toInt()}%',
            style: TextStyle(fontSize: 1.7.h),
          ),
        ],
      ),
    );
  }
}
