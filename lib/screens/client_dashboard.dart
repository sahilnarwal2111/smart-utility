
import 'package:flutter/material.dart';
import 'package:test_drive/widgets/custom_search_delagate.dart';

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
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  widget.address1!,
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  widget.address2!,
                  style: const TextStyle(fontSize: 15.0),
                ),
                
              ],
            ),
             
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://unsplash.com/photos/black-flat-screen-computer-monitor-gA396xahf-Q',
              ),
            ),
          ],
        )
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: IconButton(
                      onPressed:(){
                        showSearch(context: context, delegate: CustomSearchDelegate());
                      }, 
                      icon: const Icon(Icons.search),
                    ),
              )
            ],
          ),
          const SizedBox(height: 120.0),
          //all cards from here
           
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
            color: Colors.amber[300],
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: Column(
                  children: <Widget>[
                      Text(
                        'Electrican',
                        textAlign: TextAlign.center,

                      ),
                      Image.network('https://unsplash.com/photos/man-in-blue-white-and-red-plaid-button-up-shirt-wearing-yellow-hard-hat-holding-black-zWOgsj3j0wA')
                  ],
                )
              )
            ),
          ),
          Card(
            color: Colors.amber[300],
            child: Container(
              width: 100,
              height: 100,
            ),
          ),
          Card(
            color: Colors.amber[300],
            child: Container(
              width: 100,
              height: 100,
            ),
          )
            ],
          ),
           const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
            color: Colors.amber[300],
            child: Container(
              width: 100,
              height: 100,
            ),
          ),
          Card(
            color: Colors.amber[300],
            child: Container(
              width: 100,
              height: 100,
            ),
          ),
          Card(
            color: Colors.amber[300],
            child: Container(
              width: 100,
              height: 100,
            ),
          )
            ],
          ),
            const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
            color: Colors.amber[300],
            child: Container(
              width: 100,
              height: 100,
            ),
          ),
          Card(
            color: Colors.amber[300],
            child: Container(
              width: 100,
              height: 100,
            ),
          ),
          Card(
            color: Colors.amber[300],
            child: Container(
              width: 100,
              height: 100,
            ),
          )
            ],
          ) ,

        ],
      )
    );
    
  
  }
}