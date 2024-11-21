
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderDashboard extends StatefulWidget {
  final String email;
  const ProviderDashboard({required this.email});
  @override
  _ProviderDashboardState createState() => _ProviderDashboardState();
}

class _ProviderDashboardState extends State<ProviderDashboard> {
  List<dynamic> bookings = [];
  List<dynamic> filteredBookings = [];
  bool isLoading = true;
  bool showUpcoming = true; // Toggle between "Upcoming" and "History"

  @override
  void initState() {
    super.initState();
    fetchBookings(); // Fetch bookings when the widget is initialized
  }

  Future<void> fetchBookings() async {
    final url = Uri.parse('http://10.0.2.2:3001/api/get-details/get-bookings-provider');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'username': widget.email}); // Replace with actual provider name

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> allBookings = data['bookings'] ?? [];
        setState(() {
          bookings = allBookings;
          filterBookings(); // Filter the bookings after fetching
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

  void filterBookings() {
    final now = DateTime.now();

    if (showUpcoming) {
      // Filter for future bookings
      filteredBookings = bookings.where((booking) {
        final bookingDate = DateTime.parse(booking['date']);
        final bookingTime = int.parse(booking['time']);
        final bookingDateTime = bookingDate.add(Duration(hours: bookingTime));
        return bookingDateTime.isAfter(now);
      }).toList();
    } else {
      // Filter for past bookings
      filteredBookings = bookings.where((booking) {
        final bookingDate = DateTime.parse(booking['date']);
        final bookingTime = int.parse(booking['time']);
        final bookingDateTime = bookingDate.add(Duration(hours: bookingTime));
        return bookingDateTime.isBefore(now);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Dashboard"),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      showUpcoming = true; // Show upcoming orders
                      filterBookings();
                    });
                  },
                  child: Text(
                    "Upcoming Orders",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: showUpcoming ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      showUpcoming = false; // Show history
                      filterBookings();
                    });
                  },
                  child: Text(
                    "History",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: !showUpcoming ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : filteredBookings.isEmpty
                    ? Center(
                        child: Text(
                          showUpcoming
                              ? "No upcoming bookings found."
                              : "No past bookings found.",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredBookings.length,
                        itemBuilder: (context, index) {
                          final booking = filteredBookings[index];
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
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Client: ${booking['client']}"),
                                  Text("Date: ${booking['date']}"),
                                  Text("Time: ${booking['time']}"),
                                ],
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
          ),
        ],
      ),
    );
  }
}
