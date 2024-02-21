// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class NavigationDrawerBloc extends Bloc<NavigationDrawerEvent, NavigationDrawerState> {
  NavigationDrawerBloc() : super(const NavigationDrawerState()) {
    on<SetNavigationDrawer>(_SetValues);
  }

  void _SetValues(SetNavigationDrawer event, Emitter<NavigationDrawerState> emit) {
    emit(state.CopyWith(
        rotate: event.rotate,
        offsetX: event.offsetX,
        offsetY: event.offsetY,
        scalefactor: event.scalefactor,
        sideopen: event.sideopen));
  }
}
