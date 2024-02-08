import 'package:covid19/core/data/models/state_current_model.dart';
import 'package:covid19/core/data/models/state_info_model.dart';

abstract class IfoRepository {
  Future <List<StateCurrentModel>> getCurrentState();
  Future <StateInfoModel> getStateInfo(String state);
}