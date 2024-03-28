// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_learning/model/user_data.dart';
import 'package:http/http.dart' as http;

class MaleScreen extends StatefulWidget {
  const MaleScreen({super.key});

  @override
  State<MaleScreen> createState() => _MaleScreenState();
}

class _MaleScreenState extends State<MaleScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Male'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            final user = users[index];
            final email = user.email;
            final gender = user.gender;
            const colors = Colors.blue;
            return Container(
              margin: const EdgeInsets.all(10),
              height: 100,
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
    const url = 'https://randomuser.me/api/?results=400&gender=male';
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
