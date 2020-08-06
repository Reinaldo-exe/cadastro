import 'dart:js';
import 'package:flutter/material.dart';
import 'package:gitest/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  final users = Provider.of<Users>(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Lista de Usuarios"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
      body: ListView.builder(
          itemCount: users.count, itemBuilder: (ctx, i) => Text('')),
    );
  }
}
