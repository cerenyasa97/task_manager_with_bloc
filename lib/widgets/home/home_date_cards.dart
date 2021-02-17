import 'package:flutter/material.dart';
import 'package:task_manager/utils/constants.dart';

class HomeDateCards extends StatelessWidget {
  final int index;

  HomeDateCards({@required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 11 / 60,
        height: MediaQuery.of(context).size.height * 1 / 7,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 1 / 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.width * 1 / 20),
          border: Border.all(
              color: Constants.lightGrey,
              width: MediaQuery.of(context).size.width * 1 / 120),
        ),
        child: Padding(
          padding:
          index == 0 ? EdgeInsets.only(top: MediaQuery.of(context).size.height * 1 / 45) : EdgeInsets.only(top: MediaQuery.of(context).size.height * 1 / 75),
          child: Column(
            children: [
              Text(
                index == 0 ? "All Tasks" : (DateTime.now().day + index).toString(),
                style: TextStyle(
                    fontSize: index == 0 ? MediaQuery.of(context).size.width * 1 / 18 : MediaQuery.of(context).size.width * 1 / 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
              Text(
                index == 0 ? " " : Constants.getCurrentMonth(DateTime.now().month - 1),
                style: TextStyle(
                    fontSize: index == 0 ? 0 : MediaQuery.of(context).size.width * 1 / 20,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: (){

      },
    );
  }
}
