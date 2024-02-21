part of 'bottom_navigation_bloc.dart';

class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class ChangePage extends BottomNavigationEvent {
  final int page;
  const ChangePage({required this.page});
  @override
  List<Object> get props => [page];
}

class Update extends BottomNavigationEvent {
  final int size;
  const Update({required this.size});
  @override
  List<Object> get props => [size];
}