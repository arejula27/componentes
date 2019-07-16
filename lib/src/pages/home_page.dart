import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';


class HomePage extends StatelessWidget {

//final Map rutas ={'alert':AlertPage(),
  //                'avatar':AvatarPage(),
    //              'card':AlertPage(),
      //          };
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _lista(),
    );
  }

//metodo lista devuelve el widget ListView, este se encuebtra en el medio del Scaffold
  Widget _lista() {
    //Como leemos los datos de un Json se hace mediante un Future
    return FutureBuilder(
      //indicamos el future
      future: menuProvider.cargarData(),
      //datos iniciales
      initialData: [],
      //tras acabar l future realiza el buider, el cuel crea el widget
      //parametros: contexto y snapshot(del tipo de dato que devuelve el future)
      builder: (BuildContext context, AsyncSnapshot <List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data,context),
          );
      },
    ); 



  }

   List <Widget> _listaItems( List<dynamic> data, BuildContext context ) {
      final List<Widget> opciones=[];

      data.forEach((opt){

          final temp = ListTile(
            title: Text(opt['texto']) ,
            leading: getIcon(opt['icon']),
            trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blue,) ,
            onTap: (){

              Navigator.pushNamed(context, opt['ruta']);

              //final route=MaterialPageRoute(
                //builder:(context) =>rutas[opt['ruta']]
               // ,); 
              //Navigator.push(context,route );
            },);

            opciones..add(temp)
                    ..add(Divider());


      });
      return opciones;
   }
      


      
   
    

}
