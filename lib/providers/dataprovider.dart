import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  int otp;
  double total = 0.0;
  String phoneNo;
  bool selectAddress = false;
  int get phoneotp {
    return otp;
  }

  void setLocation(bool value) {
    selectAddress = value;
    notifyListeners();
  }

  bool get selectedAddress {
    return selectAddress;
  }

  void setphoneOtp(int text) {
    otp = text;
    notifyListeners();
  }

  String get phonenumber {
    return phoneNo;
  }

  void setphone(String text) {
    phoneNo = text;
    notifyListeners();
  }

  void setTotal(double a) {
    total = total + a;
    notifyListeners();
  }

  void setToalZero() {
    total = 0.0;
  }

  double getTotal() {
    return total;
  }
}
