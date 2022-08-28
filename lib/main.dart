import 'package:flutter/material.dart';
import 'package:truth_or_dare/mode_screem.dart';
import 'package:truth_or_dare/players_screen.dart';

import 'initial_screen.dart';

void main() {
  runApp(const TruthOrDare());
}

class TruthOrDare extends StatelessWidget {
  const TruthOrDare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Truth or Dare",
      home: const InitialScreen(),
      routes: {
        "/mode-screen": (context) => const ModeScreen(),
        "/players-screen": (context) => const PlayersScreen(),
      },
    );
  }
}
