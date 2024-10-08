import 'package:flutter/material.dart';

class DashboardSearch extends StatefulWidget{
  const DashboardSearch({super.key});
  
  @override
  State<DashboardSearch> createState() => _DashboardSearch();
  
  
}

class _DashboardSearch extends State<DashboardSearch> {
  @override
  final List<String> services = ['Electrician', 'Plumber', 'Hair Cur for Men', 'Hair Cut for Women', 'AC Service', 'House Cleaning'];
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
            builder : (BuildContext context, SearchController controller){
              return SearchBar(
                controller : controller,
                padding : const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_){
                  controller.openView();
                },
                leading: const Icon(Icons.search),
                
              );
            },
            suggestionsBuilder: (BuildContext context, SearchController controller){
              return List<ListTile>.generate(services.length, (int index) {
                final String item = services[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
                }
              );
              
            }
          )
          
        );
    
  }
  
}