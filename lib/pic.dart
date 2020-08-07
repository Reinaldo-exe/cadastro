import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Camera',
//      home: FotoPage(),
//    );
//  }
//}

class FotoPage extends StatefulWidget {
  @override
  _FotoPageState createState() => _FotoPageState();
}

class _FotoPageState extends State<FotoPage> {
  File imagem;
  File imagemTemporaria;

  void pegarImagemGaleria() async {
    imagemTemporaria = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagem = imagemTemporaria;
    });
  }

  void pegarImagemCamera() async {
    imagemTemporaria = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imagem = imagemTemporaria;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Camera'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: imagem != null
                ? Image.file(imagem)
                : Center(
                    child: Text('Selecione uma imagem'),
                  ),
          )),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      pegarImagemCamera();
                    }),
                SizedBox(
                  width: 60,
                ),
                IconButton(
                    icon: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      pegarImagemGaleria();
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
