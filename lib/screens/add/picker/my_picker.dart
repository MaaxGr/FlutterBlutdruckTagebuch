//Picker
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';

class MyPicker extends StatefulWidget {
  //fields
  int value;

  ValueChanged<int> onValueChanged = (newValue){};

  //Constructor
  MyPicker(this.value,[this.onValueChanged]);

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

          widget.onValueChanged(newValue);
        });
  }
}

abstract class OnPickerValueChangedListener {
  void onValueChanged(int newValue);
}