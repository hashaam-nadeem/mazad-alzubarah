import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as prefix;
import 'package:location/location.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:zubara/API/basehelper.dart';
import 'package:zubara/model/singleton.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:zubara/utils/Colors.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/customTextfield.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';

LocationData currentLocation;
var location = new Location();

class AreaNeeded extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Area_Needed();
  }
}

class _Area_Needed extends State<AreaNeeded> {
  double slidervalue = 100;
  var width, height;
  BitmapDescriptor pinLocationIcon;
  Set<Marker> marker = new Set();
  static const kGoogleApiKey = "AIzaSyDruBo_2bXpTSTl7cb71GCqHueSV2jX30g";
  prefix.GoogleMapsPlaces _places =
      prefix.GoogleMapsPlaces(apiKey: kGoogleApiKey);
  LatLng _center = LatLng(User.userData.homeLat, User.userData.homeLong);
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController address = TextEditingController();
  // CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(currentLocation.longitude, currentLocation.longitude),
  //   zoom: 14.4746,
  // );
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(User.userData.homeLat, User.userData.homeLong),
    zoom: 14.4746,
  );

  CameraPosition _kLake = CameraPosition(
      target: LatLng(25.2854, 51.5310), zoom: 19.151926040649414);

  Future<void> gotoLocaiton() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  searchLocation() async {
    const kGoogleApiKey = "AIzaSyDruBo_2bXpTSTl7cb71GCqHueSV2jX30g";

    await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      mode: Mode.overlay, // Mode.fullscreen
      language: "en",
    ).then((value) async {
      if (value != null) {
        print(value.placeId);
        displayPrediction(value);
      }
    });
  }

  displayPrediction(prefix.Prediction p) async {
    print("place id........ : ${p.placeId}");
    APIHELPER().getPlaceDetailFromId(p.placeId).then((value) {
      LatLng loc = value;
      print("lat long: ${loc.latitude}:  ${loc.longitude}");
      setState(() {
        _kLake = CameraPosition(
            target: LatLng(loc.latitude, loc.longitude), zoom: 15);
      });
      gotoLocaiton();
    });
    // final detail = await _places.getDetailsByPlaceId(p.placeId).then((val) {
    //   print(val.result.geometry.location.lat);
    // });
    // double lat = detail.result.geometry.location.lat;
    // double lng = detail.result.geometry.location.lng;
    // print("place id lat:$lat, long: $lng");
  }

  getUserLocation() async {
    try {
      await location.getLocation().then((onValue) async {
        print(onValue.latitude);
        if (onValue != null) {
          setState(() {
            _kLake = CameraPosition(
                target: LatLng(onValue.latitude, onValue.longitude), zoom: 14);
          });
          gotoLocaiton();
        } else {}
        setState(() {
          // User.userData.lat = onValue.latitude;
          // User.userData.long = onValue.longitude;
        });
        // print(User.userData.lat);
        // print(User.userData.long);
//        getAddress(User.userData.lat, User.userData.lat);
      }).catchError((onError) async {
        print(onError.toString());
        if (onError.toString().contains("PERMISSION_DENIED_NEVER_ASK")) {
          bool isOpened = await PermissionHandler().openAppSettings();
        } else {
          // getUserLocation();
        }
      });
    } on Exception catch (e) {
      print("call");
      //  getUserLocation();
      // currentLocation = null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setCustomMapPin();
    getUserLocation();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5, size: Size(20, 20)),
        'images/pinmarker.png');
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
        body: Container(
      child: Stack(
        children: <Widget>[
          _googlemaps(context),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: appbarWidget(),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width * .7,
              height: height * .15,
              margin: EdgeInsets.only(bottom: height * .1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: lightGolden, width: 2),
                  color: mainColor),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "${address.text}",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: headingStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var addresses;

                          var first;
                          print("address");
                          print("lat: ${_center.latitude}");
                          print("long: ${_center.longitude}");
                          final coordinates = new Coordinates(
                              _center.latitude, _center.longitude);
                          addresses = await Geocoder.local
                              .findAddressesFromCoordinates(coordinates);

                          setState(() {
                            first = addresses.first;
                            print("${addresses.first.locality}");
                            // first = first.addressLine;
                            // User.userData.address =
                            //     addresses.first.addressLine;
                            User.userData.homeLat = _center.latitude;
                            User.userData.homeLong = _center.longitude;
                            address.text = first.addressLine.toString();
                          });
                          _showModal();
                          // constValues().setLocationsharedpreferencedata(
                          //     _center.latitude, _center.longitude);
                          // print(
                          //     "save address line: ${User.userData.address = addresses.first.addressLine}");
                          // Provider.of<LocationProvider>(context,
                          //         listen: false)
                          //     .setlocation();
                          // if (User.userData.userDetailModel != null) {
                          //   APIHelper()
                          //       .addAddress(
                          //           "${API.API_URL}${API.Addaddress}",
                          //           "",
                          //           "${addresses.first.addressLine}",
                          //           "",
                          //           "",
                          //           User.userData.lat,
                          //           User.userData.long,
                          //           context,
                          //           false)
                          //       .then((value) {
                          //     print("add new address response: $value");
                          //     if (value["error"] == false) {
                          //       constValues().toast(
                          //           "${getTranslated(context, "success")}",
                          //           context);
                          //       setState(() {
                          //         // User.userData.lat = 0.0;
                          //         // User.userData.long = 0.0;
                          //         // User.userData.address = "";
                          //         User.userData.building = "";
                          //         User.userData.zone = "";
                          //       });
                          //       AppRoutes.replace(context, Dashboard());
                          //     } else {
                          //       AppRoutes.replace(context, Dashboard());
                          //       // constValues().toast(
                          //       //     "${getTranslated(context, "invalid")}",
                          //       //     context);
                          //     }
                          //   }).catchError((onError) {
                          //     AppRoutes.replace(context, Dashboard());
                          //     // constValues().toast(
                          //     //     "${getTranslated(context, "wrong")}",
                          //     //     context);
                          //   });
                          // } else {
                          //   AppRoutes.replace(context, Dashboard());
                          // }
                          // AppRoutes.push(context, SetPassword());
                        },
                        child: CustomButton(
                          width: width * .5,
                          height: height * .06,
                          color: lightGolden,
                          title: "Select here",
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Container(
                  margin: EdgeInsets.only(top: height * .1),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .1,
                  padding: EdgeInsets.all(10),
                  color: Colors.transparent,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              AppRoutes.pop(context);
                              // AppRoutes.replace(context, Dashboard());
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: lightGolden,
                              size: height * .04,
                            )),
                        GestureDetector(
                          onTap: () async {
                            searchLocation();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Theme.of(context).primaryColor),
                            width: MediaQuery.of(context).size.width * .65,
                            height: MediaQuery.of(context).size.height * .06,
                            padding: EdgeInsets.all(10),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Search",
                                  style: headingStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                Icon(
                                  Icons.search,
                                  color: lightGolden,
                                  size: height * .03,
                                )
                              ],
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            getUserLocation();
                          },
                          child: Container(
                            width: width * .1,
                            height: height * .06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: mainColor,
                                border:
                                    Border.all(color: lightGolden, width: 2)),
                            child: Center(
                                child: Icon(Icons.my_location,
                                    size: height * .03, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _googlemaps(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.normal,

            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .25),
            markers: marker,
            onCameraMove: (move) async {
              setState(() {
                _center = move.target;
              });
              var first;
              final coordinates =
                  new Coordinates(_center.latitude, _center.longitude);
              var addresses = await Geocoder.local
                  .findAddressesFromCoordinates(coordinates);
              setState(() {
                first = addresses.first;
                address.text = first.addressLine;
                // User.userData.address =
                //     addresses.first.addressLine;
                User.userData.homeLat = _center.latitude;
                User.userData.homeLong = _center.longitude;
              });
              print(address);
              setState(() {
                circles.clear();
                marker.clear();

                // marker.add(
                //   Marker(
                //     markerId: MarkerId("selected-location"),
                //     position: _center,
                //   ),
                // );
                // circles
                //   ..add(Circle(
                //       circleId: CircleId("abcd"),
                //       radius: slidervalue,
                //       strokeColor: Colors.green,
                //       center: move.target));
              });
            },
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            //circles: circles,
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .22),
                child: Image.asset(
                  "images/pinmarker.png",
                  width: MediaQuery.of(context).size.width * .15,
                  height: MediaQuery.of(context).size.height * .2,
                )))
      ],
    );
  }

  Set<Circle> circles = Set.from([
    Circle(
      circleId: CircleId("map"),
      strokeColor: mainColor,
      center: LatLng(31.5102, 74.3441),
      radius: 10000,
    )
  ]);

  Widget appbarWidget() {
    return
        // Main Grounded Container
        Container(
      height: MediaQuery.of(context).size.height * .12,
      child: Stack(
        children: <Widget>[
          // Green Container
          Container(
            height: MediaQuery.of(context).size.height * .2,
            color: mainColor,
          ),

          // data Containe
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Text(''),
                // Text(''),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * .27,
                      // ),
                      Text(
                        "Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          searchLocation();
                        },
                        child: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * .5,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 10,
                right: 10,
                left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: mainColor,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          controller: address,
                          keyboardTypenumeric: false,
                          width: width * .85,
                          title: "Address",
                          height: height * 08,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          width: width * .25,
                          keyboardTypenumeric: true,
                          title: "Building",
                          height: height * 08,
                        ),
                        SizedBox(
                          width: width * .03,
                        ),
                        CustomTextField(
                          width: width * .25,
                          keyboardTypenumeric: true,
                          title: "Street",
                          height: height * 08,
                        ),
                        SizedBox(
                          width: width * .03,
                        ),
                        CustomTextField(
                          width: width * .25,
                          title: "Zone",
                          keyboardTypenumeric: true,
                          height: height * 08,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // AppRoutes.push(context, SetPassword());
                          },
                          child: CustomButton(
                            width: width * .6,
                            height: height * .08,
                            color: lightGolden,
                            title: "Add Address",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
