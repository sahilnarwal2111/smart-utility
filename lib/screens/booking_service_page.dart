// import 'package:flutter/material.dart';
// import 'package:test_drive/screens/checkout_page.dart';
// class BookingServicePage extends StatelessWidget{
//   final String service;
//   final String banner;
//   BookingServicePage({required this.service, required this.banner});

//   // need to make a api call to fetch all providers from database
//   /*
//     final url = Uri.parse('http://10.0.2.2:3001/get-providers-with-service');
//     final headers = {'Content-Type': 'application/json'};
//       final body = json.encode({
//         'service': service,  // Replace with your actual data
//       });

//       try and catch block

//       and update providers
//    */
//   final List<Map<String, dynamic>> providers = [
//     {"shopName": "Provider 1", "price": "\$50", "rating": 4.5},
//     {"shopName": "Provider 2", "price": "\$30", "rating": 4.0},
//     {"shopName": "Provider 3", "price": "\$70", "rating": 5.0},
//   ];
    
//   @override
//    Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Banner Image
//           Container(
//             width: double.infinity,
//             height: 200, // Adjust height based on design
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               image: DecorationImage(
//                 image: AssetImage('assets/images/services-banner/$banner'), // Replace with actual URL
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: const Center(
//               child: Text(
//                 '',
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),

//           // Service Name
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               service,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orangeAccent,
//               ),
//             ),
//           ),

//           // List of Providers
//           Expanded(
//             child: ListView.builder(
//               itemCount: providers.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       // print("Clicked Checkout widget,,,");
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CheckoutView(
//                             serviceName: providers[index]['shopName'],
//                             providerName: service,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Card(
                    
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     elevation: 4,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 providers[index]['shopName'],
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text('Price: ${providers[index]['price']}'),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               const Text('Rating'),
//                               const SizedBox(height: 8),
//                               Text(
//                                 providers[index]['rating'].toString(),
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   ),
                  
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );

//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_drive/screens/checkout_page.dart';

class BookingServicePage extends StatefulWidget {
  final String service;
  final String banner;
  final String? clientName;

  BookingServicePage({required this.service, required this.banner, required this.clientName});

  @override
  _BookingServicePageState createState() => _BookingServicePageState();
}

class _BookingServicePageState extends State<BookingServicePage> {
  List<Map<String, dynamic>> providers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProviders(); // Fetch providers on initialization
  }

  // Future<void> fetchProviders() async {
  //   final url = Uri.parse('http://10.0.2.2:3001/api/get-details/get-providers-with-service');
  //   final headers = {'Content-Type': 'application/json'};
  //   final body = json.encode({'service': widget.service});
  //   print(widget.service);
  //   try {
  //     final response = await http.post(url, headers: headers, body: body);

  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
        
  //       setState(() {
  //         providers = data.map((e) => e as Map<String, dynamic>).toList();
  //         isLoading = false;
  //       });
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error: ${response.reasonPhrase}')),
  //       );
  //     }
  //   } catch (error) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error fetching providers: $error')),
  //     );
  //   }
  // }
  Future<void> fetchProviders() async {
  final url = Uri.parse('http://10.0.2.2:3001/api/get-details/get-providers-with-service');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({'service': widget.service});

  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> data = responseData['providers'];

      setState(() {
        providers = data.map((provider) {
          return {
            "shopName": provider['username'], // Extract the username
            "price": "N/A", // Placeholder if price is not in the response
            "rating": "N/A" // Placeholder if rating is not in the response
          };
        }).toList();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${response.reasonPhrase}')),
      );
    }
  } catch (error) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error fetching providers: $error')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Image
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/services-banner/${widget.banner}'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Service Name
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.service,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),
          ),

          // Loading or Provider List
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : providers.isEmpty
                  ? const Center(child: Text("No providers available."))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: providers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutView(
                                      providerName: widget.service,
                                      serviceName: providers[index]['shopName']
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            providers[index]['shopName'],
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text('Price: ${providers[index]['price']}'),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text('Rating'),
                                          const SizedBox(height: 8),
                                          Text(
                                            providers[index]['rating'].toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
