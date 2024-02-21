part of 'selected_item_bloc.dart';

class SelectedItemState extends Equatable {
  final int seletedType;
  final int sletedShoeSize;
  const SelectedItemState({this.seletedType = 0, this.sletedShoeSize = 0});
  SelectedItemState copyWith({int? seletedType, sletedShoeSize}) {
    return SelectedItemState(
        seletedType: seletedType ?? this.seletedType,
        sletedShoeSize: sletedShoeSize ?? this.sletedShoeSize);
  }

  @override
  List<Object> get props => [seletedType,sletedShoeSize];
}
