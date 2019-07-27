import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<int> _listaNumeros= new List();
  int _ultimoItem=0;
  ScrollController _scrollController = new ScrollController();
  bool _isLoading=false;

@override
  void initState() {
   
    super.initState();
    agregarDiez();
    _scrollController.addListener((){
        if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
          fetchData();
          //agregarDiez();
        }
    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),

        ],
      )
      
      
    );
  }

  Widget _crearLista(){

    return ListView.builder(
      controller: _scrollController,
      //Numero de elementos de la lista
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?=$imagen'),
          placeholder:  AssetImage('assets/jar-loading.gif'),        
        );
      },
    );
  }

  void agregarDiez(){
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
  
    }
  setState(() {});
  }

  Widget _crearLoading(){

      if(_isLoading){
        return Column(
          
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 100.0)
                ],
              )
          ],
        );
      }
      else{
        return Container();
      }


  }
  Future<Null> fetchData() async{
      _isLoading=true;
      setState(() {});
      final duration = new Duration(seconds: 2);
      return new Timer(duration, respuestaHTTP);

  }
  void respuestaHTTP(){
     _isLoading=false;
     agregarDiez();
     _scrollController.animateTo(
        _scrollController.position.pixels+100,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 250)
     );
  }
@override
  void dispose() {
    
    super.dispose();
    _scrollController.dispose();
  }

}