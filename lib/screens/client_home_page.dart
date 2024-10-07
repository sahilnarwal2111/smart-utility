import 'package:flutter/material.dart';
import 'package:test_drive/screens/client_dashboard.dart';

class ClientProfile extends StatefulWidget{
  const ClientProfile({super.key});
  @override
  _ClientProfile createState() => _ClientProfile();
}

class _ClientProfile extends State<ClientProfile> {
  final GlobalKey<FormState> _clientProfile = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _address1 = "";
  String _address2 = "";

  void _submitForm(){
    if(_clientProfile.currentState!.validate()){
      _clientProfile.currentState!.save();

      print('Name: $_name');
      print('Email: $_email');
      print('Address 1: $_address1');
      print('Address 2: $_address2');

      //futher navigations can be added here
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Client s Profile'),
      
      ),
      body: Form(
        key: _clientProfile,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your name.';
                  }
                  return null;
                },
                onSaved: (value){
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter your email';
                  }
                  return null;
                },
                onSaved: (value){
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Address 1"),
                validator: (value){
                  if(value!.isEmpty){
                    return "Please Enter the address 1";
                  }
                  return null;
                },
                onSaved: (value){
                  _address1 = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Address 2"),
                validator: (value){
                  if(value!.isEmpty){
                    return "Please Enter the address 2";
                  }
                  return null;
                },
                onSaved: (value){
                  _address2 = value!;
                },
              ),
              const Expanded(
            flex: 1,
            child: SizedBox(
              height: 3,
            ),
          ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(                  
                  onPressed: () {
                     _clientProfile.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClientDashboard(
                          address1: _address1,
                          address2: _address2
                        )
                        ),
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ),
            ],
          ),
          ) 
      ),
    );
  }
  

}
  