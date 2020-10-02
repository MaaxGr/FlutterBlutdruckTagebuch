//Labled Picker Group
import 'package:flutter/cupertino.dart';
import 'package:flutter_blutdrucktagebuch/screens/add/picker/my_picker.dart';
import 'package:flutter_blutdrucktagebuch/widgets/bold_text.dart';

class LabledPickerGroup extends StatefulWidget {
  //fields
  final String title;
  final String unit;
  int value;

  ValueChanged<int> onPickerValueChanged = (newVal){};

  //Constructors
  LabledPickerGroup(this.title, this.unit, this.value, [this.onPickerValueChanged]);

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
      MyPicker(widget.value,widget.onPickerValueChanged)
    ],
  );
}