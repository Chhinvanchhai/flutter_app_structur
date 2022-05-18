import 'package:flutter/material.dart';
import 'package:flutter_app_structure/config/palette.dart';
import 'package:flutter_app_structure/data/data.dart';
import 'package:flutter_app_structure/models/models.dart';
import 'package:flutter_app_structure/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'Shop',
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButtom(
                icon: Icons.search,
                iconSize: 28.0,
                onPressed: () => print('Search'),
                color: Colors.grey),
            CircleButtom(
                icon: MdiIcons.facebookMessenger,
                iconSize: 28.0,
                onPressed: () => print('Messager'),
                color: Colors.black45)
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
              child: Stories(
            currentUser: currentUser,
            stories: stories,
          )),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];

            return PostContatiner(post: post);
          }, childCount: posts.length),
        )
      ],
    ));
  }
}
