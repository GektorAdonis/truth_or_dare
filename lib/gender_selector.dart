import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:truth_or_dare/player.dart';

class GenderSelector extends StatefulWidget {
  final Player player;
  const GenderSelector({Key? key, required this.player}) : super(key: key);

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              widget.player.gender = Gender.male;
            });
          },
          icon: const Icon(MdiIcons.genderMale),
          iconSize: widget.player.gender == Gender.male ? 45 : 30,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.player.gender = Gender.female;
            });
          },
          icon: const Icon(MdiIcons.genderFemale),
          iconSize: widget.player.gender == Gender.female ? 45 : 30,
        ),
      ],
    );
  }
}
