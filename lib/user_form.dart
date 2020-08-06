import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gitest/user.dart';
import 'package:gitest/users.dart';

class UserForm extends StatelessWidget {
  final form = GlobalKey<FormState>();
  final Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState.Validate();
                if (isValid) {
                  _form.currentState.Save();
                  Povider.of<Users>(context, listen: false).put(User(
                    id: formData['id'],
                    nome: formData['nome'],
                    email: form['email'],
                    avatarUrl: form['avatarUrl'],
                  ));
                }
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Nome"),
              onSaved: (value) => _formData['nome'] = value,
            ),
            TextFormField(decoration: InputDecoration(labelText: "E-mail")),
            TextFormField(decoration: InputDecoration(labelText: "Avatar")),
          ]),
        ),
      ),
    );
  }
}
