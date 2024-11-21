// import 'package:flutter/material.dart';
// import 'package:test_drive/theme/theme.dart';
// import 'package:test_drive/components/no_transaction_message.dart';

// class HistoryView extends StatelessWidget {
//   final String? clientName;
//   const HistoryView({Key? key, this.clientName}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Center(
//         child: SingleChildScrollView(
//           child: NoTranscationMessage(
//             messageTitle: "No Completed Order, yet.",
//             messageDesc:
//                 "Please Complete your order. . . \nif you don't have one, Let's explore sport venue near you.",
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoryView extends StatefulWidget {
  final String clientName;

  // Constructor to accept the clientName
  HistoryView({required this.clientName});

  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  List<dynamic> bookings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBookings(); // Call the API when the widget is initialized
  }

  // Future<void> fetchBookings() async {
  //   final url = Uri.parse('http://10.0.2.2:3001/api/get-details/get-bookings-client');
  //   final headers = {'Content-Type': 'application/json'};
  //   final body = json.encode({'username': widget.clientName});

  //   try {
  //     final response = await http.post(url, headers: headers, body: body);
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         bookings = data['bookings'] ?? [];
  //         isLoading = false;
  //       });
  //     } else {
  //       // Handle non-200 responses
  //       setState(() {
  //         isLoading = false;
  //       });
  //       throw Exception('Failed to fetch bookings');
  //     }
  //   } catch (error) {
  //     // Handle errors
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print('Error fetching bookings: $error');
  //   }
  // }
 Future<void> fetchBookings() async {
  final url = Uri.parse('http://10.0.2.2:3001/api/get-details/get-bookings-client');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({'username': widget.clientName});

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> allBookings = data['bookings'] ?? [];
      
      // Get current date and time
      final now = DateTime.now();

      // Filter bookings for future dates and times
      final filteredBookings = allBookings.where((booking) {
        try {
          // Parse date and time from strings
          final bookingDate = DateTime.parse(booking['date']); // Ensure 'date' is in 'YYYY-MM-DD' format
          final bookingTime = int.parse(booking['time']); // Parse the hour (string) to an integer

          
          // Determine if the booking is in the future
          if (bookingDate.isBefore(now)) {
            return true; // Future date
          } else if (bookingDate.isAtSameMomentAs(DateTime(now.year, now.month, now.day))) {
            return bookingTime < now.hour; // Same day, future time
          }
        } catch (e) {
          print('Error parsing booking date/time: $e');
        }
        return false; // Past date or invalid format
      }).toList();

      setState(() {
        bookings = filteredBookings;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to fetch bookings');
    }
  } catch (error) {
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
