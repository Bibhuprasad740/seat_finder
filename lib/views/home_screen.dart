import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seat_finder/global_variables.dart';
import 'package:seat_finder/views/widgets/block.dart';
import 'package:seat_finder/views/widgets/seat.dart';

import '../controllers/seat_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final itemKey = GlobalKey();
  int seatNo = 0;
  List<int> sequence = [0, 1, 2, 6, 3, 4, 5, 7];
  List<int> seatNos = [];

  generate(int index) {
    int i = index + (pow(8, index - 1)) as int;
    for (; i < pow(8, index); i++) {
      seatNos.insert(sequence[i], i);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Your seat number!'),
        actions: [
          IconButton(
            onPressed: () => Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark),
            icon: const Icon(
              Icons.dark_mode,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Seat Finder',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  color: GlobalVariables.accentColor,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: GlobalVariables.accentColor,
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: SeatController.sController.value,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: FocusScope.of(context).unfocus,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: GlobalVariables.accentColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(13),
                              bottomRight: Radius.circular(13),
                            ),
                          ),
                          child: const Text(
                            'Find',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 3),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      width: 3,
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Block(initindex: index + 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
