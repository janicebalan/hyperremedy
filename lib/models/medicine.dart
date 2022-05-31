class Medicine {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _medicineName;
  String _freqIntake;
  String _totalPills;
  String _pillsLeft;
  String _pillsNotify;
  String _userID;
  String _dose;
  String _date;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get medicineName => _medicineName;
  set medicineName(value) => _medicineName = value;

  get freqIntake => _freqIntake;
  set freqIntake(value) => _freqIntake = value;

  get totalPills => _totalPills;
  set totalPills(value) => _totalPills = value;

  get pillsLeft => _pillsLeft;
  set pillsLeft(value) => _pillsLeft = value;

  get pillsNotify => _pillsNotify;
  set pillsNotify(value) => _pillsNotify = value;

  get userID => _userID;
  set userID(value) => _userID = value;

  get dose => _dose;
  set dose(value) => _dose = value;

  get date => _date;
  set date(value) => _date = value;

  Medicine({
    dynamic id,
    String medicineName = '',
    String freqIntake = '',
    String totalPills = '',
    String pillsLeft = '',
    String pillsNotify = '',
    String userID = '',
    String dose = '',
    String date = '',
  })  : _id = id,
        _medicineName = medicineName,
        _freqIntake = freqIntake,
        _totalPills = totalPills,
        _pillsLeft = pillsLeft,
        _pillsNotify = pillsNotify,
        _userID = userID,
        _dose = dose,
        _date = date;
  Medicine.copy(Medicine from)
      : this(
          id: from.id,
          medicineName: from.medicineName,
          freqIntake: from.freqIntake,
          totalPills: from.totalPills,
          pillsLeft: from.pillsLeft,
          pillsNotify: from.pillsNotify,
          userID: from.userID,
          dose: from.dose,
          date: from.date,
        );

  Medicine.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          medicineName: json['medicineName'],
          freqIntake: json['freqIntake'],
          totalPills: json['totalPills'],
          pillsLeft: json['pillsLeft'],
          pillsNotify: json['pillsNotify'],
          userID: json['userID'],
          dose: json['dose'],
          date: json['date'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'medicineName': medicineName,
        'freqIntake': freqIntake,
        'totalPills': totalPills,
        'pillsLeft': pillsLeft,
        'pillsNotify': pillsNotify,
        'userID': userID,
        'dose': dose,
        'date': date,
      };
}
