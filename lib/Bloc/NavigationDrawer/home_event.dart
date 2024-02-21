part of 'home_bloc.dart';

abstract class NavigationDrawerEvent extends Equatable {
  const NavigationDrawerEvent();

  @override
  List<Object> get props => [];
}

class SetNavigationDrawer extends NavigationDrawerEvent {
  final double rotate;
  final double offsetX;
  final double offsetY;
  final double scalefactor;
  final bool sideopen;
  const SetNavigationDrawer(
      {required this.rotate,
      required this.offsetX,
      required this.offsetY,
      required this.scalefactor,
      required this.sideopen});
  @override
  List<Object> get props => [rotate, offsetX, offsetY, scalefactor, sideopen];
}
