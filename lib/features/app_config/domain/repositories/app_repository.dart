import 'package:matthewmoec_app/features/app_config/domain/entities/app_entity.dart';

abstract class AppRepository {
  Future<AppEntity> getAppConfig();
}