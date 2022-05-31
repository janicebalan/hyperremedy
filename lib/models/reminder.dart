class Reminder {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  int _hour;
  int _minute;
  String _medsId;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get hour => _hour;
  set hour(value) => _hour = value;

  get minute => _minute;
  set minute(value) => _minute = value;

  get medsId => _medsId;
  set medsId(value) => _medsId = value;

  Reminder({
    dynamic id,
    int hour = 0,
    int minute = 0,
    String medsId = '',
  })  : _id = id,
        _hour = hour,
        _minute = minute,
        _medsId = medsId;
  Reminder.copy(Reminder from)
      : this(
          id: from.id,
          hour: from.hour,
          minute: from.minute,
          medsId: from.medsId,
        );

  Reminder.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          hour: json['hour'],
          minute: json['minute'],
          medsId: json['medsId'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'hour': hour,
        'minute': minute,
        'medsId': medsId,
      };
}
