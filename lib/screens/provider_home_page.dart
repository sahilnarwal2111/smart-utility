// import 'package:flutter/material.dart';
// import 'package:test_drive/screens/client_dashboard.dart';
// import 'dart:convert'; // For JSON decoding
// import 'package:http/http.dart' as http;
// import 'package:test_drive/screens/provider_dashboard.dart';

// class ProviderProfile extends StatefulWidget {
//   final String email;
//   const ProviderProfile({required this.email});

//   @override
//   _ProviderProfile createState() => _ProviderProfile();
// }

// class _ProviderProfile extends State<ProviderProfile> {
//   final GlobalKey<FormState> _providerProfile = GlobalKey<FormState>();

//   // Store the fetched data from the API
//   String _email = "";
//   String _name = "";
//   String _address1 = "";
//   String _address2 = "";
//   String _phone = "";
//   String? _service;

//   // Flag to check if the data is being loaded
//   bool _isLoading = false;

//   // Fetch user details using API
//   Future<void> _fetchProviderDetails(String email) async {
//     try {
//       // Dummy API call (replace with your actual API URL)
//       var response = await http.get(Uri.parse('https://api.example.com/getProvider?email=$email'));

//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);

//         // Assuming API returns {"name": "", "address1": "", "address2": "", "phone": ""}
//         setState(() {
//           _name = data['name'];
//           _address1 = data['address1'];
//           _address2 = data['address2'];
//           _phone = data['phone'];
//           _isLoading = false; // Mark as loaded
//         });
//       } else {
//         throw Exception('Failed to load provider details');
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _email = widget.email;
//     // Call the function to fetch provider details
//     _fetchProviderDetails(_email);
//   }

//   void _submitForm() {
//     if (_providerProfile.currentState!.validate()) {
//       _providerProfile.currentState!.save();

//       print('Email: $_email');
//       print('Name: $_name');
//       print('Address 1: $_address1');
//       print('Address 2: $_address2');
//       print('Phone: $_phone');

//       // Further navigation or actions can be added here
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Provider's Profile",
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Form(
//                       key: _providerProfile,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           const Text(
//                             'Profile Information',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blueAccent,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: 20),
//                           _buildTextField(
//                             labelText: 'Name',
//                             initialValue: _name,
//                             onSaved: (value) => _name = value,
//                           ),
//                           const SizedBox(height: 15),
//                           _buildTextField(
//                             labelText: 'Email',
//                             initialValue: _email,
//                             readOnly: true, // Email is not editable
//                           ),
//                           const SizedBox(height: 15),
//                           _buildTextField(
//                             labelText: 'Address 1',
//                             initialValue: _address1,
//                             onSaved: (value) => _address1 = value,
//                           ),
//                           const SizedBox(height: 15),
//                           _buildTextField(
//                             labelText: 'Address 2',
//                             initialValue: _address2,
//                             onSaved: (value) => _address2 = value,
//                           ),
//                           const SizedBox(height: 15),
//                           _buildTextField(
//                             labelText: 'Phone',
//                             initialValue: _phone,
//                             onSaved: (value) => _phone = value,
//                           ),
//                           const SizedBox(height: 15),
                        
//                           DropdownButtonFormField<String>(
//                             value: _service, // Current selected value
//                             onChanged: (value) {
//                               setState(() {
//                                 _service = value; // Update selected service
//                               });
//                             },
//                             onSaved: (value) {
//                               _service = value!; // Save the selected service
//                             },
//                             decoration: const InputDecoration(
//                               labelText: 'Service',
//                               border: OutlineInputBorder(),
//                             ),
//                             items: [
//                               "Women's Salon & Spa",
//                               "Men's Salon & Massage",
//                               "AC & Appliance Repair",
//                               "Cleaning & Pest Control",
//                               "Electrician, Plumber & Carpenter",
//                               "Native Water Purifier",
//                             ].map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                           ),
//                           const SizedBox(height: 30),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(vertical: 15),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             onPressed: () {
//                               _submitForm();
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ProviderDashboard(
//                                    email: widget.email,
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: const Text(
//                               'Save & Proceed',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   // Custom reusable TextFormField builder
//   Widget _buildTextField({
//     required String labelText,
//     required String initialValue,
//     bool readOnly = false,
//     Function(String)? onSaved,
//   }) {
//     return TextFormField(
//       initialValue: initialValue,
//       readOnly: readOnly,
//       decoration: InputDecoration(
//         labelText: labelText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Please enter $labelText';
//         }
//         return null;
//       },
//       onSaved: onSaved != null ? (value) => onSaved(value!) : null,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http;
import 'package:test_drive/screens/provider_dashboard.dart';

class ProviderProfile extends StatefulWidget {
  final String email;

  const ProviderProfile({required this.email});

  @override
  _ProviderProfile createState() => _ProviderProfile();
}

class _ProviderProfile extends State<ProviderProfile> {
  final GlobalKey<FormState> _providerProfile = GlobalKey<FormState>();

  // Store the fetched data from the API
  String _email = "";
  String _name = "";
  String _address1 = "";
  String _address2 = "";
  String _phone = "";
  String? _service;

  // Flag to check if the data is being loaded
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _email = widget.email;
    _fetchProviderDetails(); // Fetch provider details on initialization
  }

  Future<void> _fetchProviderDetails() async {
    final url = Uri.parse('http://10.0.2.2:3001/api/get-details/get-provider-data');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'username': _email});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Assuming API response contains "data" with provider details
        setState(() {
          final providerData = data['data'];
          _name = providerData['email'] ?? "";
          _address1 = providerData['address1'] ?? "";
          _address2 = providerData['address2'] ?? "";
          _phone = providerData['phone'] ?? "";
          _service = providerData['services']?.isNotEmpty == true ? providerData['services'][0] : null;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch provider details');
      }
    } catch (error) {
      print("Error fetching provider details: $error");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _updateProviderDetails() async {
    if (_providerProfile.currentState!.validate()) {
      _providerProfile.currentState!.save();

      final url = Uri.parse('http://10.0.2.2:3001/api/modify/update-provider');
      final headers = {'Content-Type': 'application/json'};

      // Prepare the body with all key-value pairs to be updated
      final body = json.encode({
        'username': _email,
        'name': _name,
        // 'address1': _address1,
        // 'address2': _address2,
        'phone': _phone,
        'services': [_service], // Send selected service as a list
      });

      try {
        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          print("Update Response: ${data['message']}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'])),
          );
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=> ProviderDashboard(email : _email)),
            );
        } else {
          throw Exception('Failed to update provider details');
        }
      } catch (error) {
        print("Error updating provider details: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error updating provider details")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Provider's Profile",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _providerProfile,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Profile Information',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            labelText: 'Email',
                            initialValue: _name,
                            onSaved: (value) => _name = value,
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            labelText: 'Username',
                            initialValue: _email,
                            readOnly: true, // Email is not editable
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            labelText: 'Address 1',
                            initialValue: _address1,
                            onSaved: (value) => _address1 = value,
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            labelText: 'Address 2',
                            initialValue: _address2,
                            onSaved: (value) => _address2 = value,
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            labelText: 'Phone',
                            initialValue: _phone,
                            onSaved: (value) => _phone = value,
                          ),
                          const SizedBox(height: 15),
                          // DropdownButtonFormField<String>(
                          //   value: _service, // Current selected value
                          //   onChanged: (value) {
                          //     setState(() {
                          //       _service = value; // Update selected service
                          //     });
                          //   },
                          //   onSaved: (value) {
                          //     _service = value; // Save the selected service
                          //   },
                          //   decoration: const InputDecoration(
                          //     labelText: 'Service',
                          //     border: OutlineInputBorder(),
                          //   ),
                          //   items: [
                          //     "Women's Salon & Spa",
                          //     "Men's Salon & Massage",
                          //     "AC & Appliance Repair",
                          //     "Cleaning & Pest Control",
                          //     "Electrician Plumber & Carpenter",
                          //     "Native Water Purifier",
                          //   ].map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please select a service';
                          //     }
                          //     return null;
                          //   },
                          // ),
                           _buildTextField(
                            labelText: 'Service',
                            initialValue: _service!,
                            onSaved: (value) => _service = value,
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: _updateProviderDetails,
                            child: const Text(
                              'Save & Proceed',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  // Custom reusable TextFormField builder
  Widget _buildTextField({
    required String labelText,
    required String initialValue,
    bool readOnly = false,
    Function(String)? onSaved,
  }) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
      onSaved: onSaved != null ? (value) => onSaved(value!) : null,
    );
  }
}
