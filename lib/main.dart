import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'First App with Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Learning Basics'),
        ),
        body:const Center(
          child: Text('Reached Middle of Application'),
        ),   
      ),

    );
  }
  
}
