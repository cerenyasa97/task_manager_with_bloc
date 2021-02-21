import 'package:flutter/material.dart';

// Structure showing the user for which value the color she/he chooses
class PriorityValues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
        width: width * 7 / 9,
        height: height * 1 / 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(
                  width: width * 1 / 17,
                ),
                Container(
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 1 / 15,
                )
              ],
            );
          },
          itemCount: 5,
        ));
  }
}
