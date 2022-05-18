import 'package:flutter/material.dart';
import 'package:flutter_app_structure/config/palette.dart';
import 'package:flutter_app_structure/models/models.dart';
import 'package:flutter_app_structure/widgets/custom_tabs_bar.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar(
      {Key? key,
      required this.currentUser,
      required this.icons,
      required this.selectedIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4.0)
      ]),
      child: Row(
        children: [
          Text(
            'Shop',
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          Container(
            width: 600.0,
            child: CustomTabsbar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
            ),
          )
        ],
      ),
    );
  }
}
