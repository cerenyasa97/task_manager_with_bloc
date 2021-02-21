part of 'priority_color_bloc.dart';

abstract class PriorityColorEvent extends Equatable {
  const PriorityColorEvent();
}

class GetPriorityColorsEvent extends PriorityColorEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class UpdatePriorityColorEvent extends PriorityColorEvent{

  final PriorityColor priorityColor;

  UpdatePriorityColorEvent({@required this.priorityColor});

  @override
  // TODO: implement props
  List<Object> get props => [priorityColor];
}