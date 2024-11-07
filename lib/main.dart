import 'package:flutter/material.dart';
import 'package:test_drive/screens/welcome_screen.dart';
import 'package:test_drive/screens/checkout_page.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'First App with Flutter',
      home: WelcomeScreen(),
      // home: CheckoutView(
      //   serviceName: "Serivice1",
      //   providerName: "Provider1",
      // ),

    );
  }
  
}
