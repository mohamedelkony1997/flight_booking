// flight_repository.dart
import 'dart:convert';
import 'package:flight_booking/constatnts/Strings.dart';
import 'package:flight_booking/data/models/Flight.dart';
import 'package:http/http.dart' as http;

class FlightRepository {
  Future<List<Flight>> getFlights() async {
    final response = await http.get(Uri.parse('$baseUrl/Flights'));

    if (response.statusCode == 200) {
      final List<dynamic> flightsJson = json.decode(response.body);
      print("Response body: $flightsJson");

      // Map the list of dynamic JSON objects to a list of Flight objects
      List<Flight> flights = flightsJson.map((json) => Flight.fromJson(json)).toList();
      
      return flights;
    } else {
      throw Exception('Failed to load flights');
    }
  }
}
