import 'package:flutter/material.dart';

class ProviderProfile extends StatefulWidget{
  const ProviderProfile({super.key});
  @override
  _ProviderProfile createState() => _ProviderProfile();
}

class _ProviderProfile extends State<ProviderProfile> {
  final GlobalKey<FormState> _providerProfile = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _address1 = "";
  String _workType = "";

  void _submitForm(){
    if(_providerProfile.currentState!.validate()){
      _providerProfile.currentState!.save();

      print('Name: $_name');
      print('Email: $_email');
      print('Address 1: $_address1');
      print('Address 2: $_workType');

      //futher navigations can be added here
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider s Profile'),
      
      ),
      body: Form(
        key: _providerProfile,
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
                  _workType = value!;
                },
              )
            ],
          ),
          ) 
      ),
    );
  }
  

}
  