import 'package:covid19/core/data/models/state_current_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/entities/usecases/get_current_state_use_case.dart';
import 'package:flutter/material.dart';

class InfoViewModel extends ChangeNotifier {
  final GetCurrentstateUseCase _getCurrentStateUseCase;

  InfoViewModel({
    GetCurrentstateUseCase? getCurrentStateUseCase,
  }) : _getCurrentStateUseCase =
            getCurrentStateUseCase ?? locator<GetCurrentstateUseCase>();

  ///returns the current state of the covid
  Future <List<StateCurrentModel>> getCurrentState() async {
    final List<StateCurrentModel> info = await _getCurrentStateUseCase.invoke();
    return info;
  }
}
