import 'package:flutter/material.dart';
import 'package:test_drive/screens/client_dashboard.dart';
import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http;

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

  // Flag to check if the data is being loaded
  bool _isLoading = false;

  // Fetch user details using API
  Future<void> _fetchProviderDetails(String email) async {
    try {
      // Dummy API call (replace with your actual API URL)
      var response = await http.get(Uri.parse('https://api.example.com/getProvider?email=$email'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        // Assuming API returns {"name": "", "address1": "", "address2": "", "phone": ""}
        setState(() {
          _name = data['name'];
          _address1 = data['address1'];
          _address2 = data['address2'];
          _phone = data['phone'];
          _isLoading = false; // Mark as loaded
        });
      } else {
        throw Exception('Failed to load provider details');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    _email = widget.email;
    // Call the function to fetch provider details
    _fetchProviderDetails(_email);
  }

  void _submitForm() {
    if (_providerProfile.currentState!.validate()) {
      _providerProfile.currentState!.save();

      print('Email: $_email');
      print('Name: $_name');
      print('Address 1: $_address1');
      print('Address 2: $_address2');
      print('Phone: $_phone');

      // Further navigation or actions can be added here
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
                            labelText: 'Name',
                            initialValue: _name,
                            onSaved: (value) => _name = value,
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            labelText: 'Email',
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
                          const SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              _submitForm();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ClientDashboard(
                                    address1: _address1,
                                    address2: _address2,
                                  ),
                                ),
                              );
                            },
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
