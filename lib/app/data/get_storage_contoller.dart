// import 'dart:developer';

// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get_storage/get_storage.dart';

// class GetStorageController extends GetxController {

//   bool isLogedIn = false;
//    final getStorage = GetStorage();

   

//   storeDataToGetStorage(
//       {required String storageKey, required bool value}) async {
//         log(value.toString());
//     await getStorage.write(storageKey, value);
//     readDataFromGetxStorage(storageKey: storageKey);
//     update();
//   }

//   readDataFromGetxStorage({required String storageKey}) async {
//     if (getStorage.read(storageKey) != null) {
//       if (storageKey == "isLogedIn") {
//         isLogedIn = await getStorage.read(storageKey);
//         log("Is Logged IN : $isLogedIn");
//       }
//       update();
//     }
//   }
// }
