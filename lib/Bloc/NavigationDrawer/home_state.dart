// ignore_for_file: non_constant_identifier_names

part of 'home_bloc.dart';

class NavigationDrawerState extends Equatable {
  final double rotate;
  final double offsetX;
  final double offsetY;
  final double scalefactor;
  final bool sideopen;
  const NavigationDrawerState(
      {this.rotate = 0,
      this.offsetX = 0,
      this.offsetY = 0,
      this.scalefactor = 1,
      this.sideopen = false});
  NavigationDrawerState CopyWith({
    double? rotate,
    double? offsetX,
    double? offsetY,
    double? scalefactor,
    bool? sideopen,
  }) {
    return NavigationDrawerState(
        rotate: rotate ?? this.rotate,
        offsetX: offsetX ?? this.offsetX,
        offsetY: offsetY ?? this.offsetY,
        scalefactor: scalefactor ?? this.scalefactor,
        sideopen: sideopen ?? this.sideopen);
  }

  @override
  List<Object> get props => [rotate, offsetX, offsetY, scalefactor, sideopen];
}
