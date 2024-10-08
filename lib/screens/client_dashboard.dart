
import 'package:flutter/material.dart';
import 'package:test_drive/widgets/search_bar.dart';

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
        backgroundColor: Colors.blue[100],
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
            const Spacer(),
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1573497491208-6b1acb260507',
              ),
            ),
          ],
        )
      ),
      body: Container(
        height: double.infinity,
        color: Colors.blue[100],
        child: SingleChildScrollView(
        child: Column(
        children: <Widget>[

          const DashboardSearch(),
          const SizedBox(height: 60.0),
          //all cards from here
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: Text(
                'Explore all Services',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              )
            ],
          ),
          // const SizedBox(height: 30.0),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
            color: Colors.amber[300],
            child: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: Column(
                  children: <Widget>[
                      const Text(
                        'Electrican',
                        textAlign: TextAlign.center,

                      ),
                      Image.network(
                        'https://images.unsplash.com/photo-1573497491208-6b1acb260507',
                        height: 80,
                        width: 80,
                        )
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
      ),
      ),
      )
    );
    
  
  }
}