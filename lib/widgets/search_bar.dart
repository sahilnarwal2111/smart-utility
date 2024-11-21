import 'package:flutter/material.dart';
import 'package:test_drive/screens/booking_service_page.dart';

class DashboardSearch extends StatefulWidget{
  const DashboardSearch({super.key});
  
  @override
  State<DashboardSearch> createState() => _DashboardSearch();
  
  
}

class _DashboardSearch extends State<DashboardSearch> {
  // final String? clientName;
  final List<Map<String, dynamic>> services = [
    {"title": "Women's Salon & Spa", "icon": Icons.face_retouching_natural, "banner": "women-salon.jpg"},
    {"title": "Men's Salon & Massage", "icon": Icons.face, "banner": "men-salon.jpg"},
    {"title": "AC & Appliance Repair", "icon": Icons.ac_unit, "banner": "ac-repair.jpg"},
    {"title": "Cleaning & Pest Control", "icon": Icons.cleaning_services, "banner": "cleaning-pest-control.jpg"},
    {"title": "Electrician, Plumber & Carpenter", "icon": Icons.build, "banner": "electrician.jpg"},
    {"title": "Native Water Purifier", "icon": Icons.water_damage, "banner": "water-purifier.jpg"},
  ];
  // DashboardSearch({required this.clientName})
  @override
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
                final String item = services[index]['service'];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingServicePage(service: item, banner: services[index]['banner'], clientName: "first",),
                        ),
                      );
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