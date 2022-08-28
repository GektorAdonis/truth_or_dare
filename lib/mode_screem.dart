import 'package:flutter/material.dart';
import 'package:truth_or_dare/mode_item.dart';

class ModeScreen extends StatelessWidget {
  const ModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ModeItem(
                "Light Mode",
                Colors.yellow,
              ),
              ModeItem(
                "Hard Mode",
                Colors.amber,
              ),
              ModeItem(
                "Adult mode",
                Colors.red,
              ),
            ],
          ),
        ));
  }
}
