import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:person_portal/controller/login_controller.dart';
import 'package:person_portal/controller/person_profile_controller.dart';
import 'package:person_portal/controller/token_controller.dart';
import 'package:person_portal/helper/dialog_helper.dart';
import 'package:person_portal/repository/rest_repository.dart';
import 'package:person_portal/view/login_view.dart';
import 'package:person_portal/view/sign_up_profile_view.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final LoginController loginController = Get.find();
  final PersonProfileController profileController = Get.find();
  final tokenController = Get.put(TokenController());

  final TextEditingController userInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController passwordInputVerify = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                Obx(() => Center(
                    child: Lottie.asset(
                        loginController.canRegister.value
                            ? 'assets/animations/83227-happy-emoji.json'
                            : 'assets/animations/53391-yelly-emoji-no.json',
                        fit: BoxFit.fill,
                        repeat: true,
                        reverse: true,
                        animate: true,
                        width: 150,
                        height: 150))),
                // const Icon(
                //   Icons.person,
                //   size: 100,
                // ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                Obx(() => TextField(
                      controller: loginController.userName.value,
                      enabled: true,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        errorText:
                            loginController.emailValid.value ? null : 'Invalid email, please provide a valid email',
                        hintText: 'Provide email address.',
                        prefixIcon: const IconButton(
                          icon: Icon(null),
                          onPressed: null,
                        ),
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              loginController.userName.value.clear();
                              loginController.checkIfCanRegister();
                              // DialogHelper.showSnackBarError(
                              //     message: loginController.passwordValidityError.value, duration: 2);
                            }),
                        labelText: 'Email Address',
                      ),
                      onChanged: (value) {
                        loginController.checkIfCanRegister();
                      },
                    )),
                const SizedBox(height: 20),
                Obx(() => TextField(
                      controller: loginController.passWord.value,
                      obscureText: loginController.hidePassword.value,
                      enabled: true,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: () {
                            loginController.hidePassword.value = !loginController.hidePassword.value;
                          },
                        ),
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              loginController.passWord.value.clear();
                              loginController.checkIfCanRegister();
                            }),
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      onChanged: (value) {
                        loginController.checkIfCanRegister();
                      },
                    )),
                const SizedBox(height: 20),
                Obx(() => TextField(
                      controller: loginController.passwordVerify.value,
                      obscureText: loginController.hidePasswordVerify.value,
                      enabled: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        errorText: loginController.passwordsSame.value ? null : 'Passwords do not match.',
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        hintText: 'Re-enter password.',
                        prefixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            loginController.hidePasswordVerify.value = !loginController.hidePasswordVerify.value;
                          },
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              loginController.passwordVerify.value.clear();
                              loginController.checkIfCanRegister();
                            }),
                        labelText: 'Re-enter Password',
                      ),
                      onChanged: (value) {
                        loginController.checkIfCanRegister();
                      },
                    )),
                const SizedBox(height: 20),
                Obx(() => Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  loginController.canRegister.value ? Colors.blue : Colors.grey),
                            ),
                            onPressed: loginController.canRegister.value
                                ? () async {
                                    var result = await RestRepository().Register();

                                    if (result) {
                                      DialogHelper.showSnackBar(
                                          title: 'Success', message: 'User registered successfully', duration: 3);
                                      await Future.delayed(const Duration(seconds: 4));
                                      tokenController.clearTokens();
                                      loginController.resetLoginController();
                                      Get.to(() => LoginPage());
                                    }
                                  }
                                : null,
                            child: const Text('Register'),
                          ),
                        ),
                      ],
                    )),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: () {
                          loginController.passwordVerify.value.clear();
                          loginController.passWord.value.clear();
                          loginController.userName.value.clear();
                          Get.to(() => SignUpProfileView());
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),

                Obx(() => Flexible(
                      fit: FlexFit.loose,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SafeArea(
                          child: Text(
                            textAlign: TextAlign.center,
                            loginController.passwordValidityError.value,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
