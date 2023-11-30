part of 'book_trip_cubit.dart';

@immutable
sealed class BookTripState {}

final class BookTripInitial extends BookTripState {}
class FlightLoading extends BookTripState {}

class FlightSuccess extends BookTripState {}

class FlightFailure extends BookTripState {
  final String error;

  FlightFailure({required this.error});
}