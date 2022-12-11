import 'package:dartz/dartz.dart';
import 'package:debt_example/config/errors/failures.dart';
import 'package:debt_example/presentation/pages/home_page/domain/repositories/debt_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../../config/usescases/usecase.dart';

class DebtUsescase extends UseCase<dynamic, DebtParams> {
  DebtRepository repository;

  DebtUsescase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(DebtParams params) {
    return repository.getDebtData();
  }
}

class DebtParams extends Equatable {

  @override
  List<Object?> get props => [];
}
