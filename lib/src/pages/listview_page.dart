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

@override
  void initState() {
   
    super.initState();
    agregarDiez();
    _scrollController.addListener((){
        if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent-100){

          agregarDiez();
        }
    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('ListView'),
      ),
      body: _crearLista(),
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

}