import 'dart:math';

import 'package:covid19/core/data/models/state_info_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:covid19/core/presentation/utils/custom_info_card.dart';
import 'package:covid19/core/presentation/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info_view_model.dart';

class InfoDetailView extends StatelessWidget {
  final InfoViewModel _infoViewModel;

  InfoDetailView({super.key, required InfoViewModel? infoViewModel})
      : _infoViewModel = infoViewModel ?? locator<InfoViewModel>();

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).hintColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Theme.of(context).cardColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body:_dataInfo() ,
      );

  }

  Widget _dataInfo(){
    return Consumer(
     builder: (BuildContext context, InfoViewModel model, Widget? child) {
       print('InfoDetailView ${model.data}');
       return FutureBuilder<StateInfoModel>(
           future: model.getStateInfo(model.data.toLowerCase()),
           builder: (BuildContext context,
               AsyncSnapshot<StateInfoModel> snapshot) {
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
             return Center(
               child: Container(
                 decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                   color: getRandomColor(),
                  ),
                   padding: const EdgeInsets.all(20.0),
                   child: InfoCard(
                       title: snapshot.data!.name!??'',
                       info: snapshot.data!.notes!.toString()??'',
                       imageUrl: snapshot.data!.state!)
               ),
             );
           }
       );
     });
  }

  Color getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  Widget _noItem(){
    return getLottieFromJson(
        fit: BoxFit.contain, height: 300, lottie: kWrongRoute,repeat: true);
  }
}
