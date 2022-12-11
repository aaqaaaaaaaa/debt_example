import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:debt_example/config/errors/failures.dart';
import 'package:debt_example/presentation/pages/home_page/data/models/debt_model.dart';
import 'package:debt_example/presentation/pages/home_page/domain/use_cases/debt_usescase.dart';
import 'package:meta/meta.dart';

part 'debt_state.dart';

class DebtCubit extends Cubit<DebtState> {
  DebtCubit({required this.debtUsescase}) : super(DebtInitial());
  final DebtUsescase debtUsescase;

  FutureOr<void> getDebtData() async {
    emit(DebtLoadingState());
    final result = await debtUsescase(DebtParams());
    result.fold(
        (failure) => {
              if (failure is NoConnectionFailure)
                {emit(DebtFailureState('Нет соеинения с  интернетом!'))}
            },
        (r) => {
              if (r.isNotEmpty)
                {
                  emit(DebtLoadedState(r)),
                }
              else
                {emit(DebtFailureState('Ошибка при загрузке!'))}
            });
  }
}
