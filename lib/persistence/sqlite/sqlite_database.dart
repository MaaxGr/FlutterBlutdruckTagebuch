import 'package:flutter/cupertino.dart';
import 'package:flutter_blutdrucktagebuch/persistence/sqlite/entity/blood_pressure_measurement.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabase {

  Future<Database> database;

  void init() async {
    WidgetsFlutterBinding.ensureInitialized();

    this.database = openDatabase(
        join(await getDatabasesPath(), 'main.db'),
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE blood_pressure_measurement (id INTEGER PRIMARY KEY, systolic INTEGER, diastolic INTEGER, pulse INTEGER, time INTEGER)"
          );
        },
        version: 1
    );
  }

  Future<void> insert(BloodPressureMeasurement measurement) async {
    final Database db = await database;
    db.insert('blood_pressure_measurement', measurement.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<BloodPressureMeasurement>> getAll() async {
    final Database db = await database;
    final List<Map<String, dynamic>> mapList = await db.query('blood_pressure_measurement');

    return List.generate(mapList.length, (index) {
      final Map entry = mapList[index];
      
      return BloodPressureMeasurement(
        id: entry['id'],
        systolic: entry['systolic'],
        diastolic: entry['diastolic'],
        pulse: entry['pulse'],
        time: DateTime.fromMillisecondsSinceEpoch(entry['time'])
      );
    });
  }




}