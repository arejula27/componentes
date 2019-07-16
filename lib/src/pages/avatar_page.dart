import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          
          CircleAvatar(
            child: Text('IA'),
          ),
          SizedBox(width: 10.0,),
        ],
      ),
      
      floatingActionButton: Row(children: <Widget>[
         SizedBox(width: 30.0,),
        FloatingActionButton(
          child:Icon(Icons.arrow_back_ios) ,
          onPressed: (){
            Navigator.pop(context);
          },),
          Expanded(child: SizedBox(width: 1.0,)),

      ],),
        
      
         
       
    );
  }
}