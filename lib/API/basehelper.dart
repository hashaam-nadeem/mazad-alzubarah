import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
}
