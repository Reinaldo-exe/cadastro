import 'package:flutter/material.dart';
import 'package:gitest/pic.dart';
import 'package:gitest/user_form.dart';
import 'package:gitest/user_list.dart';
import 'package:gitest/users.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:gitest/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => new Users(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            AppRouter.HOME: (ctx) => UserList(),
            AppRouter.FORMULARIO: (ctx) => UserForm(),
            AppRouter.FOTO: (ctx) => FotoPage(),
          }),
    );
  }
}
