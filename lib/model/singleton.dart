class User {
  // singleton
  static final User _singleton = User._internal();
  factory User() => _singleton;
  User._internal();
  static User get userData => _singleton;
  var homeLat = 25.2854;
  var homeLong = 51.5310;
}
