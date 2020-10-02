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

  int _systolischValue = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hinzufügen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PickerArea()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class PickerArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            BoldText("Systolisch"),
            Text("mmHg"),
            MyPicker()
          ],
        ),
        Column(
          children: [
            BoldText("Diastolisch"),
            Text("mmHg"),
            Text("PICKER")
          ],
        ),
        Column(
          children: [
            BoldText("Puls"),
            Text("bpm"),
            Text("PICKER")
          ],
        )
      ],
    );
  }

}

class MyPicker extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyPickerState();
  }

}

class _MyPickerState extends State<MyPicker> {

  int value = 144;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw Column(
      children: [
        Text(
          'Wert: $value',
        ),
        NumberPicker.integer(initialValue: value, minValue: 20, maxValue: 200, onChanged: (newValue) {
          setState(() {
            value = newValue;
          });
        })
      ],
    );
  }

}