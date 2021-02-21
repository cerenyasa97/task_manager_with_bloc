import 'package:flutter/material.dart';
import 'package:task_manager/widgets/priority_color_page/background.dart';
import 'package:task_manager/widgets/priority_color_page/color_picker_card.dart';

class PriorityColorPicker extends StatefulWidget {
  @override
  _PriorityColorPickerState createState() => _PriorityColorPickerState();
}

// Structure of priority color
class _PriorityColorPickerState extends State<PriorityColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PriorityColorPageBackground(),
          ColorPickerCard(),
        ],
      ),
    );
  }
}
