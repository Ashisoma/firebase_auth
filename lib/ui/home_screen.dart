import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                "Welcome back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Name",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Email",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              ActionChip(label: const Text("Logout"), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
