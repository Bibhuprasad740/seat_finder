import 'package:flutter/material.dart';
import 'package:seat_finder/global_variables.dart';

class Seat extends StatelessWidget {
  final bool isSelected;
  final int seatNo;
  const Seat({
    Key? key,
    required this.seatNo,
    this.isSelected = false,
  }) : super(key: key);

  String getLabel(int seatNo) {
    if (seatNo % 8 == 1 || seatNo % 8 == 4) {
      return 'Lower';
    } else if (seatNo % 8 == 2 || seatNo % 8 == 5) {
      return 'Middle';
    } else if (seatNo % 8 == 3 || seatNo % 8 == 6) {
      return 'Upper';
    } else if (seatNo % 8 == 7) {
      return 'Side Lower';
    } else {
      return 'Side Upper';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? GlobalVariables.selectedColor
            : Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            seatNo.toString(),
            style: TextStyle(
              fontSize: 20,
              color: isSelected
                  ? Theme.of(context).canvasColor
                  : Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            getLabel(seatNo),
            style: TextStyle(
              fontSize: 9,
              color: isSelected
                  ? Theme.of(context).canvasColor
                  : Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
