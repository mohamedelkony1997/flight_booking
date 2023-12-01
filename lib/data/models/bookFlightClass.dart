
class FlightData {

  final String departure;
  final String from;
  final String to;
  final int numOfAdult;
  final int numOfKids;
  final String flightClass;

  FlightData({
   
    required this.departure,
    required this.from,
    required this.to,
    required this.numOfAdult,
    required this.numOfKids,
    required this.flightClass,
  });

  Map<String, dynamic> toJson() {
    return {
      
      'departure': departure,
      'from': from,
      'to': to,
      'numOfAdult': numOfAdult,
      'numOfkids': numOfKids,
      'Class': flightClass,
    };
  }
}
