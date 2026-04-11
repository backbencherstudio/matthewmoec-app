import 'package:matthewmoec_app/features/charity/domain/entities/charity_entity.dart';

abstract class CharityRepository {
  Future<List<CharityEntity>> getLastMonthCharities();
}