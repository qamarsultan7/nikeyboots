import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_item_event.dart';
part 'selected_item_state.dart';

class SelectedItemBloc extends Bloc<SelectedItemEvent, SelectedItemState> {
  SelectedItemBloc() : super(const SelectedItemState()) {
    on<UpdateShoeSize>(_updateShoeSize);
    on<UpdateSeletedType>(_sletedType);
  }
  void _updateShoeSize(UpdateShoeSize event, Emitter<SelectedItemState> emit) {
    emit(state.copyWith(sletedShoeSize: event.selected));
  }

  void _sletedType(UpdateSeletedType event, Emitter<SelectedItemState> emit) {
    emit(state.copyWith(seletedType: event.selected));
  }
}
