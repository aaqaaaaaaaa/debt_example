import 'package:dartz/dartz.dart';
import 'package:debt_example/config/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
