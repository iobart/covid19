import 'package:covid19/core/data/models/state_current_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:covid19/core/presentation/constansts/route_constant.dart';
import 'package:covid19/core/presentation/pages/info/info_view_model.dart';
import 'package:covid19/core/presentation/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class InfoView extends StatelessWidget {
  final InfoViewModel _homeViewModel;

  InfoView({super.key, required InfoViewModel? homeViewModel})
      : _homeViewModel = homeViewModel ?? locator<InfoViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).hintColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).cardColor),
          onPressed: () {
            Navigator.pushReplacementNamed(context, homeRoute);
          },
        ),
      ),
      body: FutureBuilder<List<StateCurrentModel>>(
        future: _homeViewModel.getCurrentState(),
        builder: (BuildContext context,
            AsyncSnapshot<List<StateCurrentModel>> snapshot) {
          if (snapshot.hasError) {
            return _noItem();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return Center(
              child: _noItem(),
            );
          }
          return Container(
            padding: const EdgeInsets.all(20.0),
            color: Theme.of(context).cardColor,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.0.h,
                      child: ListView(
                        children: snapshot.data!
                            .map((data) => CustomListTile(
                                  imagePath:
                                      'https://flagsapi.com/${data.state}/flat/64.png',
                                  text: '${data.state}',
                                  subtitle:
                                      'Casos Totales ${data.totalTestsViral ?? 0}',
                                  aditionalInfo:
                                      'Ultima Modificación ${DateFormat.yMMMMd().format(data.dateModified??DateTime.now()) ?? ''}',
                                  icon: Icons.arrow_forward_ios,
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _noItem() {
    return getLottieFromJson(
        fit: BoxFit.contain, height: 300, lottie: kWrongRoute, repeat: true);
  }
}

class CustomListTile extends StatelessWidget {
  final String imagePath;
  final String text;
  final String aditionalInfo;
  final IconData icon;
  final String subtitle;

  const CustomListTile(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.icon,
      required this.subtitle,
      required this.aditionalInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(color: Colors.grey),
        Consumer(
          builder: (context, InfoViewModel model, child) {
            return ListTile(
              onTap: () {
                model.setData(text);
                Navigator.pushNamed(context, detailRoute);
              },
              leading: Image.network(
                imagePath,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(kLogoCovid);
                },
              ),
              title: Text(text),
              subtitle: Column(
                children: [Text(subtitle), Text(aditionalInfo)],
              ),
              trailing: Icon(icon),
            );
          },
        ),
      ],
    );
  }
}
