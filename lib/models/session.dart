class Session {
  String token;
  // User user;

  Session({this.token});
  Session.fromJson(Map<String, dynamic> json) : this(token: json['token']);
  Map<String, dynamic> toJson() => {'token': token};
}
