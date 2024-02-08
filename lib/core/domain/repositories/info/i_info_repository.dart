import 'package:covid19/core/data/models/state_current_model.dart';

abstract class IfoRepository {
  Future <List<StateCurrentModel>> getCurrentState();
}