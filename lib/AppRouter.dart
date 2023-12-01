import 'package:flight_booking/bussinessLogic/cubit/book_trip_cubit.dart';
import 'package:flight_booking/bussinessLogic/cubit/cubit/flights_cubit.dart';
import 'package:flight_booking/constatnts/Strings.dart';
import 'package:flight_booking/data/Repositery/FlightRepositery.dart';
import 'package:flight_booking/data/Repositery/booKFlightRepositery.dart';
import 'package:flight_booking/presentationLayer.dart/screens/BookFlightScreen.dart';
import 'package:flight_booking/presentationLayer.dart/screens/FlightScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late FlightRepositoryBooking _bookflightRepository;
  late BookTripCubit _flightCubit;
  late FlightCubit _flights;
  late FlightRepository _flightsRep;
  AppRouter() {
    _bookflightRepository = FlightRepositoryBooking();
    _flightCubit = BookTripCubit(_bookflightRepository);
    _flightsRep = FlightRepository();
    _flights = FlightCubit(_flightsRep);
  }

  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case bookflightScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => _flightCubit,
            child: BookFlightScreen(), 
          ),
        );
      case Flights:
        var arguments = routeSettings.arguments as FlightsScreen;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => _flights,
            child: FlightsScreen(
              from: arguments.from,
              to: arguments.to,
              departure: arguments.departure,
              flightClass: arguments.flightClass,
            ),
          ),
        );
    
      default:
        return null;
    }
  }
}
