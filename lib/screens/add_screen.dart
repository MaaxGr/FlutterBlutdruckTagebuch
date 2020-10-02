import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            Text(
                "Systolisch",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("mmHg"),
            Text("PICKER")
          ],
        ),
        Column(
          children: [
            Text("Diastolisch"),
            Text("mmHg"),
            Text("PICKER")
          ],
        ),
        Column(
          children: [
            Text("Puls"),
            Text("bpm"),
            Text("PICKER")
          ],
        )
      ],
    );
  }

}
