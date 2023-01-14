import 'package:get/get.dart';
import 'package:seat_finder/controllers/seat_controller.dart';
import 'package:seat_finder/controllers/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(
      () => ThemeController(),
      fenix: true,
    );
    Get.lazyPut<SeatController>(
      () => SeatController(),
      fenix: true,
    );
  }
}
