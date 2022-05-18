// import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_app_structure/data/data.dart';
import 'package:flutter_app_structure/screens/TodoHomeScreen.dart';
import 'package:flutter_app_structure/screens/api_screen.dart';
import 'package:flutter_app_structure/screens/home/home.dart';
import 'package:flutter_app_structure/screens/screens.dart';
import 'package:flutter_app_structure/screens/test_ui.dart';
import 'package:flutter_app_structure/screens/user_screen.dart';
import 'package:flutter_app_structure/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreenTab(),
    LearnApi(),
    First(),
    TestUI(),
    UserScreen(),
    // HomeScreen(),
    // Scaffold()
    TodoHomeScreen()
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() => {_selectedIndex = index});
                  },
                ),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Padding(
                // padding: Platform.isIOS
                //     ? const EdgeInsets.only(bottom: 12.0)
                //     : const EdgeInsets.only(bottom: 2.0),
                padding: EdgeInsets.only(bottom: 6.0),
                child: CustomTabsbar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
