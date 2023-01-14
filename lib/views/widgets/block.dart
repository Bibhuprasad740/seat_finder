import 'dart:math';

import 'package:flutter/material.dart';
import 'package:seat_finder/controllers/seat_controller.dart';
import 'package:seat_finder/views/widgets/seat.dart';

class Block extends StatefulWidget {
  final int initindex;
  const Block({
    Key? key,
    required this.initindex,
  }) : super(key: key);

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  List<int> sequence = [0, 1, 2, -1, 6, 3, 4, 5, -1, 7];
  List<int>? seatNos;

  @override
  void initState() {
    super.initState();
    seatNos = List.generate(
      8,
      (index) => (index + 1) + 8 * (widget.initindex - 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 30,
        crossAxisSpacing: 2,
      ),
      itemCount: sequence.length,
      itemBuilder: (context, index) => sequence[index] == -1
          ? Container()
          : Seat(
              isSelected: SeatController.sController.value.text == ''
                  ? false
                  : int.parse(SeatController.sController.value.text) ==
                      (seatNos![sequence[index]]),
              seatNo: seatNos![sequence[index]],
            ),
    );
  }
}
