import 'package:flutter_blutdrucktagebuch/persistence/sqlite/entity/blood_pressure_measurement.dart';
import 'package:flutter_blutdrucktagebuch/persistence/sqlite/sqlite_database.dart';

class AddViewModel{
    //fields
    static final AddViewModel instance = AddViewModel._internal();
    var _db = SqliteDatabase();

    //data fields
    int systolic = 144;
    int diastolic = 20;
    int pulse = 80;

    //Constructors
    AddViewModel._internal(){
      _db.init();
    }

    //functions
    void addElement(){
      _db.insert(BloodPressureMeasurement(
          id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
          systolic: systolic,
          diastolic: diastolic,
          pulse: pulse,
          time: DateTime.now()));
    }

}