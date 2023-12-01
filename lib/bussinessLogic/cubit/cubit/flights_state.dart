
import 'package:flight_booking/data/models/Flight.dart';


class FlightState {}

class FlightLoadingState extends FlightState {}

class FlightDataState extends FlightState {
  final List<Flight> flights;

  FlightDataState(this.flights);
}

class FlightErrorState extends FlightState {
  final String error;

  FlightErrorState(this.error);
}
