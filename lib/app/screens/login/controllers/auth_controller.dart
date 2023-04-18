import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:p_guard/app/routes/routes.dart';

//EXTRA : See cacheManager ...
class AuthController extends GetxController {
  // WebSocketController webSocketController = Get.find();

  final isLogged = false.obs;
  late String token = "";

  String? getToken() {
    final box = GetStorage();
    return box.read(('token'));
  }

  String? printToken() {
    final token = getToken();
    return ("$token");
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove('token');
  }

  bool isAuth() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }

    return isLogged.value;
  }

  void logOut() {
    isLogged.value = false;

    removeToken();
    Get.toNamed(Routes.login);
    log("********* thisssssdiposeeeee websocketController");

    // thisdispose();
  }

//TODO : dispose stream when logout
//see : https://stackoverflow.com/questions/59380906/what-is-the-best-way-to-close-a-subject-receiving-a-infinite-stream-of-data
  // thisdispose() async {
  //   webSocketController.myStreamController.stream.drain();
  //   webSocketController.myStreamController.sink.close();
  //   webSocketController.myStreamController.close();
  //   // webSocketController.channel.sink.close();
  // }

  String? getName() {
    final box = GetStorage();
    return box.read(('username'));
  }

  String? getEmail() {
    final box = GetStorage();
    return box.read(('email'));
  }
}
