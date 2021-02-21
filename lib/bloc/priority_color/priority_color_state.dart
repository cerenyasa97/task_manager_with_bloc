part of 'priority_color_bloc.dart';

abstract class PriorityColorState extends Equatable {
  const PriorityColorState();
}

class PriorityColorInitial extends PriorityColorState {
  @override
  List<Object> get props => [];
}

class GetPriorityColorsState extends PriorityColorState{
  final List<PriorityColor> priorityColorList;

  GetPriorityColorsState({@required this.priorityColorList});

  @override
  // TODO: implement props
  List<Object> get props => [priorityColorList];
}

class GetPriorityColorErrorState extends PriorityColorState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UpdatePriorityColorState extends PriorityColorState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UpdatePriorityColorErrorState extends PriorityColorState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}