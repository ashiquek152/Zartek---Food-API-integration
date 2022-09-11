
import 'package:flutter/material.dart';
import 'package:zartek/app/modules/home/controllers/home_controller.dart';
import 'package:zartek/app/widgets/text_customized.dart';

class DrawerHomescreen extends StatelessWidget {
  const DrawerHomescreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              accountName: TextCustomized(
                fontSize: 18,
                text: "User",
                textColor: Colors.white,
              ),
              accountEmail: TextCustomized(
                  fontSize: 18, text: "Adh@gmail.com", textColor: Colors.white),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
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
            onTap: () {
              // Navigator.pop(context);
              controller.getDishes();
            },
          ),
        ],
      ),
    );
  }
}
