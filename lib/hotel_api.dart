import 'dart:async';
import 'dart:convert';
import 'hotel_model.dart';
import 'package:http/http.dart' as http;

class HotelApi {
  final String _baseUrl = 'https://raw.githubusercontent.com';
  final String _endPoint =
      '/enzoftware/hotel_booking_app/master/server/hotels.json';

  Future<List<HotelModel>> getHotels() async {
    final data = await http.get(_baseUrl + _endPoint);
    final responseList = json.decode(data.body);
    return [for (final hotel in responseList) HotelModel.fromJson(hotel)];
  }
}
