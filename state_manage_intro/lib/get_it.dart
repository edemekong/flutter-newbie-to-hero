import 'package:get_it/get_it.dart';
import 'package:state_manage_intro/storage_service.dart';

class GetItService {
  static final getIt = GetIt.instance;
  static initializeGetIt() {
    getIt.registerSingleton<StorageService>(StorageService());
  }
}
