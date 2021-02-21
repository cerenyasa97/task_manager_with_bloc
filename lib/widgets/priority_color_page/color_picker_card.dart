import 'package:flutter/material.dart';
import 'package:task_manager/widgets/priority_color_page/color_picker.dart';
import 'package:task_manager/widgets/priority_color_page/priority_values.dart';

class ColorPickerCard extends StatefulWidget {
  @override
  _ColorPickerCardState createState() => _ColorPickerCardState();
}

//Structure that allows the user to set the priority colors
class _ColorPickerCardState extends State<ColorPickerCard> {
  final TextStyle style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: width * 7 / 9,
        height: height * 2 / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Priority Colors",
                style: style,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Unimportant",
                    style: style,
                  ),
                  Text(
                    "Important",
                    style: style,
                  ),
                ],
              ),
              PriorityValues(),
              ColorPicker(),
            ],
          ),
        ),
      ),
    );
  }
}
