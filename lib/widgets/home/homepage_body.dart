import 'package:flutter/material.dart';
import 'package:task_manager/widgets/days_task/days_bottom_widget.dart';

import 'home_Background.dart';
import 'home_bottom_widget.dart';
import 'home_date_list.dart';

class HomepageBody extends StatelessWidget {
  final BuildContext context;

  HomepageBody({@required this.context});

  @override
  Widget build(BuildContext context) {
    context = this.context;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Stack(
            children: [
              HomeBackground(),
              DateList(context: context),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 1/35),
              child: HomeBottomWidget(),
            ),
          )
        ],
      ),
    );
  }
}
