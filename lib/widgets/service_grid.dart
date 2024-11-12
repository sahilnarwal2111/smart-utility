// import 'package:flutter/material.dart';
// import 'package:test_drive/screens/booking_service_page.dart';


// class ServicesGrid extends StatelessWidget {
//   final List<Map<String, dynamic>> services = [
//     {"title": "Women's Salon & Spa", "icon": Icons.face_retouching_natural},
//     {"title": "Men's Salon & Massage", "icon": Icons.face},
//     {"title": "AC & Appliance Repair", "icon": Icons.ac_unit},
//     {"title": "Cleaning & Pest Control", "icon": Icons.cleaning_services},
//     {"title": "Electrician, Plumber & Carpenter", "icon": Icons.build},
//     {"title": "Native Water Purifier", "icon": Icons.water_damage},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GridView.builder(
//         shrinkWrap: true,  // Added this
//         physics: const NeverScrollableScrollPhysics(),  // Disables GridView's scrolling
//         itemCount: services.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: 3 / 2,
//         ),
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   services[index]['icon'] as IconData,
//                   size: 40,
//                   color: Colors.blue,
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   services[index]['title']!,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             onTap : () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (e) => BookingServicePage(service: services[index]['title']!),
//                 ),
//               );
//             }
            
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:test_drive/screens/booking_service_page.dart';

class ServicesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {"title": "Women's Salon & Spa", "icon": Icons.face_retouching_natural, "banner": "women-salon.jpg"},
    {"title": "Men's Salon & Massage", "icon": Icons.face, "banner": "men-salon.jpg"},
    {"title": "AC & Appliance Repair", "icon": Icons.ac_unit, "banner": "ac-repair.jpg"},
    {"title": "Cleaning & Pest Control", "icon": Icons.cleaning_services, "banner": "cleaning-pest-control.jpg"},
    {"title": "Electrician, Plumber & Carpenter", "icon": Icons.build, "banner": "electrician.jpg"},
    {"title": "Native Water Purifier", "icon": Icons.water_damage, "banner": "water-purifier.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,  // Added this
        physics: const NeverScrollableScrollPhysics(),  // Disables GridView's scrolling
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingServicePage(service: services[index]['title']!, banner: services[index]['banner']!),
                ),
              );
            },  // Wrap Navigator.push inside a closure
            child: Card(
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
                  const SizedBox(height: 10),
                  Text(
                    services[index]['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
