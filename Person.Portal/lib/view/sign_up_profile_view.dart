import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/login_controller.dart';
import 'package:person_portal/controller/person_profile_controller.dart';
import 'package:person_portal/controller/token_controller.dart';
import 'package:person_portal/helper/general_helper.dart';
import 'package:person_portal/view/login_view.dart';
import 'package:person_portal/view/register_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpProfileView extends StatelessWidget {
  SignUpProfileView({super.key});

  final loginController = Get.put(LoginController());
  final tokenController = Get.put(TokenController());
  final profileController = Get.put(PersonProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 300,
            ),
            const SizedBox(height: 20),
            Obx(
              () => profileBuilder('Bsn', profileController.maskedSofiNumber()),
            ),
            Obx(
              () => profileBuilder('SignificantAchternaam', profileController.profile.value.significantAchternaam),
            ),
            Obx(
              () => profileBuilder('Voorvoegsel', profileController.profile.value.voorvoegsel),
            ),
            Obx(
              () => profileBuilder('Voorletter', profileController.profile.value.voorletter),
            ),
            Obx(
              () => profileBuilder('Geboortedatum', ToDateFormat(profileController.profile.value.geboortedatum)),
            ),
            Obx(
              () => profileBuilder('Nationaliteit', profileController.profile.value.nationaliteit),
            ),
            Obx(
              () => profileBuilder('Geslacht', profileController.profile.value.geslacht),
            ),
            const SizedBox(height: 20),
            Text('Is this you?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 20),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      child: Text('Yes', style: TextStyle(fontSize: 18)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        loginController.resetLoginController();
                        Get.to(() => RegisterPage());
                      },
                    )),
                SizedBox(width: 20),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        tokenController.clearTokens();
                        loginController.resetLoginController();
                        Get.to(() => LoginPage());
                      },
                      child: Text('No', style: TextStyle(fontSize: 18)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    )),
                SizedBox(width: 20),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget profileBuilder(String title, String? value) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(value ?? '', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  _openPopup(context) {
    Alert(
        context: context,
        title: "LOGIN",
        desc: "Please provide an email address and password to register .",
        content: Column(
          children: <Widget>[
            TextField(
              controller: loginController.userName.value,
              enabled: true,
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: const IconButton(
                  icon: Icon(null),
                  onPressed: null,
                ),
                suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      loginController.userName.value.clear();
                      loginController.checkIfCanLogin();
                    }),
                border: const OutlineInputBorder(),
                labelText: 'Username',
              ),
              onChanged: (value) {
                loginController.checkIfCanLogin();
              },
            ),
            Obx(() => TextField(
                  controller: loginController.passWord.value,
                  obscureText: loginController.hidePassword.value,
                  enabled: true,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        loginController.hidePassword.value = !loginController.hidePassword.value;
                      },
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          loginController.passWord.value.clear();
                          loginController.checkIfCanLogin();
                        }),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (value) {
                    loginController.checkIfCanLogin();
                  },
                )),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed:null,// () => Navigator.pop(context),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: ElevatedButton(
              // style: ButtonStyle(
              //   // backgroundColor:
              //   //     MaterialStateProperty.all<Color>(loginController.canLogin.value ? Colors.blue : Colors.grey),
              // ),
              onPressed: (){},
              child: Text('Login'),
            ),
          ),
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: ElevatedButton(
              // style: ButtonStyle(
              //   // backgroundColor:
              //   //     MaterialStateProperty.all<Color>(loginController.canLogin.value ? Colors.blue : Colors.grey),
              // ),
              onPressed:() {},
              child: Text('Login'),
            ),
          )
        ]).show();
  }
}
