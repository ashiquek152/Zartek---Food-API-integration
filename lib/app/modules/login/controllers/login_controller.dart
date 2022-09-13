import 'package:get/get.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zartek/app/modules/authentication/views/authentication_view.dart';
import 'package:zartek/app/widgets/loading.dart';
import 'package:zartek/app/widgets/snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  static const NETWORK_ERROR =
      "A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
  static const BLOCKED_ERROR =
      "We have blocked all requests from this device due to unusual activity. Try again later.";

  String erroMessage = "";

  final mobileFieldCtrlr = TextEditingController();
  final verifyotpCtrlr = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();

  bool otpFieldVisible = false;

  String verificationIDRecieved = "";
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  validateMobileNumber(value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }


      /// **************** Mobile Authentication **************** */

  getOTP() async {
    Get.dialog(const LoadingWidget(),
        barrierDismissible: false,
        transitionDuration: const Duration(seconds: 2));
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91${mobileFieldCtrlr.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then(
            (value) {
              // Get.back();
              log("Logged in with OTP");
            },
          );
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.message.toString());

          switch (exception.message) {
            case NETWORK_ERROR:
              erroMessage = "Network Error";
              break;
            case BLOCKED_ERROR:
              erroMessage = BLOCKED_ERROR;
              break;
            default:
              erroMessage = "Enter a valid mobile number";
          }
          Get.back();
          snackBar(message: erroMessage, title: "Try again");
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIDRecieved = verificationID;
          otpFieldVisible = true;
          mobileFieldCtrlr.clear();
          update();
          Get.back();
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    } catch (exception) {
      snackBar(message: "Something went wrong", title: "Try Again");
    }
  }

  verifyOTPandsignIn() async {
    Get.dialog(const LoadingWidget(),
        barrierDismissible: false,
        transitionDuration: const Duration(seconds: 2));
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationIDRecieved,
          smsCode: verifyotpCtrlr.text.trim());
      log(credential.providerId.toString());
      await _auth.signInWithCredential(credential).then((value) {
        verifyotpCtrlr.clear();
        log("Signed In");
        Get.back();
        Get.offAll(AuthenticationView());
        otpFieldVisible = false;
        update();
      });
    } on FirebaseAuthException catch (e) {
      Get.back();
      snackBar(message: e.message.toString(), title: "Try Again");
    } catch (exception) {
      Get.back();
      snackBar(message: "Something went wrong", title: "Try Again");
    }
  }

    /// ******************************** */
    
        /// *************** Google Authentication ***************** */

  Future signInWithGoogle() async {
    // Get.dialog(const LoadingWidget());
    try {
      final googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential results = await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final erroMessage = e.message;
      snackBar(message: erroMessage.toString(), title: "Try again");
    } catch (e) {
      final message = "Somthing went wrong $e";
      snackBar(message: message.toString(), title: "Try again");
    }
    // Get.back();
  }
}
