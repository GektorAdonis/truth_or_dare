import 'package:flutter/material.dart';

class ModeItem extends StatelessWidget {
  const ModeItem(
    this.modeTitle,
    this.color,
  );

  final String modeTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 200,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          modeTitle,
          style: TextStyle(
            color: color,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
