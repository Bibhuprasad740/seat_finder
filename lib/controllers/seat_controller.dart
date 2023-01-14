import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatController extends GetxController {
  static SeatController instance = Get.find();

  static final Rx<TextEditingController> sController =
      TextEditingController().obs;
}
