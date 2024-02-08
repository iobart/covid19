import 'package:covid19/core/data/models/covid_data_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:covid19/core/presentation/constansts/route_constant.dart';
import 'package:covid19/core/presentation/utils/custom_card.dart';
import 'package:covid19/core/presentation/utils/custom_info.dart';
import 'package:covid19/core/presentation/utils/image_utils.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel _homeViewModel;

  HomeView({super.key, required HomeViewModel? homeViewModel})
      : _homeViewModel = homeViewModel ?? locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon:  Icon(Icons.logout,color:Theme.of(context).hintColor),
                onPressed: () {
                  Navigator.popAndPushNamed(context, loginRoute);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, stateRoute);
          },
          backgroundColor: Theme.of(context).canvasColor,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Theme.of(context).cardColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _createLogoImage(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.9,
              bottom: 0,
              left: 0,
              right: 0,
              child: CardForm(child: _infoCovid()),
            ),

            Positioned(
              top: 25.h,
              left: 0,
              right: 0,
              child: _containerInfo(),
            ),
            Positioned(
                top: 52.h,
                left: 70.w,
                child: _createDarkModeToggle(
                    context))

          ],
        ));
  }

  Widget _infoCovid() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<CovidDataModel>(
          future: _homeViewModel.getDataCovid(),
          builder:
              (BuildContext context, AsyncSnapshot<CovidDataModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: _noItem());
            } else {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            CustomInfo(
                                titulo: snapshot.data!.totalTestResults.toString(),
                                data: 'Casos Totales'),
                            CustomInfo(
                                titulo: snapshot.data!.negative.toString(),
                                data: 'Pruebas Negativas'),
                            CustomInfo(
                                titulo: snapshot.data!.death.toString(),
                                data: 'Fallecidos'),
                            CustomInfo(
                                titulo: snapshot.data!.pending.toString(),
                                data: 'Pruebas Pendientes'),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            CustomInfo(
                                titulo: snapshot.data!.positiveIncrease.toString(),
                                data: 'Casos Confirmados'),
                            CustomInfo(
                                titulo:
                                    snapshot.data!.totalTestResultsIncrease.toString(),
                                data: 'Pruebas Positivas'),
                            CustomInfo(
                                titulo: snapshot.data!.recovered ?? '0'.toString(),
                                data: 'Recuperados'),
                          ],
                        ),
                      ),
                    ],
                  ),
                 const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021'))
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _noItem(){
    return getLottieFromJson(
        fit: BoxFit.contain, height: 300, lottie: kWrongRoute,repeat: true);
  }

  Widget _createDarkModeToggle(
      BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 5.0,
            offset: Offset(0, 1),
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.grey,
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.wb_sunny),
            color:  Colors.yellow,
            onPressed:(){ EasyDynamicTheme.of(context).changeTheme(dark: false);},
          ),
          IconButton(
            icon: const Icon(Icons.nights_stay),
            color:Colors.deepPurple,
            onPressed:()=>EasyDynamicTheme.of(context).changeTheme(dark: true),
          ),
        ],
      ),
    );
  }

  Widget _containerInfo() {
    return FutureBuilder<PackageInfo>(
      future: _homeViewModel.getPackageInfo(),
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: _noItem());
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoText(
                          _getDateFormatData(), 'Fecha Actual', 18, 16),
                      _buildInfoText('Marca del dispositivo',
                          snapshot.data!.packageName, 18, 16),
                      _buildInfoText('Modelo del Dispositivo',
                          snapshot.data!.appName, 18, 16),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoText('Nombre Dispositivo',
                          snapshot.data!.buildNumber, 18, 16),
                      _buildInfoText('Tipo de Dispositivo',
                          snapshot.data!.buildNumber, 18, 16),
                      _buildInfoText('Versión del Dispositivo',
                          snapshot.data!.version, 18, 16),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildInfoText(
      String title, String value, double titleFontSize, double valueFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: valueFontSize),
        ),
        const SizedBox(height: 15),
      ],
    );
  }


  String _getDateFormatData() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.jm().format(now);
    return formattedDate;
  }

  Widget _createLogoImage() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset(kLogoCovid, height: 15.h, width: 15.w),
          ),
          Expanded(
            flex: 2,
            child: Image.asset(kSitPerson, height: 30.h, width: 100.w),
          ),
        ],
      ),
    );
  }
}
