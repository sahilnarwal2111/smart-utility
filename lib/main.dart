import 'package:flutter/material.dart';
import 'package:test_drive/screens/welcome_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'First App with Flutter',
      home: const WelcomeScreen()

    );
  }
  
}
