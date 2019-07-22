

import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
   // ... app-specific localization delegate[s] here
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('en'), // English
    const Locale('es'), // español
  ],
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