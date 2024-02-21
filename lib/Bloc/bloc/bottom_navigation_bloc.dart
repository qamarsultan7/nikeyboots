// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState()) {
    on<ChangePage>(_ChangePage);
    on<Update>(_upDateShoeSize);
  }

  void _ChangePage(ChangePage event, Emitter<BottomNavigationState> emit) {
    emit(state.CopyWith(page: event.page));
  }

  void _upDateShoeSize(Update event, Emitter<BottomNavigationState> emit) {
    emit(state.CopyWith(shoesize: event.size));
  }
}
