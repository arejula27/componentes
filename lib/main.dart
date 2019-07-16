

import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
     
      initialRoute: 'home',
      //ver la funcion getAplicationRoutes 
      routes:getAplicationRoutes(),
      //en caso de que la ruta no exista:
      onGenerateRoute: (RouteSettings settings ){
        print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext contexte) => AlertPage()
        );
      },
    );
  }
}