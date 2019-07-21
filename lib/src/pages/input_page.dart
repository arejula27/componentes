import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Input Page'),
      ),
      //creamos el listview para poder hacer scroll
      body: ListView(
        //poner margenes
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20
        ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    //permite meter texto al ususrio, el formFile mejor para formularios
    return TextField(
      //abrir el teclado al entrar en la page
      //autofocus: true,
      //Auto poner en mayusculas 
      textCapitalization: TextCapitalization.sentences,
      autocorrect: true,
      decoration:InputDecoration(
        //contador bajo el TextField
        counter: Text('letras ${_nombre.length}'),
        //Texto en el text field previo a escribir(ayuda al usuario)
        hintText: 'nombre de la persona',
        //etiqueta o titulo
        labelText: 'Nombre',
        helperText: 'Holi',
        //icono a la derecha del texto
        suffixIcon: Icon(Icons.accessibility) ,
        ///icono a la izquierda
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),

      ),
      onChanged: (valor){
        setState(() {
           _nombre =valor;
        });
       
        
      },
    );
  }

 Widget _crearPersona() {


    return ListTile(
      title: Text('Su nombre es: $_nombre'),
    );
  }
}