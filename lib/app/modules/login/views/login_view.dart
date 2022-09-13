import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zartek/app/modules/login/views/login_phone.dart';
import 'package:zartek/app/widgets/text_customized.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
   LoginView({Key? key}) : super(key: key);

  final loginController =Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: Get.height * 0.4,
                padding: const EdgeInsets.only(bottom: 70),
                child: Image.asset(
                  "assets/images/firebase.png",
                  fit: BoxFit.contain,
                )),
            const SizedBox(height: 10),
            ListTile(
              onTap: ()=>loginController.signInWithGoogle(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              title: const Center(
                child: TextCustomized(
                  fontSize: 16,
                  text: "Google",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              tileColor: Colors.blue,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/Google.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () =>Get.to( LoginScreenPhone()) ,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              title: const Center(
                child: TextCustomized(
                  fontSize: 16,
                  text: "Phone",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              tileColor: const Color.fromARGB(255, 55, 221, 61),
              leading: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 55, 221, 61),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}
