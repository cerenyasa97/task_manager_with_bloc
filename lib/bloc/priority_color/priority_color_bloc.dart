import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/priority_color_repository.dart';
import 'package:task_manager/locator/service_locator.dart';
import 'package:task_manager/models/priority_color.dart';

part 'priority_color_event.dart';
part 'priority_color_state.dart';

class PriorityColorBloc extends Bloc<PriorityColorEvent, PriorityColorState> {

  final PriorityColorRepository colorRepository = locator<PriorityColorRepository>();

  PriorityColorBloc() : super(PriorityColorInitial());

  @override
  Stream<PriorityColorState> mapEventToState(
    PriorityColorEvent event,
  ) async* {
    if(event is GetPriorityColorsEvent){
      try{
        final colorList = await colorRepository.getPriorityColors();
        yield GetPriorityColorsState(priorityColorList: colorList);
      }
      catch(_){
        yield GetPriorityColorErrorState();
      }
    }
    if(event is UpdatePriorityColorEvent){
      try{
        await colorRepository.updatePriorityColor(event.priorityColor);
        yield UpdatePriorityColorState();
      }
      catch(_){
        yield UpdatePriorityColorErrorState();
      }
    }
  }
}
