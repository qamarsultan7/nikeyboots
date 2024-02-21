// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nikeyboots/Hive/Models/hive_model.dart';
import 'package:nikeyboots/Hive/boxes.dart';

part 'billcounter_event.dart';
part 'billcounter_state.dart';

class BillcounterBloc extends Bloc<BillcounterEvent, BillcounterState> {
  BillcounterBloc() : super(const BillcounterState()) {
    on<BillCount>(_getTotalBill);
    on<UpdateOpacity>(_updateOpacity);
  }

  void _getTotalBill(BillCount event, Emitter<BillcounterState> emit) {
    emit(state.copyWith(bill: getTotalBill()));
  }

  void _updateOpacity(UpdateOpacity event, Emitter<BillcounterState> emit) {
    emit(state.copyWith(opacity: event.opacity));
  }
}

double getTotalBill() {
  final box = Boxes.getCartData();
  double total = 0;
  for (var i = 0; i < box.length; i++) {
    final item = box.getAt(i) as CartModel;
    total += item.price;
  }
  return total;
}
