import 'package:flutter/material.dart';

class ServicesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {"title": "Women's Salon & Spa", "icon": Icons.face_retouching_natural},
    {"title": "Men's Salon & Massage", "icon": Icons.face},
    {"title": "AC & Appliance Repair", "icon": Icons.ac_unit},
    {"title": "Cleaning & Pest Control", "icon": Icons.cleaning_services},
    {"title": "Electrician, Plumber & Carpenter", "icon": Icons.build},
    {"title": "Native Water Purifier", "icon": Icons.water_damage},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,  // Added this
        physics: NeverScrollableScrollPhysics(),  // Disables GridView's scrolling
        itemCount: services.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  services[index]['icon'] as IconData,
                  size: 40,
                  color: Colors.blue,
                ),
                SizedBox(height: 10),
                Text(
                  services[index]['title']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
