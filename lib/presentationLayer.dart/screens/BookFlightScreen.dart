// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flight_booking/AppRouter.dart';
import 'package:flight_booking/bussinessLogic/cubit/book_trip_cubit.dart';
import 'package:flight_booking/constatnts/Strings.dart';
import 'package:flight_booking/constatnts/mylocal.dart';
import 'package:flight_booking/data/models/bookFlightClass.dart';
import 'package:flight_booking/presentationLayer.dart/screens/FlightScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookFlightScreen extends StatelessWidget {
  const BookFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationController = Get.find<LocalizationController>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: RoundedAppBar(localizationController: localizationController),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: DottedBorder(
                  dashPattern: [6, 3], // Adjust the dash pattern as needed
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20.0), // Adjust the radius as needed
                  strokeWidth: 2.0,
                  color: Color.fromARGB(255, 8, 41, 226),
                  child: Container(
                    width: double.infinity,
                    height: 370,
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: SizedBox(
                          width: double.infinity - 10,
                          height: 390,
                          child: formFlight()),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
                Text(
                          "Best Values Offers to Asia".tr,
                           softWrap: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedAppBar extends StatelessWidget {
  final LocalizationController localizationController;

  const RoundedAppBar({Key? key, required this.localizationController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 8, 41, 226),
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
                    "Book your Flight".tr,
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
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedContainer("One Way".tr),
              RoundedContainer("RoundTrip".tr),
              RoundedContainer("Multi_City".tr),
            ],
          ),
        ],
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final String text;

  RoundedContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color.fromARGB(255, 8, 41, 226),
        ),
      ),
    );
  }
}

class formFlight extends StatefulWidget {
  const formFlight({Key? key});

  @override
  State<formFlight> createState() => formFlightState();
}

class formFlightState extends State<formFlight> {
  TextEditingController startdateinput = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  DateTime? _startDate = DateTime.now();
  int? selectedNumber1;
  int? selectedNumber2;
  String selectedClass = "";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity - 20,
      height: 390,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: from,
                    decoration: InputDecoration(
                      label: Text("From".tr),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 41, 226), width: 2.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10), // Adjust the spacing between TextFormFields
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: to,
                    decoration: InputDecoration(
                      label: Text("To".tr),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 41, 226), width: 2.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    showCursor: true,
                    readOnly: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter departure'.tr;
                      }
                      return null;
                    },
                    controller: startdateinput,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        child: Icon(Icons.calendar_month,
                            color: Color.fromARGB(255, 8, 41, 226)),
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: _startDate ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(3000),
                          );

                          if (pickedDate != null && pickedDate != _startDate) {
                            _startDate = pickedDate;
                            startdateinput.text =
                                DateFormat('yyyy-MM-dd').format(_startDate!);
                          }
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 8, 41, 226)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      label: Text(
                        'Departure'.tr,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                    height: 70,
                    child: Container(
                      width: 150, // Set a fixed width for consistency
                      child: DropdownButtonFormField<int>(
                        value: selectedNumber1,
                        onChanged: (int? newValue) {
                          setState(() {
                            selectedNumber1 = newValue;
                          });
                        },
                        items: List.generate(
                          11,
                          (index) => DropdownMenuItem<int>(
                            value: index,
                            child: Text('$index'),
                          ),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Num Of Adults'.tr,
                        ),
                      ),
                    )),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                    height: 70,
                    child: Container(
                      width: 150, // Set a fixed width for consistency
                      child: DropdownButtonFormField<int>(
                        value: selectedNumber2,
                        onChanged: (int? newValue) {
                          setState(() {
                            selectedNumber2 = newValue;
                          });
                        },
                        items: List.generate(
                          11,
                          (index) => DropdownMenuItem<int>(
                            value: index,
                            child: Text('$index'),
                          ),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Num Of Kids'.tr,
                        ),
                      ),
                    )),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceCard(
                text: 'Economy'.tr,
                isSelected: selectedClass == "Economy",
                onTap: () {
                  setState(() {
                    selectedClass = "Economy";
                    print(selectedClass);
                  });
                },
              ),
              ChoiceCard(
                text: 'Bussiness'.tr,
                isSelected: selectedClass == 'Bussiness',
                onTap: () {
                  setState(() {
                    selectedClass = "Bussiness";
                    print(selectedClass);
                  });
                },
              ),
              ChoiceCard(
                text: 'First Class'.tr,
                isSelected: selectedClass == 'First Class',
                onTap: () {
                  setState(() {
                    selectedClass = "First Class";
                    print(selectedClass);
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(200, 40)),
              backgroundColor: MaterialStateProperty.all(
                Color(0xFF2661FA),
              ),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              final flightData = FlightData(
                // Populate with the relevant data from your form

                departure: startdateinput.text,
                from: from.text,
                to: to.text,
                numOfAdult: selectedNumber1!,
                numOfKids: selectedNumber2!,
                flightClass: selectedClass,
              );

              // Access the FlightCubit using BlocProvider
              BlocProvider.of<BookTripCubit>(context)
                  .postFlightData(flightData);
              Fluttertoast.showToast(
                  msg: "Flight created Suceesefully".tr,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.pushNamed(
                context,
                Flights,
                arguments: FlightsScreen(
                  from: from.text,
                  to: to.text,
                  departure: startdateinput.text,
                  flightClass: selectedClass,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text(
                "Search Flight".tr,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  ChoiceCard({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(255, 8, 41, 226) : Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
