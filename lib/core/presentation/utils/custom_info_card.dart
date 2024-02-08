import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:flutter/material.dart';

import 'image_utils.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String info;
  final String imageUrl;

  InfoCard({required this.title, required this.info, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(info),
            ),
            Image.network('https://flagsapi.com/${imageUrl}/flat/64.png',errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return getLottieFromJson(
                  fit: BoxFit.contain, height: 100, lottie: kWrongRoute,repeat: true);
            },),
          ],
        ),
      ),
    );
  }
}
