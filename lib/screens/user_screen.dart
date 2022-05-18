import 'package:flutter/material.dart';
import 'package:flutter_app_structure/controllers/response.dart';
import 'package:flutter_app_structure/controllers/u_controler.dart';
import 'package:flutter_app_structure/models/users.dart';

class UserScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<UserScreen> {
  UContoller _apiServiceProvider = new UContoller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: FutureBuilder<MyResponse?>(
          future: _apiServiceProvider.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Users> list = snapshot.data!.data!;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Users user = list[index];
                    return ListTile(
                      title: Text(user.firstName! + " " + user.lastName!),
                      subtitle: Text(user.email!),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar!),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
