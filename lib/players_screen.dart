import 'package:flutter/material.dart';
import 'package:truth_or_dare/player.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  var players = [];
  TextEditingController? nameController;

  void addPlayer() async {
    var player = Player("", Sex.male);
    await showModalBottomSheet(
      backgroundColor: Color.fromRGBO(99, 7, 0, 1),
      context: context,
      builder: ((context) {
        return StatefulBuilder(
          builder: ((context, setState) => Column(
                children: [
                  const Text(
                    "Enter player's name:",
                    // style: TextStyle(
                    //   color: Colors.red,
                    // ),
                  ),
                  TextField(
                    controller: nameController,
                    onChanged: (value) => player.name = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      //  fillColor: Colors.red.shade900,
                      //     filled: true,
                    ),
                    keyboardAppearance: Brightness.dark,
                  ),
                  ListTile(
                    leading: Radio(
                      activeColor: Colors.black,
                      value: Sex.male,
                      groupValue: player.sex,
                      onChanged: (Sex? value) {
                        setState(() {
                          player.sex = value;
                        });
                      },
                    ),
                    title: const Text(
                      "Male",
                      // style: TextStyle(
                      //   color: Colors.red,
                      // ),
                    ),
                  ),
                  ListTile(
                    leading: Radio(
                      activeColor: Colors.black,
                      value: Sex.female,
                      groupValue: player.sex,
                      onChanged: (Sex? value) {
                        setState(() {
                          player.sex = value;
                        });
                      },
                    ),
                    title: const Text(
                      "Female",
                      // style: TextStyle(
                      //   color: Colors.red,
                      // ),
                    ),
                  ),
                  TextButton(
                      // style: ButtonStyle(
                      //   backgroundColor: MaterialStateProperty.all(
                      //     Colors.red,
                      //   ),
                      // ),
                      onPressed: () {
                        players.add(player);
                      },
                      child: const Text(
                        "Add Player",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ))
                ],
              )),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(99, 7, 0, 1))),
          onPressed: addPlayer,
          child: Text("Add Player"),
        ),
      ),
    );
  }
}
