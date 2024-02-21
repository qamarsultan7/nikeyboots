part of 'billcounter_bloc.dart';

class BillcounterState extends Equatable {
  final double totalBill;
  final double opacity;
  const BillcounterState({this.totalBill = 0, this.opacity = 0});

  BillcounterState copyWith({double? bill, double? opacity}) {
    return BillcounterState(
        totalBill: bill ?? totalBill, opacity: opacity ?? this.opacity);
  }


  @override
  List<Object> get props => [totalBill, opacity];
}
