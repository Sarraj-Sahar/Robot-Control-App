import 'package:get/get.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';
import '../../main_screen.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController(), fenix: true);
    Get.lazyPut(() => WebSocketController(), fenix: true);
  }
}
