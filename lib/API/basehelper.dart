import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:zubara/languagedata/language_constants.dart';
import 'package:zubara/model/departmentAttributemodel.dart';
import 'package:zubara/model/departmentsmodel.dart';
import 'package:zubara/model/singleton.dart';
import 'package:zubara/screens/setPassword.dart';
import 'package:zubara/utils/const.dart';
import 'dart:convert';

import 'apimodel.dart';

class APIHELPER {
  Future<dynamic> getPlaceDetailFromId(
    String placeId,
  ) async {
    const kGoogleApiKey = "AIzaSyDruBo_2bXpTSTl7cb71GCqHueSV2jX30g";
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&key=$kGoogleApiKey';
    final response = await http.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        // final components =
        //     result['result']['address_components'] as List<dynamic>;
        print(result);
        final locationOf =
            result['result']['geometry']['location'] as Map<String, dynamic>;
        print(locationOf);
        // final double lang = result['result']['geometry']['location']['lng'];
        // locationOf.contains('location');

        // int lang = location['lng'];
        // print(lang);
        // build result
        // final place = PlaceSearch();
        // place.lat = ;
        // place.lng = locationOf['lng'];
        LatLng location = LatLng(locationOf['lat'], locationOf['lng']);
        return location;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<dynamic> sendOtpUser(var number, int screen, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json"
      // "Authorization": AuthenticationUser.getbasicauth(),
    };
    var url = screen == 0
        ? "${API.API_URL}${API.sendOtp}"
        : "${API.API_URL}${API.resetRequestOtp}";
    print("$url");

    try {
      var body = {"phone": "$number"};
      print("body: $body");
      print("header $header");
      EasyLoading.show();

      final response = await http.post(url, headers: header, body: body);
      var Json = json.decode(response.body);
      print("sign up response:$Json");
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");

        print(json.decode(response.body));
        // constValues().toast("${Json['message']}", context);
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else {
        EasyLoading.dismiss();

        constValues().toast("${getTranslated(context, "invalid")}", context);
      }
    } on SocketException {
      constValues().toast("${getTranslated(context, "no_internet")}", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("${getTranslated(context, "bad_format")}", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> verifyOtp(otp, screen, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json"
      // "Authorization": AuthenticationUser.getbasicauth(),
    };
    var url = screen == 0
        ? "${API.API_URL}${API.verifyOtp}"
        : "${API.API_URL}${API.resetVerifyOTP}";
    print("$url");

    try {
      var body = {"phone": "${User.userData.mobile}", "otp": "$otp"};
      print("body: $body");
      print("header $header");
      EasyLoading.show();
      final response = await http.post(url, headers: header, body: body);
      var Json = json.decode(response.body);
      print("sign up response:$Json");
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");

        print(json.decode(response.body));
        // constValues().toast("${Json['message']}", context);
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else {
        EasyLoading.dismiss();

        constValues().toast("${getTranslated(context, "invalid")}", context);
      }
    } on SocketException {
      constValues().toast("${getTranslated(context, "no_internet")}", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("${getTranslated(context, "bad_format")}", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> setPassword(password, screen, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json"
      // "Authorization": AuthenticationUser.getbasicauth(),
    };
    var url = screen == 0
        ? "${API.API_URL}${API.register}"
        : "${API.API_URL}${API.resetverifyPass}";
    print("$url");

    try {
      var body = {
        "phone": "${User.userData.mobile}",
        "password": "$password",
        "otp": "${User.userData.otp}"
      };
      print("body: $body");
      print("header $header");
      EasyLoading.show();
      final response = await http.post(url, headers: header, body: body);
      var Json = json.decode(response.body);
      print("sign up response:$Json");
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");

        print(json.decode(response.body));
        // constValues().toast("${Json['message']}", context);
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else {
        EasyLoading.dismiss();

        constValues().toast("${getTranslated(context, "invalid")}", context);
      }
    } on SocketException {
      constValues().toast("${getTranslated(context, "no_internet")}", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("${getTranslated(context, "bad_format")}", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> login(phone, password, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json",
      // "Authorization": "Bearer ${User.userData.token}",
    };
    var url = "${API.API_URL}${API.LoginUser}";
    print("$url");

    try {
      var body = {
        "phone": "$phone",
        "password": "$password",
      };
      print("body: $body");
      print("header $header");
      EasyLoading.show();
      final response = await http.post(url, headers: header, body: body);
      var Json = json.decode(response.body);
      print("sign up response:$Json");
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");

        print(json.decode(response.body));
        // constValues().toast("${Json['message']}", context);
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else {
        EasyLoading.dismiss();

        constValues().toast("${getTranslated(context, "invalid")}", context);
      }
    } on SocketException {
      constValues().toast("${getTranslated(context, "no_internet")}", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("${getTranslated(context, "bad_format")}", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> getuserProfile(context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json",
      "Authorization": "Bearer ${User.userData.token}",
    };
    var url = "${API.API_URL}${API.userProfile}";
    print("$url");

    try {
      var body = {
        // "phone": "${User.userData.mobile}",
        // "password": "$password",
      };
      print("body: $body");
      print("header $header");
      // EasyLoading.show();
      final response = await http.post(url, headers: header, body: body);
      var Json = json.decode(response.body);
      print("sign up response:$Json");
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        // constValues().toast("${Json['message']}", context);
        // EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        // EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else {
        // EasyLoading.dismiss();

        constValues().toast("${getTranslated(context, "invalid")}", context);
      }
    } on SocketException {
      constValues().toast("${getTranslated(context, "no_internet")}", context);
      // EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("${getTranslated(context, "wrong")}", context);
      // EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("${getTranslated(context, "bad_format")}", context);
      // EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("${getTranslated(context, "wrong")}", context);
      // EasyLoading.dismiss();
      print(value);
    }
  }

  Future<List<AllDepartmentResult>> getAllDepartments(context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json",
      "Authorization": "Bearer ${User.userData.token}",
    };
    var url = "${API.API_URL}${API.allDepartment}";
    print("$url");

    try {
      var body = {
        // "phone": "${User.userData.mobile}",
        // "password": "$password",
      };
      print("body: $body");
      print("header $header");
      // EasyLoading.show();
      final response = await http.post(url, headers: header, body: body);
      var Json = json.decode(response.body);
      print("ALl Departments:$Json");
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        AllDepartments allDepartments = AllDepartments.fromJson(Json);

        return allDepartments.result;
      } else if (response.statusCode == 503) {
        // EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else {
        // EasyLoading.dismiss();

        constValues().toast("${getTranslated(context, "invalid")}", context);
      }
    } on SocketException {
      constValues().toast("${getTranslated(context, "no_internet")}", context);
      // EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("${getTranslated(context, "wrong")}", context);
      // EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("${getTranslated(context, "bad_format")}", context);
      // EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("${getTranslated(context, "wrong")}", context);
      // EasyLoading.dismiss();
      print(value);
    }
  }

  Future<List<AttributeResult>> allDepartmentAttributes(id, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json",
      "Authorization": "Bearer ${User.userData.token}",
    };
    var url = "${API.API_URL}${API.departmentAttributes}";
    print("$url");

    try {
      var body = {
        "department_id": "$id",
        // "phone": "${User.userData.mobile}",
        // "password": "$password",
      };
      print("body: $body");
      print("header $header");
      // EasyLoading.show();
      final response = await http.post(url, headers: header, body: body);
      var Json = json.decode(response.body);
      print("ALl Departments:$Json");
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");
        print(json.decode(response.body));
        DepartmentsAttribute departmentAttribute =
            DepartmentsAttribute.fromJson(Json);

        return departmentAttribute.result;
      } else if (response.statusCode == 503) {
        // EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else {
        // EasyLoading.dismiss();

        constValues().toast("${getTranslated(context, "invalid")}", context);
      }
    } on SocketException {
      constValues().toast("${getTranslated(context, "no_internet")}", context);
      // EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("${getTranslated(context, "wrong")}", context);
      // EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("${getTranslated(context, "bad_format")}", context);
      // EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("${getTranslated(context, "wrong")}", context);
      // EasyLoading.dismiss();
      print(value);
    }
  }

  Future<dynamic> deposit(
      cardNo, cvv, month, year, name, amount, context) async {
    var header = {
      'Access-Control-Allow-Origin': "*",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept": "*/*",
      "Accept": "application/json",
      "Authorization": "Bearer ${User.userData.token}",
    };
    print(header);
    var url = "${API.API_URL}${API.depositAmount}";
    print("$url");

    try {
      var body = {
        "amount": "$amount",
        "card_holder_name": "$name",
        "card_number": "$cardNo",
        "cvv": "$cvv",
        "month": "$month",
        "year": "$year",
      };
      print("body: $body");
      print("header $header");
      EasyLoading.show();
      final response = await http.post(url, headers: header, body: body);
      var Json = json.decode(response.body);
      print("sign up response:$Json");
      if (response.statusCode == 200) {
        print("response status code: ${response.statusCode}");

        print(json.decode(response.body));
        // constValues().toast("${Json['message']}", context);
        EasyLoading.dismiss();
        return Json;
      } else if (response.statusCode == 503) {
        EasyLoading.dismiss();

        constValues()
            .toast("${getTranslated(context, "maintainance")}", context);
      } else {
        EasyLoading.dismiss();

        constValues().toast("${getTranslated(context, "invalid")}", context);
      }
    } on SocketException {
      constValues().toast("${getTranslated(context, "no_internet")}", context);
      EasyLoading.dismiss();
      print('No Internet connection 😑');
    } on HttpException catch (error) {
      print(error);
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print("Couldn't find the post 😱");
    } on FormatException catch (error) {
      print(error);

      constValues().toast("${getTranslated(context, "bad_format")}", context);
      EasyLoading.dismiss();
      print("Bad response format 👎");
    } catch (value) {
      constValues().toast("${getTranslated(context, "wrong")}", context);
      EasyLoading.dismiss();
      print(value);
    }
  }
}
