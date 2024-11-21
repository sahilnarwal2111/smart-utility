// import 'package:flutter/material.dart';
// import 'package:test_drive/theme/theme.dart';
// import 'package:test_drive/components/no_transaction_message.dart';

// class OrderView extends StatelessWidget {
//   final String clientName;

//   // Constructor to accept the clientName
//   OrderView({required this.clientName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Center(
//         child: SingleChildScrollView(
//           child: NoTranscationMessage(
//             messageTitle: "No Transactions, yet.",
//             messageDesc:
//                 "You have never placed an order. Let's explore the sport venue near you.",
//           ),
//         ),
//       ),
//     );
//   }
// }

// // i want to make an api call and 
// /*
// final url = Uri.parse('http://10.0.2.2:3001/api/get-details/get-bookings-client');
// //   final headers = {'Content-Type': 'application/json'};
// //   final body = json.encode({'username': widget.clientName});

// response would look like this
// {
//     "message": "all booking by client",
//     "bookings": [
//         {
//             "_id": "673b6e1c16e7ea46280942b4",
//             "client": "first",
//             "provider": "mainProvider",
//             "service": "ac & applicance repair",
//             "price": "999",
//             "__v": 0
//         },
//         {
//             "_id": "673c1db5c5bdf74aa0b6fa26",
//             "client": "first",
//             "provider": "mainProvider",
//             "service": "ac & appliance repair",
//             "price": "999",
//             "__v": 0
//         },
//       ]
// }
// i want to list all the booking made by the user 
// so write the complete code
//  */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderView extends StatefulWidget {
  final String clientName;

  // Constructor to accept the clientName
  OrderView({required this.clientName});

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  List<dynamic> bookings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBookings(); // Call the API when the widget is initialized
  }

  Future<void> fetchBookings() async {
    final url = Uri.parse('http://10.0.2.2:3001/api/get-details/get-bookings-client');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'username': widget.clientName});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          bookings = data['bookings'] ?? [];
          isLoading = false;
        });
      } else {
        // Handle non-200 responses
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to fetch bookings');
      }
    } catch (error) {
      // Handle errors
      setState(() {
        isLoading = false;
      });
      print('Error fetching bookings: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Bookings"),
      ),
      backgroundColor: Colors.grey[200],
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : bookings.isEmpty
              ? Center(
                  child: Text(
                    "No bookings found.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.book_online,
                          color: Colors.blue,
                        ),
                        title: Text(
                          booking['service'] ?? "Unknown Service",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Provider: ${booking['provider']}\nPrice: ₹${booking['price']}",
                        ),
                        trailing: Text(
                          "₹${booking['price']}",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
