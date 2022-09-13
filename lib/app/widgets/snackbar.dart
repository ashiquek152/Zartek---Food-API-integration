import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBar({required String message, required String title}) {
  Get.snackbar(
    "",
    "",
    titleText: Text(
      title,
      style: const TextStyle(
          color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: const Color.fromARGB(255, 231, 15, 0),
  );
}
