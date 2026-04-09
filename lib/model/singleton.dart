import 'package:zubara/model/departmentAttributemodel.dart';
import 'package:zubara/model/userdetailmodel.dart';

class User {
  // singleton
  static final User _singleton = User._internal();
  factory User() => _singleton;
  User._internal();
  static User get userData => _singleton;
  var homeLat = 25.2854;
  var homeLong = 51.5310;
  var lang = "en";
  var mobile;
  var otp;
  var token;
  var departmentId;
  UserResult userResult;
  // ignore: prefer_collection_literals
  List<Map<dynamic, dynamic>> addProduct = List<Map<dynamic, dynamic>>();
  List<AttributeResult> attributeResult = List<AttributeResult>();
}
