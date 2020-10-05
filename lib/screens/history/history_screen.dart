
import 'package:contextualactionbar/contextualactionbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blutdrucktagebuch/persistence/sqlite/entity/blood_pressure_measurement.dart';
import 'package:flutter_blutdrucktagebuch/screens/history/history_viewmodel.dart';

class HistoryScreen extends StatefulWidget {
  final HistoryViewModel vm = HistoryViewModel();

  final String appBarTitle;

  HistoryScreen({this.appBarTitle});

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

    reloadMeasurements();
  }

  void reloadMeasurements() {
    widget.vm.getAllBloodMeasurements().then((value) {
      setState(() {
        this.entries = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContextualScaffold<BloodPressureMeasurement>(
      contextualAppBar: ContextualAppBar(
        counterBuilder: (int itemsCount) {
          return Text("$itemsCount Selected");
        },
        contextualActions: [
          ContextualAction(
            itemsHandler: (List<BloodPressureMeasurement> items) {
              items.forEach((element) async {
                await widget.vm.deleteBloodMeasurement(element);
                reloadMeasurements();
              });
            },
            child: Icon(Icons.delete),
          ),
        ],
        backgroundColor: Colors.grey,
      ),
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: ListView(
        children: [
          for (BloodPressureMeasurement measurement in entries)
            _HistoryCard(measurement)
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final HistoryViewModel vm = HistoryViewModel();

  BloodPressureMeasurement measurement;

  _HistoryCard(this.measurement);

  @override
  Widget build(BuildContext context) {
    ActionMode.enabledStream<BloodPressureMeasurement>(context).listen((event) {
      print("Call Action mode is enabled $event");
    });

    return ContextualActionWidget(
      data: measurement,
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(vm.getTextForSys(measurement.systolic)),
              subtitle: Text(
                  "Systolisch: ${measurement.systolic} | Diastolisch: ${measurement.diastolic}"),
            ),
          )
        ],
      ),
      selectedWidget: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 20),
          ),
        ],
      ),
    );
  }
}
