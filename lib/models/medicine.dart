class User {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _medicineName;
  String _freqIntake;
  int _totalPills;
  String _datetime;
  int _pillsLeft;
  String pillsNotify;
  String medsNotify;
  String userID;
  String duration;
  int dose;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get medicineName => _medicineName;
  set medicineName(value) => _medicineName = value;

  get pillsLeft => _pillsLeft;
  set pillsLeft(value) => _pillsLeft = value;

  get freqIntake => _freqIntake;
  set freqIntake(value) => _freqIntake = value;

  get totalPills => _totalPills;
  set totalPills(value) => _totalPills = value;

  get datetime => _datetime;
  set datetime(value) => _datetime = value;

  User(
      {dynamic id,
      String medicineName = '',
      String freqIntake = '',
      int totalPills = 0,
      String datetime = '',
      int pillsLeft = 0})
      : _id = id,
        _medicineName = medicineName,
        _freqIntake = freqIntake,
        _totalPills = totalPills,
        _datetime = datetime,
        _pillsLeft = pillsLeft;
  User.copy(User from)
      : this(
            id: from.id,
            medicineName: from.medicineName,
            freqIntake: from.freqIntake,
            totalPills: from.totalPills,
            datetime: from.datetime,
            pillsLeft: from.pillsLeft);

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          medicineName: json['medicineName'],
          freqIntake: json['freqIntake'],
          totalPills: json['totalPills'],
          datetime: json['datetime'],
          pillsLeft: json['pillsLeft'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'medicineName': medicineName,
        'freqIntake': freqIntake,
        'totalPills': totalPills,
        'datetime': datetime,
        'pillsLeft': pillsLeft,
      };
}
