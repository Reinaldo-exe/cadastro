import 'package:flutter/material.dart';
import 'package:gitest/router.dart';
import 'package:gitest/user.dart';
import 'package:gitest/users.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null && user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRouter.FORMULARIO, arguments: user);
                }),
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text("Excluir Usúario"),
                            content: Text("Tem certeza ?"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Sim"),
                                onPressed: () {
                                  Provider.of<Users>(context, listen: false)
                                      .remove(user);
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text("Não"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ));
                }),
          ],
        ),
      ),
    );
  }
}
