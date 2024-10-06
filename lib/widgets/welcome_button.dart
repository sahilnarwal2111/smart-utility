import 'package:flutter/material.dart';
import 'package:test_drive/screens/signin_screen_client.dart';
import 'package:test_drive/screens/signin_screen_provider.dart';

class WelcomeButton extends StatelessWidget{
  const WelcomeButton({super.key, this.buttonText, this.onTap, this.color, this.textColor, this.selectedState});

  final String? buttonText;
final Function(BuildContext)? onTap; 
  final Color? color;
  final Color? textColor;
  final String? selectedState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap != null){
          onTap!(context);
        }
        // else {
        //   // Fallback logic for handling navigation based on selectedState
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) {
        //         if (selectedState == 'Client') {
        //           return ClientSignInScreen(); // Default screen for client
        //         } else {
        //           return ProviderSignInScreen(); // Default screen for provider
        //         }
        //       },
        //     ),
        //   );
        // }
      },
      child: Container(
        padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: color!,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50)
        )
      ),
      child:  Text(
        buttonText!,
        textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: textColor!

      ),
      ),
    )
    );
    
    
    
  }

}