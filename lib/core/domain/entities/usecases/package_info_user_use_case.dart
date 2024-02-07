
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoUserUseCase {
  Future<PackageInfo>  invoke() async {
    final info= await PackageInfo.fromPlatform();
    return info;
  }
}