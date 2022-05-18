import 'package:flutter/material.dart';
import 'package:flutter_app_structure/config/palette.dart';
import 'package:flutter_app_structure/models/models.dart';
import 'package:flutter_app_structure/widgets/profile_avatar.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _createRoomButttom(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActvie: true,
            ),
          );
        },
      ),
    );
  }
}

class _createRoomButttom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('create ROOOM'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Palette.facebookBlue, width: 2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      ),
      child: Row(
        children: [
          // ShaderMask(
          //     shaderCallback: (rect) =>
          //         Palette.createRoomGradient.createShader(rect),
          //     child: Icon(Icons.video_call, size: 30.0, color: Colors.white)),
          Icon(Icons.video_call, size: 30.0, color: Colors.white),
          const SizedBox(
            width: 4.0,
          ),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}
