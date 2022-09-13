import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/modules/login/controllers/login_controller.dart';

class VerifyOTPField extends StatelessWidget {
  final _authController = Get.put(LoginController());

  VerifyOTPField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authController.formKey1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Verify OTP",
            style: TextStyle(
                color: Colors.white,
                fontSize: Get.width * 0.09,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Get.width * 0.06),
          SizedBox(
            height: Get.height * 0.08,
            width: double.infinity,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Please enter the OTP";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _authController.verifyotpCtrlr,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.grey.shade900,
                filled: true,
                hintText: "Enter OTP",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          SizedBox(height: Get.width * 0.06),
          SizedBox(
            height: Get.height * 0.06,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_authController.formKey1.currentState!.validate()) {
                  _authController.verifyOTPandsignIn();
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Verify OTP"),
            ),
          ),
        ],
      ),
    );
  }
}
