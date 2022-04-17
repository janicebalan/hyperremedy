class Symptom {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _type;
  String _date;
  String _description;
  dynamic _userID;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get type => _type;
  set type(value) => _type = value;

  get date => _date;
  set date(value) => _date = value;

  get description => _description;
  set description(value) => _description = value;

  // ignore: unnecessary_getters_setters
  get userID => _userID;
  set userID(value) => _userID = value;

  Symptom(
      {dynamic id,
      String type = '',
      String date = '',
      String description = '',
      dynamic userID})
      : _id = id,
        _type = type,
        _date = date,
        _description = description,
        _userID = userID;
  Symptom.copy(Symptom from)
      : this(
            id: from.id,
            type: from.type,
            date: from.date,
            description: from.description,
            userID: from.userID);

  Symptom.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          type: json['type'],
          date: json['date'],
          description: json['description'],
          userID: json['userID'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'date': date,
        'description': description,
        'userID': userID,
      };
}
