import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blutdrucktagebuch/screens/add/add_viewmodel.dart';
import 'package:flutter_blutdrucktagebuch/screens/add/picker/labled_picker_group.dart';
import 'package:flutter_blutdrucktagebuch/widgets/TimerView.dart';

class AddScreen extends StatefulWidget {

  final String appBarTitle;

  AddScreen({this.appBarTitle});

  @override
  State<StatefulWidget> createState() {
    return _AddScreenState();
  }
}

class _AddScreenState extends State<AddScreen> {
  //fields
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.appBarTitle),
    ),
    body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PickerArea(),
              SizedBox(height: 16),
              TimerView(),
              SizedBox(height: 16),
              FlatButton(
                  onPressed: () {
                    AddViewModel.instance.addElement();
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
        ),
  );
}

//PickerArea
class PickerArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LabledPickerGroup("Systolisch", "mmHg", AddViewModel.instance.systolic,(newValue){
          AddViewModel.instance.systolic = newValue;
        }),
        LabledPickerGroup("Diastolisch", "mmHg", AddViewModel.instance.diastolic,(newValue){
          AddViewModel.instance.diastolic = newValue;
        }),
        LabledPickerGroup("Puls", "bpm", AddViewModel.instance.pulse,(newValue){
          AddViewModel.instance.pulse = newValue;
        })],
    );
  }
}




