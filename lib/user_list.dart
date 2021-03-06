import 'package:flutter/material.dart';
import 'package:gitest/router.dart';
import 'package:gitest/user_tile.dart';
import 'package:gitest/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Lista de Usuarios"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person_add),
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.FORMULARIO);
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndes(i)),
      ),
    );
  }
}
