import 'package:covid19/core/data/models/state_current_model.dart';
import 'package:covid19/core/data/models/state_info_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/entities/usecases/get_current_state_use_case.dart';
import 'package:covid19/core/domain/entities/usecases/get_state_info_use_case.dart';
import 'package:flutter/material.dart';

class InfoViewModel extends ChangeNotifier {
  final GetCurrentstateUseCase _getCurrentStateUseCase;
  final GetStateInfoUseCase _getStateInfoUseCase;
  InfoViewModel({
    GetCurrentstateUseCase? getCurrentStateUseCase,
    GetStateInfoUseCase? getStateInfoUseCase,
  }) : _getStateInfoUseCase = getStateInfoUseCase ?? locator<GetStateInfoUseCase>(),
        _getCurrentStateUseCase =
            getCurrentStateUseCase ?? locator<GetCurrentstateUseCase>();

  ///returns the current state of the covid
  Future <List<StateCurrentModel>> getCurrentState() async {
    final List<StateCurrentModel> info = await _getCurrentStateUseCase.invoke();
    return info;
  }

  Future<StateInfoModel> getStateInfo(String state) async {
    final StateInfoModel stateInfo = await _getStateInfoUseCase.invoke(state);
    return stateInfo;
  }

  String _data = '';

  String get data => _data;

  void setData(String newData) {
    _data = newData;
    notifyListeners();
  }
}
