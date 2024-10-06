import 'package:flutter/material.dart';
import 'package:test_drive/screens/signin_screen_client.dart';
import 'package:test_drive/screens/signup_screen_client.dart';
import 'package:test_drive/widgets/custom_scaffold.dart';
import 'package:test_drive/widgets/welcome_button.dart';
import 'package:test_drive/theme/theme.dart';
import 'package:test_drive/widgets/toggle_button.dart';
import 'package:test_drive/screens/signin_screen_provider.dart';
import 'package:test_drive/screens/signup_screen_provider.dart';

class WelcomeScreen extends StatelessWidget{
  WelcomeScreen({super.key});
  String selectedState = 'Client';
  void handleSelectionChnage(String value){
    selectedState = value;
  }
  

  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome to Smart Utility!\n',
                        style: TextStyle(
                          fontSize: 45.0
                          ,fontWeight: FontWeight.w600                        
                          )
                      ),
                      
                    ]
                  )
                ),
                ),
          )
          ),
          Center(
            child: ToggleButtonClientProvider(
              onSelectedChanged: handleSelectionChnage,
            ),
          ),
          Flexible(
            flex: 1,
            child : Align(
              alignment: Alignment.bottomRight,
              child: Row(
              children: [
                Expanded(
                  child: WelcomeButton(
                    buttonText: 'Sign in',
                    onTap: (context) {
                      if(selectedState == 'Client'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClientSignInScreen()),
                        );
                      }
                      else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProviderSignInScreen()),
                        );
                      }
                    },
                    color: Colors.transparent,
                    textColor: Colors.white,
                  )
                  ),
                Expanded(
                  child: WelcomeButton(
                    buttonText: 'Sign up',
                    onTap: (context) {
                      if(selectedState == 'Client'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClientSignUpScreen()),
                        );
                      }
                      else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProviderSignUpScreen()),
                        );
                      }
                    },
                    color: Colors.white,
                    textColor: lightColorScheme.primary,
                  )
                  ),
                
              ],
          )
            )
            ),
        ],
      )
      );
  }
}

