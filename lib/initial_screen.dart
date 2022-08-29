import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset("lib/assets/logo.png"),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/players-screen');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(99, 7, 0, 1)),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(MediaQuery.of(context).size.width * 0.5, 20),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const Text("Start"),
            )
          ],
        ),
      ),
    );
  }
}
