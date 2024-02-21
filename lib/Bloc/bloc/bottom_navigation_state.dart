// ignore_for_file: non_constant_identifier_names

part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  final int seletedPage;

  const BottomNavigationState({this.seletedPage = 0});

  BottomNavigationState CopyWith({int? page, int? shoesize}) {
    return BottomNavigationState(
      seletedPage: page ?? seletedPage,
    );
  }

  @override
  List<Object> get props => [
        seletedPage,
      ];
}
