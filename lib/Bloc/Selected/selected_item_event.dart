part of 'selected_item_bloc.dart';

abstract class SelectedItemEvent extends Equatable {
  const SelectedItemEvent();

  @override
  List<Object> get props => [];
}

class UpdateShoeSize extends SelectedItemEvent {
  final int selected;
  const UpdateShoeSize({required this.selected});
  @override
  List<Object> get props => [selected];
}

class UpdateSeletedType extends SelectedItemEvent {
  final int selected;
  const UpdateSeletedType({required this.selected});
  @override
  List<Object> get props => [selected];
}
