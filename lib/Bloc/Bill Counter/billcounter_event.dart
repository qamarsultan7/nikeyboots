part of 'billcounter_bloc.dart';

abstract class BillcounterEvent extends Equatable {
  const BillcounterEvent();
  @override
  List<Object> get props => [];
}

class BillCount extends BillcounterEvent {}

class UpdateOpacity extends BillcounterEvent {
  final double opacity;
  const UpdateOpacity({required this.opacity});
  @override
  List<Object> get props => [opacity];
}
