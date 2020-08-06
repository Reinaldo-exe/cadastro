import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:gitest/user.dart';
import 'package:gitest/user_json.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...UserJson};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndes(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
          user.id,
          (value) => User(
                id: user.id,
                nome: user.nome,
                ddd: user.ddd,
                telefone: user.telefone,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
              id: id,
              nome: user.nome,
              ddd: user.ddd,
              telefone: user.telefone,
              email: user.email,
              avatarUrl: user.avatarUrl));
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
