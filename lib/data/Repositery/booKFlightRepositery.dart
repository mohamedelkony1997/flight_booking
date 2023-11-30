// repository.dart
import 'dart:convert';
import 'package:flight_booking/constatnts/Strings.dart';
import 'package:flight_booking/data/models/bookFlightClass.dart';
import 'package:http/http.dart' as http;

class FlightRepositoryBooking {
  Future<void> postFlightData(FlightData flightData) async {
    final response = await http.post(
      Uri.parse('${baseUrl}bookflight'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(flightData.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to post flight data');
    }
  }
}
