// flight_model.dart
class Flight {
  final String price;
  final String arrivalTime;
  final String departureTime;
  final int numOfStop;
  final int timeOfTrip;
  final String tripNum;

  Flight({
    required this.price,
    required this.arrivalTime,
    required this.departureTime,
    required this.numOfStop,
    required this.timeOfTrip,
    required this.tripNum,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      price: json['Price'],
      arrivalTime: json['ArrivalTime'],
      departureTime: json['DepartureTime'],
      numOfStop: json['numOfStop'],
      timeOfTrip: json['timeOfTrip'],
      tripNum: json['tripNum'],
    );
  }
}
