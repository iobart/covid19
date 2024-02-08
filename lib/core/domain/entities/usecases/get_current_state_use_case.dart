import 'package:covid19/core/data/models/state_current_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/domain/repositories/info/i_info_repository.dart';

class GetCurrentstateUseCase {
  final IfoRepository iFoRepository;

  GetCurrentstateUseCase({
    IfoRepository? iFoRepository,
}): iFoRepository = iFoRepository ?? locator<IfoRepository>();

  Future <List<StateCurrentModel>>invoke() async {
    return await iFoRepository.getCurrentState();
  }
}
