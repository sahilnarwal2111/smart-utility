import 'package:flutter/material.dart';
import 'package:test_drive/screens/checkout_page.dart';
class BookingServicePage extends StatelessWidget{
  final String service;
  final String banner;
  BookingServicePage({required this.service, required this.banner});

  // need to make a api call to fetch all providers from database
  final List<Map<String, dynamic>> providers = [
    {"shopName": "Provider 1", "price": "\$50", "rating": 4.5},
    {"shopName": "Provider 2", "price": "\$30", "rating": 4.0},
    {"shopName": "Provider 3", "price": "\$70", "rating": 5.0},
  ];
    
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Image
          Container(
            width: double.infinity,
            height: 200, // Adjust height based on design
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/images/services-banner/$banner'), // Replace with actual URL
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Text(
                '',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Service Name
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              service,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),
          ),

          // List of Providers
          Expanded(
            child: ListView.builder(
              itemCount: providers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("Clicked Checkout widget,,,");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutView(
                            serviceName: providers[index]['shopName'],
                            providerName: service,
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