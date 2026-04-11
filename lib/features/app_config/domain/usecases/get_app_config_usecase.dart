import 'package:matthewmoec_app/features/app_config/domain/entities/app_entity.dart';
import 'package:matthewmoec_app/features/app_config/domain/repositories/app_repository.dart';

class GetAppConfigUsecase {
  final AppRepository _appRepository;

  GetAppConfigUsecase(this._appRepository);

  Future<AppEntity> call() {
    return _appRepository.getAppConfig();
  }
}