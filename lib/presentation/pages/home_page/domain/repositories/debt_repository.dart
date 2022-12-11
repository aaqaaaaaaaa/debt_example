import 'package:dartz/dartz.dart';
import 'package:debt_example/config/errors/failures.dart';

abstract class DebtRepository {
  Future<Either<Failure, dynamic>> getDebtData();
}
