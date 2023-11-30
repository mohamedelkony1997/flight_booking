import 'package:bloc/bloc.dart';
import 'package:flight_booking/bussinessLogic/cubit/cubit/flights_state.dart';
import 'package:flight_booking/data/Repositery/FlightRepositery.dart';

import 'package:flight_booking/data/models/Flight.dart';
import 'package:meta/meta.dart';

class FlightCubit extends Cubit<FlightState> {
  final FlightRepository _flightRepository = FlightRepository();

  FlightCubit(FlightRepository flightsRep) : super(FlightLoadingState());

  Future<void> getFlights() async {
  try {
    final flights = await _flightRepository.getFlights();
    emit(FlightDataState(flights));
  } catch (e) {
    emit(FlightErrorState('Failed to load flights'));
  }
}
}
