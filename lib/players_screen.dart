import 'package:flutter/material.dart';
import 'package:truth_or_dare/gender_selector.dart';
import 'package:truth_or_dare/player.dart';
import 'package:truth_or_dare/player_item.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  List<Player> players = [];
  TextEditingController? nameController;

  void addPlayer() {
    var player = Player("", Gender.male);
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(99, 7, 0, 1),
      context: context,
      builder: ((context) {
        return Column(
          children: [
            const Text(
              "Enter player's name:",
            ),
            TextField(
              controller: nameController,
              onChanged: (value) => player.name = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              keyboardAppearance: Brightness.dark,
            ),
            GenderSelector(player: player),
            TextButton(
                onPressed: () {
                  setState(
                    () => players.add(player),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "Add Player",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ))
          ],
        );
      }),
    );
  }

  void removePlayer(Player player) {
    setState(() {
      players.remove(player);
    });
  }

  void editPlayer(Player player) {
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(99, 7, 0, 1),
      context: context,
      builder: ((context) {
        return Column(
          children: [
            const Text(
              "Enter player's name:",
            ),
            TextField(
              controller: TextEditingController(text: player.name)
                ..selection =
                    TextSelection.collapsed(offset: player.name.length),
              onChanged: (value) => player.name = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              keyboardAppearance: Brightness.dark,
            ),
            GenderSelector(player: player),
            TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: const Text(
                  "Edit Player",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ))
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: players.isEmpty
            ? Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(99, 7, 0, 1))),
                  onPressed: addPlayer,
                  child: const Text("Add Player"),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 500,
                    child: ListView(
                      children: players
                          .map((p) =>
                              PlayerItem(p, players, removePlayer, editPlayer))
                          .toList(),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(99, 7, 0, 1))),
                    onPressed: addPlayer,
                    child: const Text("Add Player"),
                  ),
                ],
              ));
  }
}
