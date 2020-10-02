import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_blutdrucktagebuch/persistence/sqlite/entity/blood_pressure_measurement.dart';
import 'package:flutter_blutdrucktagebuch/persistence/sqlite/sqlite_database.dart';

class HistoryScreen extends StatefulWidget {

  final SqliteDatabase db = SqliteDatabase();

  HistoryScreen() {
    db.init();
  }

  @override
  State<StatefulWidget> createState() {
    return _HistoryScreenState();
  }
}

class _HistoryScreenState extends State<HistoryScreen> {

  List<BloodPressureMeasurement> entries = [];

  @override
  void initState() {
    super.initState();

    widget.db.getAll().then((value) {
      setState(() {
        this.entries = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          for (BloodPressureMeasurement measurement in entries) Text("${measurement.id} ${measurement.diastolic}")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          widget.db.insert(BloodPressureMeasurement(
            id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
            systolic: Random().nextInt(200),
            diastolic: Random().nextInt(200),
            pulse: Random().nextInt(200),
            time: DateTime.now()
          ));
        },
      ),
    );
  }

}