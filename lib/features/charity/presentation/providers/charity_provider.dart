import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matthewmoec_app/core/network/api_client.dart';
import 'package:matthewmoec_app/features/charity/data/datasources/charity_remote_datasource.dart';
import 'package:matthewmoec_app/features/charity/data/repositories/charity_repository_impl.dart';
import 'package:matthewmoec_app/features/charity/domain/repositories/charity_repository.dart';
import 'package:matthewmoec_app/features/charity/domain/usecases/get_last_month_charities_usecase.dart';

final _apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final _charityRemoteDataSourceProvider = Provider<CharityRemoteDataSource>((ref) => CharityRemoteDataSourceImpl(ref.read(_apiClientProvider)));

final _charityRepositoryProvider = Provider<CharityRepository>((ref) => CharityRepositoryImpl(ref.read(_charityRemoteDataSourceProvider)));

final _getLastMonthCharitiesUsecaseProvider = Provider((ref) => GetLastMonthCharitiesUsecase(ref.read(_charityRepositoryProvider)));

final lastMonthCharityProvider = FutureProvider((ref) => ref.read(_getLastMonthCharitiesUsecaseProvider).call());