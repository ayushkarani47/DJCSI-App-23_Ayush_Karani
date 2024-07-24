import 'package:flutter/material.dart';
import 'package:focuslist/screens/homepage.dart';

class start_page extends StatelessWidget {
  const start_page({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 225, 225),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text("FocusList",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 238, 191, 49))),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("images/todo.jpg"),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text("Welcome to FocusList",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                    "FocusList will help you to stay\n  organized and perform your\n          tasks much faster.",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 0, 0, 0))),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    child: const Text(
                      "Get Started",
                      style: TextStyle(),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home_page()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 228, 140, 33)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}