import 'package:get/get.dart';

class Controller extends GetxController {
  int count = 0;
  void increment() {
    count++;
    // use update method to update all count variables
    update();
  }

  getUser() {
    return "all you";
  }

  getInvoice() {
    return true;
  }

  addUser() {
    return true;
  }
}
