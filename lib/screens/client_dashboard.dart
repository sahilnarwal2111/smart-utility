import 'package:flutter/material.dart';

class ClientDashboard extends StatefulWidget{
  final String? address1;
  final String? address2;


  const ClientDashboard({Key? key,  this.address1, this.address2}) : super(key: key);

  @override
  _ClientDashboardState createState() => _ClientDashboardState();
  

}

class _ClientDashboardState extends State<ClientDashboard> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
           title: (
                Text(widget.address1!)
            
           ), 
      ),
    );
  }
}