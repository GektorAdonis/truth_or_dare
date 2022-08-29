import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truth_or_dare/player.dart';

class PlayerItem extends StatefulWidget {
  final Player player;
  final List<Player> players;
  final Function removePLayer;
  final Function editPlayer;

  const PlayerItem(
      this.player, this.players, this.removePLayer, this.editPlayer,
      {Key? key})
      : super(key: key);

  @override
  State<PlayerItem> createState() => _PlayerItemState();
}

class _PlayerItemState extends State<PlayerItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      direction: DismissDirection.endToStart,
      onDismissed: ((direction) {
        widget.removePLayer(widget.player);
      }),
      child: ListTile(
        onLongPress: () {
          widget.editPlayer(widget.player);
        },
        leading: Icon(
          widget.player.gender == Gender.male
              ? MdiIcons.genderMale
              : MdiIcons.genderFemale,
          color: const Color.fromRGBO(99, 7, 0, 1),
        ),
        title: Text(
          widget.player.name,
          style: const TextStyle(
            color: Color.fromRGBO(99, 7, 0, 1),
          ),
        ),
      ),
    );
  }
}
