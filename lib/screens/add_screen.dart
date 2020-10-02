import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blutdrucktagebuch/widgets/TimerView.dart';
import 'package:flutter_blutdrucktagebuch/widgets/bold_text.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class AddScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddScreenState();
  }
}

class _AddScreenState extends State<AddScreen> {
  //fields
  final PickerArea pickerArea = PickerArea();

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            pickerArea,
            SizedBox(height: 16),
            TimerView(),
            SizedBox(height: 16),
            FlatButton(
                onPressed: () {
                  final pickerVals = pickerArea.getPickerValues();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          children: [
                            Text("Test: Values are $pickerVals"),
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("close"))
                          ],
                        );
                      });
                },
                child: Text("Hinzufügen",
                  style: TextStyle(
                    fontSize: 18
                  ),),
            color: Colors.lightBlue,
            textColor: Colors.white,
            minWidth: 200,
            padding: EdgeInsets.all(16),)
          ],
        ),
      );
}

//PickerArea
class PickerArea extends StatelessWidget {
  //fields
  final LabledPickerGroup _systolisch =
      LabledPickerGroup("Systolisch", "mmHg", 144);
  final LabledPickerGroup _diastolisch =
      LabledPickerGroup("Diastolisch", "mmHg", 20);
  final LabledPickerGroup _puls = LabledPickerGroup("Puls", "bpm", 80);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_systolisch, _diastolisch, _puls],
    );
  }

  List<int> getPickerValues() =>
      [_systolisch.value, _diastolisch.value, _puls.value];
}

//Labled Picker Group
class LabledPickerGroup extends StatefulWidget {
  //fields
  final String title;
  final String unit;
  int value;

  //Constructors
  LabledPickerGroup(this.title, this.unit, this.value);

  //functions
  @override
  State<StatefulWidget> createState() => _LabledPickerGroupState();
}

class _LabledPickerGroupState extends State<LabledPickerGroup> {
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
  int value;

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
    return NumberPicker.integer(
        initialValue: widget.value,
        minValue: 20,
        maxValue: 200,
        onChanged: (newValue) {
          setState(() {
            widget.value = newValue;
          });
        });
  }
}


