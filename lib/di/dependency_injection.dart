import 'package:debt_example/config/network/network_info.dart';
import 'package:debt_example/presentation/pages/home_page/data/data_sources/debt_locale_datasource.dart';
import 'package:debt_example/presentation/pages/home_page/data/data_sources/debt_remote_datasource.dart';
import 'package:debt_example/presentation/pages/home_page/data/repositories/debt_repo_impl.dart';
import 'package:debt_example/presentation/pages/home_page/domain/repositories/debt_repository.dart';
import 'package:debt_example/presentation/pages/home_page/domain/use_cases/debt_usescase.dart';
import 'package:debt_example/presentation/pages/home_page/presentation/manager/debt_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final di = GetIt.instance;

//di is referred to as Service Locator

Future<void> init() async {
  /// bloc
  di.registerFactory(
    () => DebtCubit(debtUsescase: di()),
  );



  ///********************************************************///
  ///
  ///Repositories

  di.registerLazySingleton<DebtRepository>(
    () => DebtRepositoryImpl(
      localeDatasourceImpl: di(),
      networkInfo: di(),
      remoteDatasourceImpl: di(),
    ),
  );
  ///********************************************************///
  ///
  /// Data sources

  di.registerLazySingleton(
        () => DebtLocaleDatasourceImpl(),
  );

  di.registerLazySingleton(
        () => DebtRemoteDatasourceImpl(),
  );


  ///********************************************************///
  /// UsesCases

  ///**********
  di.registerLazySingleton(() => DebtUsescase(repository: di()));

  ///**********


  ///********************************************************///
  /// Network
  di.registerLazySingleton<http.Client>(() => http.Client());

  /// Network Info
  di.registerLazySingleton(() => InternetConnectionChecker());

  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));
}
