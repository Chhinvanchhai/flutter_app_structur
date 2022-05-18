import 'package:flutter/material.dart';
import 'package:flutter_app_structure/controllers/controller.dart';
import 'package:flutter_app_structure/controllers/controllerx.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Third extends GetView<ControllerX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: "btn198",
          onPressed: () {
            controller.incrementList();
          }),
      appBar: AppBar(
        title: Text("Third ${Get.arguments}"),
      ),
      body: Center(
          child: Obx(() => ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return Text("${controller.list[index]}");
              }))),
    );
  }
}
