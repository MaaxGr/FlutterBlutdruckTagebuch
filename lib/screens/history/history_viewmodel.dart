import 'package:flutter_blutdrucktagebuch/persistence/sqlite/entity/blood_pressure_measurement.dart';
import 'package:flutter_blutdrucktagebuch/persistence/sqlite/sqlite_database.dart';

class HistoryViewModel {
  // fields
  static final HistoryViewModel _instance = HistoryViewModel._internal();

  factory HistoryViewModel() => _instance;

  var _db = SqliteDatabase();

  // data fields

  // constructors
  HistoryViewModel._internal() {
    _db.init();
  }

  // functions
  Future<List<BloodPressureMeasurement>> getAllBloodMeasurements() {
    return _db.getAll();
  }

  Future<void> deleteBloodMeasurement(BloodPressureMeasurement measurement) {
    _db.delete(measurement);
  }

  String getTextForSys(int systolic) {
    if (systolic > 160) {
      return "Stufe 2 Hypertonie";
    } else if (systolic > 140) {
      return "Stufe 1 Hypertonie";
    } else if (systolic > 120) {
      return "Vorhypertonie";
    } else if (systolic > 90) {
      return "Normal";
    } else {
      return "Hypotonie";
    }
  }
}
