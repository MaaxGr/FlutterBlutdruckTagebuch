import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blutdrucktagebuch/widgets/bold_text.dart';
import 'package:numberpicker/numberpicker.dart';

class AddScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AddScreenState();
  }
}

class _AddScreenState extends State<AddScreen> {

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PickerArea()
      ],
    ),
  );

}

class PickerArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LabledPickerGroup("Systolisch", "mmHg", 144),
        LabledPickerGroup("Diastolisch", "mmHg", 20),
        LabledPickerGroup("Puls", "bpm", 80)
      ],
    );
  }

}

//Labled Picker Group
class LabledPickerGroup extends StatefulWidget{
  //fields
  final String title;
  final String unit;
  int value;

  //Constructors
  LabledPickerGroup(this.title,this.unit,this.value);

  //functions
  @override
  State<StatefulWidget> createState() => _LabledPickerGroupState();
}

class _LabledPickerGroupState extends State<LabledPickerGroup>{

  @override
  Widget build(BuildContext context) => Column(
    children: [
      BoldText(widget.title),
      Text(widget.unit),
      MyPicker(widget.value)
    ],
  );
}

//Picker
class MyPicker extends StatefulWidget {
  //fields
  int value = 144;

  //Constructor
  MyPicker(this.value);

  @override
  State<StatefulWidget> createState() {
    return _MyPickerState();
  }

}

class _MyPickerState extends State<MyPicker> {
  @override
  Widget build(BuildContext context) {
    return NumberPicker.integer(initialValue: widget.value, minValue: 20, maxValue: 200, onChanged: (newValue) {
      setState(() {
        widget.value = newValue;
      });
    });
  }

}