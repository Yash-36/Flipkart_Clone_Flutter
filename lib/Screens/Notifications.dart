import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
          Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
          title: const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  child: Center(
                    child: Image.asset(
                      "lib/Assets/images/box.png",
                      width: 150,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("You're missing out.",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ),),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: const Text(
                    "sign in to view personalised notifications and offers.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,fontSize: 15
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent.shade200),
                      shape: MaterialStateProperty.all(
                        ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    child: const Text("Sign in",style: TextStyle(color: Colors.white),textAlign: TextAlign.justify,))
              ],
            ),
          ],
        ),
    );
  }
}
