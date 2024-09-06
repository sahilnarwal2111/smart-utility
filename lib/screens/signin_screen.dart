  import 'package:flutter/material.dart';
import 'package:test_drive/theme/theme.dart';
  import 'package:test_drive/widgets/custom_scaffold.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  @override
  Widget build(BuildContext context){
    return  CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              )
            ),
            child: Form(
              key: _formSignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: lightColorScheme.primary,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text('Email'),
                      hintText: 'Enter Email',
                      hintStyle: const TextStyle(
                        color: Colors.black26
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter Password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      hintText: 'Enter Password',
                      hintStyle: const TextStyle(
                        color: Colors.black26
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberPassword,
                            onChanged: (bool? value){
                              setState(() {
                                rememberPassword = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary,
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                              )
                        ],
                      )
                    ],
                  )

                ],
              ),
            ),
          ))
        
        
        
        ],
      ),
    );
  }
}