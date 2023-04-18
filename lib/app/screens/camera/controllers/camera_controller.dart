import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';

class CameraController extends GetxController {
  final webSocketController = Get.put(WebSocketController());
  //TODO : set camera zoom and dome to 0 each time the app opens ==> so it wouldn't be affected by other apps

  //
  RxBool buttonPressed = true.obs; // our observable

  // swap true/false & save it to observable
  void toggle() => buttonPressed.value = buttonPressed.value ? false : true;

  //HOME
  VlcPlayerController controller3 = VlcPlayerController.network(
    // '',
    'cam3',
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
  );

//HOME
  VlcPlayerController controller4 = VlcPlayerController.network(
    // '',
    'cam4',
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
  );
  @override
  void onInit() {
    super.onInit();
    controller3.initialize();
    controller4.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    controller3.dispose();
    controller4.dispose();
  }
}
