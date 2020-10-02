class BloodPressureMeasurement {
  final int id;
  final int systolic;
  final int diastolic;
  final int pulse;
  final DateTime time;

  BloodPressureMeasurement(
      {this.id, this.systolic, this.diastolic, this.pulse, this.time});

  toMap() {
    return {
      'id': id,
      'systolic': systolic,
      'diastolic': diastolic,
      'pulse': pulse,
      'time': time.millisecondsSinceEpoch
    };
  }

}
