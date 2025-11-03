import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor:Colors.blueAccent,
    appBar:AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text("Telegram"),
      titleTextStyle: TextStyle(color:Colors.white,fontSize:26),

    ),
     floatingActionButton: FloatingActionButton
      (
  onPressed:(){
      
      },
    child:Text("+"),
       ),
     ),
  ),
);
