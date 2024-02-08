import 'package:covid19/core/data/dtos/state_current_model_dto.dart';
import 'package:covid19/core/data/models/state_current_model.dart';
import 'package:covid19/core/di/di_locator.dart';

import 'i_info_repository.dart';
import 'info_remote_data_source.dart';

class InfoRepository implements IfoRepository {
  final InfoRemoteDataSource _infoRemoteDataSource;

  InfoRepository({
    InfoRemoteDataSource? infoRemoteDataSource,
  }) : _infoRemoteDataSource = infoRemoteDataSource ??
      locator<InfoRemoteDataSource>();


  @override
  Future <List<StateCurrentModel>> getCurrentState() async {
    final List<StateCurrentModelDto?> stateCurrentModelDtos = await _infoRemoteDataSource.getCurrentState();
    final List<StateCurrentModel> stateCurrentModels = stateCurrentModelDtos.map((dto) => StateCurrentModel.fromStateCurrentModelDto(model: dto!)).toList();
    return stateCurrentModels;
  }

}
