import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:task_manager/bloc/priority_color/priority_color_bloc.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';
import 'package:task_manager/models/priority_color.dart';
import 'package:task_manager/widgets/error_widget.dart';

class ColorPicker extends StatefulWidget {
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

// Color is chosen by the user for each priority value
class _ColorPickerState extends State<ColorPicker> {
  List<Color> currentColor = List<Color>();
  int index;

  @override
  Widget build(BuildContext context) {
    final priorityBloc = BlocProvider.of<PriorityColorBloc>(context);
    priorityBloc.add(GetPriorityColorsEvent());
    final width =  MediaQuery.of(context).size.width;
    final height =  MediaQuery.of(context).size.height;
    return  BlocBuilder<PriorityColorBloc,PriorityColorState>(
        builder: (context, state) {
          if(state is GetPriorityColorsState){
            state.priorityColorList.forEach((element) => currentColor.add(convertColor(element.color)));
            return Column(
              children: [
            SizedBox(
            width: width * 2 / 3,
              height: MediaQuery.of(context).size.height * 1 / 10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        width: width * 2 / 15,
                        height: height * 1 / 40,
                        color: currentColor[index],
                      ),
                      onTap: () {
                        index = index;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding: const EdgeInsets.all(0.0),
                              contentPadding: const EdgeInsets.all(0.0),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: currentColor[index],
                                  onColorChanged: (color){
                                    setState(() {
                                      currentColor[index] = color;
                                      BlocProvider.of<PriorityColorBloc>(context).add(UpdatePriorityColorEvent(priorityColor: PriorityColor(index + 1, color.toString())));
                                      Navigator.pop(context);
                                    });
                                  },
                                  enableLabel: true,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }),
            ),
                SizedBox(height: MediaQuery.of(context).size.height * 1/40,),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.blueGrey)),
                  child: Text("Save"),
                  onPressed: () {
                    BlocProvider.of<TaskBloc>(context).add(GetTasksEvent());
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
          else{
            return TaskErrorWidget();
          }
        }
        );
  }

  convertColor(priorityColor){
    var color = priorityColor;
    var valueString = color.split('(0x')[1].split(')')[0];
    var value = int.parse(valueString, radix: 16);
    var otherColor = new Color(value);
    return otherColor;
  }
}
