// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flight_booking/bussinessLogic/cubit/cubit/flights_state.dart';
import 'package:flight_booking/constatnts/mylocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flight_booking/bussinessLogic/cubit/cubit/flights_cubit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FlightsScreen extends StatelessWidget {
  final String from;
  final String to;
  final String departure;
  final String flightClass;

  const FlightsScreen({
    required this.from,
    required this.to,
    required this.departure,
    required this.flightClass,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flightCubit = BlocProvider.of<FlightCubit>(context).getFlights();
    final localizationController = Get.find<LocalizationController>();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: RoundedAppBar(
            from2: from,
            to2: to,
            departure2: departure,
            flightClass2: flightClass,
            localizationController: localizationController,
          ),
        ),
        body: BlocBuilder<FlightCubit, FlightState>(
          builder: (context, state) {
            if (state is FlightLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FlightDataState) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${state.flights.length} " + "Available Flights",
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 34, 177),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        ImageIcon(AssetImage("assets/images/filter.png")),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.51,
                      child: ListView.builder(
                        itemCount: state.flights.length,
                        itemBuilder: (context, index) {
                          final flight = state.flights[index];
                          String dateString = flight.arrivalTime;
                          DateTime dateTime = DateTime.parse(dateString);

                          String formattedTime =
                              DateFormat('HH:mm').format(dateTime.toLocal());
                          String dateString2 = flight.departureTime;
                          DateTime dateTime2 = DateTime.parse(dateString2);

                          String formattedTime2 =
                              DateFormat('HH:mm').format(dateTime2.toLocal());
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Center(
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  DottedBorder(
                                    dashPattern: [6, 3],
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(20.0),
                                    strokeWidth: 2.0,
                                    color: Color.fromARGB(255, 8, 34, 177),
                                    child: Container(
                                      width: double.infinity,
                                      height: 130,
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "in".tr + '  ${flight.tripNum}',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 8, 34, 177),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                "${flight.timeOfTrip} " +
                                                    "hr".tr,
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 8, 34, 177),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                "${flight.numOfStop} " +
                                                    "stop".tr,
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 8, 34, 177),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                '${formattedTime2}',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 8, 34, 177),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              Image.asset(
                                                "assets/images/tempsnip.png",
                                                height: 60,
                                                width: 180,
                                              ),
                                              Text(
                                                "${formattedTime}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 8, 34, 177),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Add other flight information as needed
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        minimumSize: MaterialStateProperty.all(
                                            Size(200, 40)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color(0xFF2661FA),
                                        ),
                                        shadowColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                      ),
                                      onPressed: () {
                                        // Your button action
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        child: Text(
                                          "${flight.price}\$ " +
                                              "BookFlight".tr,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is FlightErrorState) {
              return Center(child: Text(state.error));
            } else {
              return Center(child: Text('Unexpected state'));
            }
          },
        ),
      ),
    );
  }
}

class RoundedAppBar extends StatelessWidget {
  final LocalizationController localizationController;
  final String from2;
  final String to2;
  final String departure2;
  final String flightClass2;

  const RoundedAppBar(
      {required this.from2,
      required this.to2,
      required this.departure2,
      required this.flightClass2,
      Key? key,
      required this.localizationController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 5, 25, 141),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/logo.PNG"),
                  radius: 15.0,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Search Results".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  items: <String>[
                    'English',
                    'عربى',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue == 'English') {
                      localizationController.changeLocale('en');
                    } else if (newValue == 'عربى') {
                      localizationController.changeLocale('ar');
                    }
                  },
                  icon: Icon(Icons.language, color: Colors.white),
                  underline: SizedBox(),
                dropdownColor: Colors.white,
                  style: TextStyle(color:Color.fromARGB(255, 8, 41, 226),),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '$from2',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Image.asset("assets/images/line.PNG"),
              Text("$to2",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'OneWay',
                style: TextStyle(color: Colors.white),
              ),
              Text("$departure2",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text("$flightClass2",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
    );
  }
}
