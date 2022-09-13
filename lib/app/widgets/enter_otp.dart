
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/modules/login/controllers/login_controller.dart';

class EnterOTPField extends StatelessWidget {
  EnterOTPField({Key? key}) : super(key: key);

  final _authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white,
              fontSize: Get.width * 0.09,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: Get.width * 0.06),
        Form(
          key: _authController.formKey,
          child: SizedBox(
            height: Get.height * 0.1,
            width: double.infinity,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              maxLength: 10,
              validator: (value) => _authController.validateMobileNumber(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _authController.mobileFieldCtrlr,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixText: "+91 ",
                fillColor: Colors.grey.shade900,
                filled: true,
                hintText: "Mobile Number",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        SizedBox(height: Get.width * 0.06),
        SizedBox(
          height: Get.height * 0.06,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_authController.formKey.currentState!.validate()) {
                _authController.getOTP();
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:Colors.green),
            child: const Text("Get OTP"),
          ),
        ),
      ],
    );
  }
}
