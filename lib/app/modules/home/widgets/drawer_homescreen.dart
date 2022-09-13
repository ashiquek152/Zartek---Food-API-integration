import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/modules/home/controllers/home_controller.dart';
import 'package:zartek/app/widgets/text_customized.dart';

class DrawerHomescreen extends StatelessWidget {
  DrawerHomescreen({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(HomeController());
  final currentUser = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              accountEmail: TextCustomized(
                  fontSize: 18,
                  text: currentUser != null
                      ? "UID : ${currentUser!.uid}"
                      : "UID not available",
                  textColor: Colors.white),
              accountName: TextCustomized(
                  fontSize: 18,
                  text: currentUser != null
                      ? currentUser!.email != null
                          ? currentUser!.email.toString()
                          : currentUser!.phoneNumber.toString()
                      : "Not Available",
                  textColor: Colors.white),
              currentAccountPictureSize: const Size.square(50),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 165, 255, 137),
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const TextCustomized(fontSize: 22, text: "Logout"),
            onTap: () => auth.signOut(),
          ),
        ],
      ),
    );
  }
}
