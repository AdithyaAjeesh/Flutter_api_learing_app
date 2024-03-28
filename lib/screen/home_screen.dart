import 'package:flutter/material.dart';
import 'package:flutter_api_learning/screen/female_screen.dart';
import 'package:flutter_api_learning/screen/male_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Male and Female Clients'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaleScreen()));
              },
              child: const Text('Male'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FemaleScreen()));
              },
              child: const Text('Female'),
            ),
          ],
        ),
      ),
    );
  }
}
