import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/login_controller.dart';
import 'package:person_portal/controller/mongo_controller.dart';
import 'package:person_portal/controller/person_profile_controller.dart';
import 'package:person_portal/helper/dialog_helper.dart';
import 'package:person_portal/model/endPointServers.dart';
import 'package:person_portal/repository/rest_repository.dart';
import 'package:person_portal/view/sign_up_profile_view.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final LoginController loginController = Get.find();
  final MongoController mongoController = Get.find();
  final PersonProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Check'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Icon(
                Icons.person,
                size: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Profile Check',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 20),

              Obx(() => showDynamicServer()),

              const SizedBox(height: 20),

              TextField(
                controller: loginController.userName.value,
                enabled: true,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'PersonNumber + last 4 digits of Bsn',
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
              const SizedBox(height: 20),
              Obx(() => TextField(
                    controller: loginController.passWord.value,
                    obscureText: loginController.hidePassword.value,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: 'BirthDate in format: YYYYMMDD',
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
              const SizedBox(height: 20),
              Obx(() => Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                loginController.canLogin.value ? Colors.green : Colors.grey),
                          ),
                          onPressed: loginController.canLogin.value
                              ? () async {
                                  await RestRepository().LogIn();

                                  if (loginController.loggedIn.value) {
                                    await RestRepository().FetchProfile();

                                    if (profileController.profile.value != null) {
                                      DialogHelper.showSnackBar(title: 'Profile Found', message: '');
                                      Get.to(() => SignUpProfileView());
                                    }
                                  }
                                }
                              : null,
                          child: const Text('Profile Check'),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel'),
                    ),
                  ),
                ],
              ),
              Obx(() => Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                              'In order to SignUp for an account, we must first check if you have an existing taxfiling in our server.'),
                        ),
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                              'For your UserName, please provide your PersonNumber plus the last 4 digit of your BsnNumber.'),
                        ),
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                              'For your Password, please provide your BirthDate in YYYYMMDD format, ex December 1, 1980, 19801201.'),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SafeArea(
                            child: Text(
                              'Retries attempted: ${loginController.retriesAttempted.value} of ${loginController.maxRetries.value}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: loginController.maxRetriesReached ? Colors.red : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget showDynamicServer() {
    return (mongoController.portalSettings.value.allowDynamicServer ?? false)
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Server'),
                Obx(() => DropdownButton(
                      value: mongoController.selectedServer.value,
                      items: mongoController.endPointServers.map((EndPointServersModel endpoint) {
                        return DropdownMenuItem(
                          value: endpoint.servers?.server ?? '',
                          child: Text(endpoint.servers?.server ?? ''),
                        );
                      }).toList(),
                      onChanged: (value) {
                        mongoController.selectedServer.value = value.toString();
                      },
                    )),
              ],
            ),
          )
        : Container();
  }
}
