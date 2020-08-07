import 'package:flutter/material.dart';
import 'package:gitest/pic.dart';
import 'package:gitest/router.dart';
import 'package:provider/provider.dart';
import 'package:gitest/users.dart';
import 'package:gitest/user.dart';

class UserForm extends StatelessWidget {
  //Adiciona Usuario put
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  // Alterar Usuario update
  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['nome'] = user.nome;
      _formData['ddd'] = user.ddd;
      _formData['telefone'] = user.telefone;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
//update
    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Usuario"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'],
                  nome: _formData['nome'],
                  ddd: _formData['ddd'],
                  telefone: _formData['telefone'],
                  email: _formData['email'],
                  avatarUrl: _formData['avatarUrl'],
                ));
                Navigator.of(context).pop();
              }
            }),
      ]),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Escreva um Nome";
                  }
                  if (value.trim().length < 4) {
                    return "Nome muito curto, no minimo 4 letras.";
                  }
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['ddd'],
                decoration: InputDecoration(labelText: 'DDD'),
                onSaved: (value) => _formData['ddd'] = value,
              ),
              TextFormField(
                initialValue: _formData['telefone'],
                decoration: InputDecoration(labelText: 'Nº Telefone'),
                onSaved: (value) => _formData['telefone'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: "E-mail"),
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: "Foto"),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRouter.FOTO);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
