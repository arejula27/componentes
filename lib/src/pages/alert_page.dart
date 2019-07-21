import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alertas'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: ()=> mostrarAlerta(context),
          )
      ),

     floatingActionButton: Row(children: <Widget>[
         SizedBox(width: 30.0,),
        FloatingActionButton(
          child:Icon(Icons.arrow_back_ios) ,
          onPressed: (){
            Navigator.pop(context);
          },),
          Expanded(child: SizedBox(width: 1.0,)),

      ],)
        
    );
  }
  void mostrarAlerta(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Esto es una alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('y esto el contenido'),
              FlutterLogo(size: 100.0,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('cancelar'),
              onPressed: ()=>Navigator.of(context).pop(),),
              FlatButton(
              child: Text('ok'),
              onPressed: ()=>Navigator.of(context).pop(),)
          ],
        );
      }
    );



  }

}