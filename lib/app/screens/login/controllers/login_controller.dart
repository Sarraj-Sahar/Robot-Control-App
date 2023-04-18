import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:p_guard/app/models/login_request_model.dart';
import 'package:p_guard/app/models/login_response_model.dart';
import 'package:p_guard/app/routes/routes.dart';
import 'package:p_guard/app/services/auth_services.dart';

//This is where all our logic goes
//with controllers there is no more need to use stateful widgets
//onInit() and onClose() methods essentially replace the
//initState() and dispose() methods of the StatefulWidget

class LoginController extends GetxController {
  // WebSocketController webSocketController = Get.put(WebSocketController());
  RxBool isloading = false.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  String email = '', password = '';

  final storage = GetStorage();

//1.we need to initiliaze our controllers
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

//2.Once initialized Controllers will keep on "listening"
// for any changes in the "txtfield"
//So we need to dispose them -> liberate memory space

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

// 3.We use GetUtils for
// "Internal" Form validation : email,pwd format...
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePasword(String value) {
    if (value.length < 6) {
      return "Invalid password length";
    } else {
      return null;
    }
  }

  //4.doLogin : requires form validation

  doLogin() async {
    //Validates every FormField of this form
    //& returns true if there are no errors.
    bool isValidated = loginFormKey.currentState!.validate();

    if (isValidated) {
      isloading(true);
      try {
        var data = await AuthServices.login(LoginRequestModel(
            email: emailController.text, password: passwordController.text));
        if (data!.runtimeType == LoginResponseModel) {
          //Saving access Token and Username and email
          await storage.write("username", data.username);
          await storage.write("email", data.email);
          await storage.write("token", data.tokens.acces);
          Get.offAllNamed(Routes.mainScreen);
          //TODO : reconnect to socket on login
          // webSocketController.connectToSocket();

        } else {
          //STYLE : invalid credentials login
          Get.defaultDialog(
              middleText: data,
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
        }
      } finally {
        //we use finally to treminate loading even if form is not valid
        // so it won't load forever
        isloading(false);
      }
    }
  }
}
