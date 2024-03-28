import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_learning/model/user_data.dart';
import 'package:http/http.dart' as http;

class FemaleScreen extends StatefulWidget {
  const FemaleScreen({super.key});

  @override
  State<FemaleScreen> createState() => _FemaleScreenState();
}

class _FemaleScreenState extends State<FemaleScreen> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeMale'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            final user = users[index];
            final email = user.email;
            final gender = user.gender;
            const colors = Colors.red;
            return Container(
              margin: const EdgeInsets.all(10),
              height: 80,
              color: colors,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$user'),
                  Text(email),
                  Text(gender),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUsers();
        },
        child: const Text('Get Users'),
      ),
    );
  }

  fetchUsers() async {
    print('Fetching');
    const url = 'https://randomuser.me/api/?results=400&gender=female';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transform = results.map((e) {
      return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        image: e['picture']['thumbnail'],
      );
    }).toList();
    setState(() {
      users = transform;
    });
    print(json);
  }
}
