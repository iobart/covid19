import 'package:covid19/core/data/models/state_info_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/repositories/info/i_info_repository.dart';

class GetStateInfoUseCase {
  final IfoRepository _infoRepository;

  GetStateInfoUseCase({IfoRepository? infoRepository})
      : _infoRepository = infoRepository ??locator<IfoRepository>();

  Future<StateInfoModel> invoke(String state) async {
    return await _infoRepository.getStateInfo(state);
  }
}
