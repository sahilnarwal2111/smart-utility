import 'package:flutter/material.dart';

class ToggleButtonClientProvider extends StatefulWidget{
  final Function(String) onSelectedChanged;

  ToggleButtonClientProvider({required this.onSelectedChanged});
  @override
  _ToggleButtonClientProvider createState() => _ToggleButtonClientProvider();
}

class _ToggleButtonClientProvider extends State<ToggleButtonClientProvider>{
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.green.withOpacity(0.5),
    child: ToggleButtons(
    isSelected: isSelected,
    selectedColor: Colors.white,
    color: Colors.black,
    fillColor: Colors.blue,
    renderBorder: false ,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text('Client', style: TextStyle(fontSize: 18),)
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text('Provider', style: TextStyle(fontSize: 18),)
      ),
    ],
    onPressed: (int newIndex) {
      setState(() {
        for(int index = 0; index < isSelected.length; index++){
          if(newIndex == index){
            isSelected[index] = true;
            widget.onSelectedChanged(index == 0 ? 'Client' : 'Provider');
          }else{
            isSelected[index] = false;
          }
        }
      });
    },
  )
  );

}