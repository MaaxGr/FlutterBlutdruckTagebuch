import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blutdrucktagebuch/widgets/BoldText.dart';
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
        Column(
          children: [
            BoldText("Systolisch"),
            Text("mmHg"),
            Text("PICKER")
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
