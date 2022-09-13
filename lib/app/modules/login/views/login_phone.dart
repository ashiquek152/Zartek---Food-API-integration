import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/modules/login/controllers/login_controller.dart';
import 'package:zartek/app/widgets/enter_otp.dart';
import 'package:zartek/app/widgets/verify_otp_field.dart';

class LoginScreenPhone extends StatelessWidget {
  LoginScreenPhone({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: Get.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Get.height * 0.02),
              child: GetBuilder<LoginController>(builder: (controller) {
                return Column(
                  children: [
                    SizedBox(height: Get.width * 0.06),
                    Visibility(
                        visible: !loginController.otpFieldVisible,
                        child: EnterOTPField()),
                    Visibility(
                        visible: loginController.otpFieldVisible,
                        child: VerifyOTPField()),
                    SizedBox(height: Get.width * 0.06),
                    // SizedBox(height: Get.width * 0.06),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
