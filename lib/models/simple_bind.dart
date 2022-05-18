import 'package:flutter_app_structure/controllers/controllerx.dart';
import 'package:get/get.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerX>(() => ControllerX());
  }
}
