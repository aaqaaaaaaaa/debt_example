part of 'debt_cubit.dart';

@immutable
abstract class DebtState {}

class DebtInitial extends DebtState {}

class DebtLoadingState extends DebtState {}

class DebtLoadedState extends DebtState {
  final List<DebtModel> data;

  DebtLoadedState(this.data);
}

class DebtFailureState extends DebtState {
  final String message;

    DebtFailureState(this.message);
}
