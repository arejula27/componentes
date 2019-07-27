import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSli = 10.0;
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders'),),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child:Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckboxList(),
            _crearSwitch(),

            //para centrar uso expanded
            Expanded(
              child: _crearImagen(),
            ) ,
            
          
            
          ],

        ) ,),
      
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.amber,
      //solo funciona si hay divisions (el label)
      label: 'Tamaño de la imagen: ${_valorSli.toString().replaceRange(3, _valorSli.toString().length, '') }',
      //divisions: 20,
      value:_valorSli,
      min: 10.0,
      max: 400.0,
      //con null se bloquean los widgets en el onChanged
      onChanged: (_check)?null: (valor){
        setState(() {
          _valorSli=valor;
        });
        
        
        print(valor);
      },
      

    );
  }

  Widget _crearImagen() {

    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage('https://www.dzoom.org.es/wp-content/uploads/2018/06/aislamiento-elemento-paisaje-angular-734x489.jpg'),
      width: _valorSli,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {

return Checkbox(
  value: _check,
  onChanged: (valor){
    _check=valor;
    setState(() {
      
    });
  },

);


  }

  Widget _crearCheckboxList() {

return CheckboxListTile(
  title: Text('Bloquear Slider'),
  value: _check,
  onChanged: (valor){
    _check=valor;
    setState(() {
      
    });
  },

);


  }

  _crearSwitch() {

    return SwitchListTile(
  title: Text('Bloquear Slider'),
  value: _check,
  onChanged: (valor){
    _check=valor;
    setState(() {
      
    });
  },

);


  }
}