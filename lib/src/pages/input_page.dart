import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre='';
  String _email='';
  String  _password='';
  String  _fecha='';
  String _optSelect='Volar';
  List <String> _poderes=['Volar','Invisibilidad','Fuerza'];
//nos permitira cambiar una caja de texto
  TextEditingController _inputFieldDate = new TextEditingController();
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
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _dropDown(),
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
      textCapitalization: TextCapitalization.words,
      autocorrect: true,
      decoration:InputDecoration(
        //contador bajo el TextField
        counter: Text('letras ${_nombre.length}'),
        //Texto en el text field previo a escribir(ayuda al usuario)
        hintText: 'nombre de la persona',
        //etiqueta o titulo
        labelText: 'Nombre',
        //helperText: 'Holi',
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
      title: Text('Su nombre es $_nombre'),
      subtitle:Text('Su email es $_email') ,
      trailing: Text(_optSelect),
      );

}

  Widget _crearEmail() {

    return TextField(
      
      keyboardType: TextInputType.emailAddress,
      //Auto poner en mayusculas 
      
      
      decoration:InputDecoration(
        
        //Texto en el text field previo a escribir(ayuda al usuario)
        hintText: 'Ingrese su correo electronico:',
        //etiqueta o titulo
        labelText: 'Email',
       
        //icono a la derecha del texto
        suffixIcon: Icon(Icons.alternate_email) ,
        ///icono a la izquierda
        icon: Icon(Icons.mail),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),

      ),
      onChanged: (valor)=>setState((){
        _email=valor;
      })
    );
    
  }

  Widget _crearPassword() {

     return TextField(

      //para contraseñas
      obscureText: true,
      //Auto poner en mayusculas 
      
      
      decoration:InputDecoration(
        
        //Texto en el text field previo a escribir(ayuda al usuario)
        hintText: 'Ingrese su correo contraseña:',
        //etiqueta o titulo
        labelText: 'Password',
       
        //icono a la derecha del texto
        suffixIcon: Icon(Icons.alternate_email) ,
        ///icono a la izquierda
        icon: Icon(Icons.mail),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),

      ),
      onChanged: (valor)=>setState((){
        _password=valor;
        //print('$_password');
      })
    );

  }

  Widget _crearFecha(BuildContext context) {

 return TextField(

   //el contrlador de a caja de texto
   controller: _inputFieldDate,
   

      enableInteractiveSelection: false,
      decoration:InputDecoration(
        
        //Texto en el text field previo a escribir(ayuda al usuario)
        hintText: 'Fecha de nacimiento',
        //etiqueta o titulo
        labelText: 'Fecha de nacimiento',
       
        //icono a la derecha del texto
        suffixIcon: Icon(Icons.perm_contact_calendar) ,
        ///icono a la izquierda
        icon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),

      ),
      onTap:(){
        //para que parezca que no se puede seleccioar
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );

  }

   _selectDate(BuildContext context) async{
     

     DateTime picked =await showDatePicker(
      locale: Locale('es'),
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2025),
     );
     if (picked != null){
       
       _fecha = picked.toString();
       _fecha=_fecha.replaceRange(11, _fecha.length, '');
       _inputFieldDate.text=_fecha;
     }
   }

  List<DropdownMenuItem<String>> getOpcionesDrp(){

    List<DropdownMenuItem<String>> lista= new List();

      _poderes.forEach((poder){
        
        lista.add(DropdownMenuItem(
          //lo que se muestra
          child: Text(poder),
          //lo que espera el dropDown
          value: poder,  
        ));
      });


    return lista;
  }

  Widget _dropDown() {

    return Row(

      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
                  child: DropdownButton(
          //anchura
          isExpanded: false ,
          //altura 
          isDense: false,

          value: _optSelect,
          items: getOpcionesDrp() ,
       onChanged: (opt){
            setState(() {
             _optSelect=opt;
            });
          

          },
          ),
        ),
        SizedBox(width: 30.0,),


      ],
    ); 
    
    
     
  }
}