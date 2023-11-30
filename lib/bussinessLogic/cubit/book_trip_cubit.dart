import 'package:bloc/bloc.dart';
import 'package:flight_booking/data/Repositery/booKFlightRepositery.dart';
import 'package:flight_booking/data/models/bookFlightClass.dart';
import 'package:meta/meta.dart';

part 'book_trip_state.dart';

class BookTripCubit extends Cubit<BookTripState> {
    final FlightRepositoryBooking repository;
  BookTripCubit(this.repository)  : super(BookTripInitial());
   void postFlightData(FlightData flightData) async {
    try {
      emit(FlightLoading());
      await repository.postFlightData(flightData);
      emit(FlightSuccess());
    } catch (e) {
      emit(FlightFailure(error: e.toString()));
    }
  }
}

