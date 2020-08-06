import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String nome;
  final String ddd;
  final String telefone;
  final String email;
  final String avatarUrl;

  const User(
      {this.id,
      @required this.nome,
      @required this.ddd,
      @required this.telefone,
      @required this.email,
      @required this.avatarUrl});
}
