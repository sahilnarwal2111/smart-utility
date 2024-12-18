import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_drive/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:test_drive/screens/checkbox_state.dart';




class CheckoutView extends StatefulWidget {
    final String providerName;
    final String serviceName;

    CheckoutView({required this.providerName, required this.serviceName});

    @override
    State<CheckoutView> createState() => _CheckoutViewState();

    
  
}

class _CheckoutViewState extends State<CheckoutView> {
  final TextEditingController _controller = TextEditingController();
  DateTime _dateTime = DateTime.now();
  final dateFormat = DateFormat("EEEE, dd MMM yyyy");
  var availableBookTime = [
    CheckBoxState(title: "00.00"),
    CheckBoxState(title: "01.00"),
    CheckBoxState(title: "02.00"),
    CheckBoxState(title: "03.00"),
    CheckBoxState(title: "04.00"),
    CheckBoxState(title: "05.00"),
    CheckBoxState(title: "06.00"),
    CheckBoxState(title: "08.00"),
    CheckBoxState(title: "09.00"),
    CheckBoxState(title: "10.00"),
    CheckBoxState(title: "11.00"),
    CheckBoxState(title: "12.00"),
    CheckBoxState(title: "13.00"),
    CheckBoxState(title: "14.00"),
    CheckBoxState(title: "15.00"),
    CheckBoxState(title: "16.00"),
    CheckBoxState(title: "17.00"),
    CheckBoxState(title: "18.00"),
    CheckBoxState(title: "19.00"),
    CheckBoxState(title: "20.00"),
    CheckBoxState(title: "20.00"),
    CheckBoxState(title: "21.00"),
    CheckBoxState(title: "22.00"),
    CheckBoxState(title: "23.00"),
    CheckBoxState(title: "24.00"),
    
    
  ];
  int _totalBill = 0;
  bool _enableCreateOrderBtn = false;


// need to make a API call to fetch rate list by provider
  int price = 10;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            title: Text(widget.providerName),  // Dynamically use providerName here
            backgroundColor: Colors.white,
            centerTitle: true,
            foregroundColor: Colors.blue,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Service",
                      style:  TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 188, 218, 255), width: 2),
                        color:  const Color.fromARGB(255, 188, 218, 255),
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Row(
                      children: [
                        // Image.asset(
                        //   "assets/icons/pin.png",
                        //   width: 24,
                        //   height: 24,
                        //   color: const Color(0xff2083F8),
                        // ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(widget.serviceName)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Pick a date",
                    style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500, color: const Color(0xff293948)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      print("Date picker tapped");
                      _selectDate();
                    },     
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor100, width: 2),
                          color: lightBlue100,
                          borderRadius:
                              BorderRadius.circular(borderRadiusSize)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.date_range_rounded,
                            color: primaryColor500,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            _dateTime == null
                                ? "date not selected.."
                                : dateFormat.format(_dateTime).toString(),
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Pick a Time",
                    style: subTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  ...availableBookTime.map(buildSingleCheckBox).toList(),
                  ],
                )
              ])
            )
          ) 
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: lightBlue300,
            offset: Offset(0, 0),
            blurRadius: 10,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Total:",
                  style: descTextStyle,
                ),
                Text(
                  "Rp $_totalBill",
                  style: priceTextStyle,
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderRadiusSize))),
                  onPressed: !_enableCreateOrderBtn
                      ? null
                      : () {
                          List<String> selectedTime = [];
                          for (int i = 0; i < availableBookTime.length; i++) {
                            if (availableBookTime[i].value) {
                              selectedTime.add(availableBookTime[i].title);
                            }
                          }
                          // dummyUserOrderList.add(FieldOrder(
                          //     field: widget.field,
                          //     user: "first",
                          //     selectedDate:
                          //         dateFormat.format(_dateTime).toString(),
                          //     selectedTime: selectedTime));
                        //   Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               RootView(currentScreen: 1)),
                        //       (route) => false);
                        //   _showSnackBar(
                        //       context, "Successfully create an order");
                        },
                  child: Text(
                    "Create Order",
                    style: buttonTextStyle,
                  )),
            ),
          ],
        ),
        
      ),
    )

    );
  }
  void _showSnackBar(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      margin: const EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ));
  }

  void _selectDate() async {
      await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 6))
          .then((value) {
        setState(() {
          _dateTime = value!;
        });
      });
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(checkbox.title),
      value: checkbox.value,
      onChanged: (bool? value) {
        setState(() {
          checkbox.value = value!;
        });
        int totalSelectedTime = 0;
        for (int i = 0; i < availableBookTime.length; i++) {
          if (availableBookTime[i].value == true) {
            totalSelectedTime++;
          }
        }
        setState(() {
          _totalBill = price * totalSelectedTime;
          if (totalSelectedTime > 0) {
            _enableCreateOrderBtn = true;
          } else {
            _enableCreateOrderBtn = false;
          }
        });
      },
    );
  }

}

