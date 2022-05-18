import 'package:flutter/material.dart';

class CircleButtom extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color color;
  final Function()? onPressed;
  final Color? background;

  const CircleButtom(
      {Key? key,
      required this.icon,
      required this.iconSize,
      required this.color,
      required this.onPressed,
      this.background})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        iconSize: iconSize,
        color: color,
      ),
    );
  }
}
