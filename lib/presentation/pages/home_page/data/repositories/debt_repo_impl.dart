import 'package:dartz/dartz.dart';
import 'package:debt_example/config/errors/failures.dart';
import 'package:debt_example/config/network/network_info.dart';
import 'package:debt_example/presentation/pages/home_page/data/data_sources/debt_locale_datasource.dart';
import 'package:debt_example/presentation/pages/home_page/data/data_sources/debt_remote_datasource.dart';
import 'package:debt_example/presentation/pages/home_page/domain/repositories/debt_repository.dart';

class DebtRepositoryImpl implements DebtRepository {
  final NetworkInfo networkInfo;
  final DebtRemoteDatasourceImpl remoteDatasourceImpl;
  final DebtLocaleDatasourceImpl localeDatasourceImpl;

  DebtRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatasourceImpl,
    required this.localeDatasourceImpl,
  });

  @override
  Future<Either<Failure, dynamic>> getDebtData() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDatasourceImpl.getDebtData();
        return Right(result);
      } on ServerFailure {
        return const Left(ServerFailure("Ошибка при загрузке данных!"));
      }
    } else {
      final res = await localeDatasourceImpl.getDebtData();
      return Right(res);
    }
  }
}
