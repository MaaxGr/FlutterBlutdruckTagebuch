class BloodPressureMeasurement {
  final int id;
  final int systolic;
  final int diastolic;
  final int pulse;

  BloodPressureMeasurement(
      {this.id, this.systolic, this.diastolic, this.pulse});

  toMap() {
    return {
      'id': id,
      'systolic': systolic,
      'diastolic': diastolic,
      'pulse': pulse
    };
  }

}
