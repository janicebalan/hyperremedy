class BloodPressure {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  int _diastolic;
  int _systolic;
  int _pulse;
  String _date;
  String _range;
  dynamic _userID;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get diastolic => _diastolic;
  set diastolic(value) => _diastolic = value;

  get range => _range;
  set range(value) => _range = value;

  get systolic => _systolic;
  set systolic(value) => _systolic = value;

  get pulse => _pulse;
  set pulse(value) => _pulse = value;

  get date => _date;
  set date(value) => _date = value;

  // ignore: unnecessary_getters_setters
  get userID => _userID;
  set userID(value) => _userID = value;

  BloodPressure(
      {dynamic id,
      int diastolic = 0,
      int systolic = 0,
      int pulse = 0,
      String date = '',
      String range = "",
      dynamic userID})
      : _id = id,
        _diastolic = diastolic,
        _systolic = systolic,
        _pulse = pulse,
        _date = date,
        _range = range,
        _userID = userID;
  BloodPressure.copy(BloodPressure from)
      : this(
            id: from.id,
            diastolic: from.diastolic,
            systolic: from.systolic,
            pulse: from.pulse,
            date: from.date,
            range: from.range,
            userID: from.userID);

  BloodPressure.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          diastolic: json['diastolic'],
          systolic: json['systolic'],
          pulse: json['pulse'],
          date: json['date'],
          range: json['range'],
          userID: json['userID'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'diastolic': diastolic,
        'systolic': systolic,
        'pulse': pulse,
        'date': date,
        'range': range,
        'userID': userID,
      };
}
