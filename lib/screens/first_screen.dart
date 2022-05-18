import 'package:flutter/material.dart';
import 'package:flutter_app_structure/controllers/controller.dart';
import 'package:flutter_app_structure/controllers/user_controller.dart';
import 'package:get/get.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  void initState() {
    super.initState();
    print("After build");
  }

  var user_controller = UserController();

  getUser() {
    var all_user = user_controller.allUser();
    print("alluser is her");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            // Get.snackbar("Hi", "I'm modern snackbar");
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Text("title".tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
                init: Controller(),
                // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
                builder: (_) => Text(
                      'clicks: ${_.count}',
                    )),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.toNamed('/second');
              },
            ),
            ElevatedButton(
              child: Text('Change locale to English'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'UK'));
              },
            ),
            ElevatedButton(
              child: Text('change_to_kh'.tr),
              onPressed: () {
                Get.updateLocale(Locale('kh', 'KH'));
              },
            ),
            Text("i_new_you".tr),
            TextButton(onPressed: getUser, child: Text("Get User All"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "btn100",
          child: Icon(Icons.add),
          onPressed: () {
            Get.find<Controller>().increment();
          }),
      // drawer: Drawer(
      //   // Add a ListView to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: Text('Item 1'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Item 2'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}
