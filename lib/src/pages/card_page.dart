import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: Text('Cards Page'),
        
      ),
      body: ListView(
        children: <Widget>[
          _getCardtip1(),
          SizedBox(height: 30.0,),
          _getCardtip2()
        ],
        padding: EdgeInsets.all(10.0),),


    );
  }

  _getCardtip1() {

    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(  
        children: <Widget>[

          ListTile(
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle:Text('Pues de chill haciendo la tarjeta para comprobar como funcionan las tarjetas') ,
            leading:Icon(Icons.photo_album,color: Colors.blue) ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){},
              )
            ],
          )
          
          
        ],
      ),
    );
  }

  _getCardtip2() {

    final card =Container(
      
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(microseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          //Image(
           // image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
         // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('esto es un texto')),
        ],
     ),
    );
    return Container(
      
      

      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
        
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset (2.0,-10.0),
          )

        ],
        borderRadius: BorderRadius.circular(30.0),
        //color: Colors.red
      ),
    );
  }
}