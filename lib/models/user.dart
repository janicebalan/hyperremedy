class User {
  dynamic
      id; // Use dynamic type because json-server id is int and firestore id is string
  String _name;
  String _phoneNo;
  String _yearBorn;
  String _password;
  String _email;

  get name => _name;
  set name(value) => _name = value;

  get email => _email;
  set email(value) => _email = value;

  get phoneNo => _phoneNo;
  set phoneNo(value) => _phoneNo = value;

  get yearBorn => _yearBorn;
  set yearBorn(value) => _yearBorn = value;

  get password => _password;
  set password(value) => _password = value;

  User(
      {this.id,
      String name = '',
      String phoneNo = '',
      String yearBorn = '',
      String password = '',
      String email = ""})
      : _name = name,
        _phoneNo = phoneNo,
        _yearBorn = yearBorn,
        _password = password,
        _email = email;
  User.copy(User from)
      : this(
            id: from.id,
            name: from.name,
            phoneNo: from.phoneNo,
            yearBorn: from.yearBorn,
            password: from.password,
            email: from.email);

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          phoneNo: json['phoneNo'],
          yearBorn: json['yearBorn'],
          password: json['password'],
          email: json['email'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phoneNo': phoneNo,
        'yearBorn': yearBorn,
        'password': password,
        'email': email,
      };
}
