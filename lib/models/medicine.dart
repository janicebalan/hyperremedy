class Medicine {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _medicineName;
  String _freqIntake;
  int _totalPills;
  String _datetime;
  int _pillsLeft;
  String _pillsNotify;
  String _medsNotify;
  String _userID;
  String _duration;
  int _dose;

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

  get pillsNotify => _pillsNotify;
  set pillsNotify(value) => _pillsNotify = value;

  get medsNotify => _medsNotify;
  set medsNotify(value) => _medsNotify = value;

  get userID => _userID;
  set userID(value) => _userID = value;

  get duration => _duration;
  set duration(value) => _duration = value;

  get dose => _dose;
  set dose(value) => _dose = value;

  Medicine(
      {dynamic id,
      String medicineName = '',
      String freqIntake = '',
      int totalPills = 0,
      String datetime = '',
      int pillsLeft = 0,
      String pillsNotify = '',
      String medsNotify = '',
      String userID = '',
      String duration = '',
      int dose = 0})
      : _id = id,
        _medicineName = medicineName,
        _freqIntake = freqIntake,
        _totalPills = totalPills,
        _datetime = datetime,
        _pillsLeft = pillsLeft,
        _pillsNotify = pillsNotify,
        _medsNotify = medsNotify,
        _userID = userID,
        _duration = duration,
        _dose = dose;
  Medicine.copy(Medicine from)
      : this(
          id: from.id,
          medicineName: from.medicineName,
          freqIntake: from.freqIntake,
          totalPills: from.totalPills,
          datetime: from.datetime,
          pillsLeft: from.pillsLeft,
          pillsNotify: from.pillsNotify,
          medsNotify: from.medsNotify,
          userID: from.userID,
          duration: from.duration,
          dose: from.dose,
        );

  Medicine.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          medicineName: json['medicineName'],
          freqIntake: json['freqIntake'],
          totalPills: json['totalPills'],
          datetime: json['datetime'],
          pillsLeft: json['pillsLeft'],
          pillsNotify: json['pillsNotify'],
          medsNotify: json['medsNotify'],
          userID: json['userID'],
          duration: json['duration'],
          dose: json['dose'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'medicineName': medicineName,
        'freqIntake': freqIntake,
        'totalPills': totalPills,
        'datetime': datetime,
        'pillsLeft': pillsLeft,
        'pillsNotify': pillsNotify,
        'medsNotify': medsNotify,
        'userID': userID,
        'duration': duration,
        'dose': dose,
      };
}
