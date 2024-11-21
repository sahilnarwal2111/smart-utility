
// import 'package:flutter/material.dart';
// import 'package:test_drive/widgets/search_bar.dart';
// import 'package:test_drive/widgets/service_grid.dart';
// import 'package:test_drive/theme/theme.dart';
// import 'package:test_drive/transactions/transaction_history_view.dart';
// import 'package:test_drive/setting/settings_view.dart';
// class CustomBottomNavBar extends StatefulWidget {
//   final int defaultSelectedIndex;
//   final List<String> selectedItemIcon;
//   final List<String> unselectedItemIcon;
//   final List<String> label;
//   final Function(int) onChange;

//   const CustomBottomNavBar(
//       {this.defaultSelectedIndex = 0,
//       required this.selectedItemIcon,
//       required this.unselectedItemIcon,
//       required this.label,
//       required this.onChange});

//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }
// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   int _selectedIndex = 0;
//   List<String> _selectedItemIcon = [];
//   List<String> _unselectedItemIcon = [];
//   List<String> _label = [];

//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = widget.defaultSelectedIndex;
//     _selectedItemIcon = widget.selectedItemIcon;
//     _unselectedItemIcon = widget.unselectedItemIcon;
//     _label = widget.label;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _navBarItems = [];

//     for (int i = 0; i < 3; i++) {
//       _navBarItems.add(bottomNavBarItem(
//           _selectedItemIcon[i], _unselectedItemIcon[i], _label[i], i));
//     }
//     return Container(
//       decoration: const BoxDecoration(
//           color: colorWhite,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: _navBarItems,
//         // children: _navBarItems.map((item) => Expanded(child: item)).toList(),
//       ),
//     );
//   }

//   Widget bottomNavBarItem(activeIcon, inactiveIcon, label, index) {
//     return GestureDetector(
//       onTap: () {
//         widget.onChange(index);
//         setState(() {
//           print(index);
//           _selectedIndex = index;
//         });
//       },
//       child: Container(
//         height: kBottomNavigationBarHeight,
//         width: MediaQuery.of(context).size.width / _selectedItemIcon.length,
//         decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius:
//                 BorderRadius.vertical(top: Radius.circular(borderRadiusSize))),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: _selectedIndex == index
//               ? Container(
//                   decoration: BoxDecoration(
//                       color: primaryColor100,
//                       borderRadius: BorderRadius.circular(borderRadiusSize)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Image.asset(
//                         activeIcon,
//                         width: 10,
//                         height: 10,
//                         color: primaryColor500,
//                       ),
//                       Text(
//                         label,
//                         style: bottomNavTextStyle,
//                       )
//                     ],
//                   ),
//                 )
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       inactiveIcon,
//                       width: 10,
//                       height: 10,
//                       color: primaryColor300,
//                     ),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
// }

// class ClientDashboard extends StatefulWidget{
//   final String? address1;
//   final String? address2;
  

//   const ClientDashboard({Key? key,  this.address1, this.address2}) : super(key: key);

//   @override
//   _ClientDashboardState createState() => _ClientDashboardState();
  

// }

// class _ClientDashboardState extends State<ClientDashboard> {
//   int _currentIndex = 0;
//   final screens = [
//     ClientDashboard(),
//     TransactionHistoryView(),
//     SettingsView(),
//   ];
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[100],
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Column(
//               children: [
//                 Text(
//                     widget.address1 ?? "Default Address Line 1",
//                     style: const TextStyle(fontSize: 20.0),
//                   ),
//                   Text(
//                     widget.address2 ?? "Default Address Line 2",
//                     style: const TextStyle(fontSize: 15.0),
//                   ),
                
//               ],
//             ),
//             const Spacer(),
//             const CircleAvatar(
//               radius: 20,
//               backgroundImage: NetworkImage(
//                 'https://images.unsplash.com/photo-1573497491208-6b1acb260507',
//               ),
//             ),
//           ],
//         )
//       ),
//       body: Container(
//         height: double.infinity,
//         color: Colors.blue[100],
//         child: SingleChildScrollView(
//         child: Column(
//         children: <Widget>[

//           const DashboardSearch(),
//           const SizedBox(height: 60.0),
//           //all cards from here
//           const Padding(
//                 padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
//                 child: Row(
//                   children:[
//                     Text(
//                       'Explore all Services',
//                       style: TextStyle(
//                         fontSize: 25.0
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ServicesGrid()
//         ],
//       ),
//       ),

//       ),
    
//       bottomNavigationBar: CustomBottomNavBar(
//           defaultSelectedIndex: _currentIndex,
//           selectedItemIcon: const [
//             // "assets/images/icons//home_fill.png",
//             "assets/images/icons/receipt_fill.png",
//             "assets/images/icons/receipt_fill.png",
//             "assets/images/icons/settings_fill.png"
//           ],
//           unselectedItemIcon: const [
//             // "assets/images/icons/home_outlined.png",
//             "assets/images/icons/receipt_outlined.png",
//             "assets/images/icons/receipt_outlined.png",
//             "assets/images/icons/settings_outlined.png"
//           ],
//           label: const ["Home", "Transaction", "Settings"],
//           onChange: (val) {
//             setState(() {
//               _currentIndex = val;
//             });
//           },
//         ),

//     );
    
  
//   }
// }
import 'package:flutter/material.dart';
import 'package:test_drive/screens/client_home_page.dart';
import 'package:test_drive/widgets/search_bar.dart';
import 'package:test_drive/widgets/service_grid.dart';
import 'package:test_drive/theme/theme.dart';
import 'package:test_drive/transactions/transaction_history_view.dart';
import 'package:test_drive/setting/settings_view.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final List<String> selectedItemIcon;
  final List<String> unselectedItemIcon;
  final List<String> label;
  final Function(int) onChange;

  const CustomBottomNavBar({
    this.defaultSelectedIndex = 0,
    required this.selectedItemIcon,
    required this.unselectedItemIcon,
    required this.label,
    required this.onChange,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  List<String> _selectedItemIcon = [];
  List<String> _unselectedItemIcon = [];
  List<String> _label = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _selectedItemIcon = widget.selectedItemIcon;
    _unselectedItemIcon = widget.unselectedItemIcon;
    _label = widget.label;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItems = [];

    for (int i = 0; i < _label.length; i++) {
      _navBarItems.add(bottomNavBarItem(
          _selectedItemIcon[i], _unselectedItemIcon[i], _label[i], i));
    }

    return Container(
      decoration: const BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _navBarItems,
      ),
    );
  }

  Widget bottomNavBarItem(String activeIcon, String inactiveIcon, String label, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: kBottomNavigationBarHeight,
        width: MediaQuery.of(context).size.width / _selectedItemIcon.length,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _selectedIndex == index
              ? Container(
                  decoration: BoxDecoration(
                    color: primaryColor100,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        activeIcon,
                        width: 20,
                        height: 20,
                        color: primaryColor500,
                      ),
                      Text(
                        label,
                        style: bottomNavTextStyle,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Image.asset(
                    inactiveIcon,
                    width: 20,
                    height: 20,
                    color: primaryColor300,
                  ),
                ),
        ),
      ),
    );
  }
}

class ClientDashboard extends StatefulWidget {
  final String? clientName;
  final String? address1;
  final String? address2;

  const ClientDashboard({Key? key, this.clientName,this.address1, this.address2}) : super(key: key);

  @override
  _ClientDashboardState createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  int _currentIndex = 0;

  // Create instances of the screens
  final TransactionHistoryView transactionScreen = TransactionHistoryView();
  final SettingsView settingsScreen = SettingsView();

  @override
  Widget build(BuildContext context) {
    // List of screens without recreating ClientDashboard
    final List<Widget> screens = [
      ClientDashboard(),
      transactionScreen,
      settingsScreen,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   widget.address1 ?? "Default Address Line 1",
                //   style: const TextStyle(fontSize: 20.0),
                // ),
                
                // Text(
                //   widget.address2 ?? "Default Address Line 2",
                //   style: const TextStyle(fontSize: 15.0),
                // ),
              ],
            ),
            const Spacer(),
            // const CircleAvatar(
            //   radius: 20,
            //   backgroundImage: NetworkImage(
            //     'https://images.unsplash.com/photo-1573497491208-6b1acb260507',
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
            builder: (context) => ClientProfile(email: widget.clientName!,),
          ),
        );
      },
      child: const CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1573497491208-6b1acb260507',
        ),
      ),
    ),
          ],
        ),
      ),
      body: _currentIndex == 0
          ? Column(
              children: [
                // const DashboardSearch(),
                const SizedBox(height: 60.0),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                  child: Text(
                    'Explore all Services',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                ServicesGrid(clientName: widget.clientName),
              ],
            )
          : screens[_currentIndex], // Display appropriate screen based on _currentIndex

      bottomNavigationBar: CustomBottomNavBar(
        defaultSelectedIndex: _currentIndex,
        selectedItemIcon: const [
          // "assets/images/icons/home_fill.png",
          "assets/images/icons/receipt_fill.png",
          "assets/images/icons/receipt_fill.png",
          "assets/images/icons/settings_fill.png",
        ],
        unselectedItemIcon: const [
          // "assets/images/icons/home_outlined.png",
          "assets/images/icons/receipt_outlined.png",
          "assets/images/icons/receipt_outlined.png",
          "assets/images/icons/settings_outlined.png",
        ],
        label: const ["Home", "Transaction", "Settings"],
        onChange: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
      ),
    );
  }
}
