class Food {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _range;
  String _photoUrl;
  String _foodName;
  String _foodDetails;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get range => _range;
  set range(value) => _range = value;

  get photoUrl => _photoUrl;
  set photoUrl(value) => _photoUrl = value;

  get foodName => _foodName;
  set foodName(value) => _foodName = value;

  get foodDetails => _foodDetails;
  set foodDetails(value) => _foodDetails = value;

  Food(
      {dynamic id,
      String range = '',
      String photoUrl = '',
      String foodName = '',
      String foodDetails = ''})
      : _id = id,
        _range = range,
        _photoUrl = photoUrl,
        _foodName = foodName,
        _foodDetails = foodDetails;
  Food.copy(Food from)
      : this(
            id: from.id,
            range: from.range,
            photoUrl: from.photoUrl,
            foodName: from.foodName,
            foodDetails: from.foodDetails);

  Food.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          range: json['range'],
          photoUrl: json['photoUrl'],
          foodName: json['foodName'],
          foodDetails: json['foodDetails'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'range': range,
        'photoUrl': photoUrl,
        'foodName': foodName,
        'foodDetails': foodDetails,
      };
}
