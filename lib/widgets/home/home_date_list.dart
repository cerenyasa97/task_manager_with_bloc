import 'package:flutter/material.dart';
import 'home_date_cards.dart';


class DateList extends StatelessWidget {

  final BuildContext context;

  DateList({@required this.context});

  @override
  Widget build(BuildContext context) {
    context = this.context;
    return Positioned(
      top: MediaQuery.of(context).size.height * 1/16,
      left: MediaQuery.of(context).size.width * 1/20,
      right: MediaQuery.of(context).size.width * 1/20,
      child: Container(
        width: MediaQuery.of(context).size.width * 9/10,
        height: MediaQuery.of(context).size.height * 1/7,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index){
            return HomeDateCards(index: index, context: context);
          },
        ),
      ),
    );
  }
}
