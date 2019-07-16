import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedcontainerPage extends StatefulWidget {
  @override
  _AnimatedcontainerPageState createState() => _AnimatedcontainerPageState();
}

class _AnimatedcontainerPageState extends State<AnimatedcontainerPage> {
  double _width =50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _border = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: _cambiarForma,


      ),
      appBar: AppBar(

        title: Text('Animated Container'),
      ),
      body: Center(
        child: Container(

          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _border,
            color: _color,
          ),
        ),
      ),

    );
  }

  void _cambiarForma() {

    final random =Random();
    _width= random.nextInt(300).toDouble();
    _height=random.nextInt(300).toDouble();
    _color =Color.fromRGBO(
      random.nextInt(255),//rojo
      random.nextInt(255),//verde
      random.nextInt(255),//azul
      1 );//opacidad
    setState(() {
      
    });
    _border=BorderRadius.circular(random.nextInt(100).toDouble());
  }
}