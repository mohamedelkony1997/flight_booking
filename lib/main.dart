import 'package:flight_booking/AppRouter.dart';
import 'package:flight_booking/constatnts/mylocal.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

void main() {
  runApp(MyApp(
    approute: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter approute;
  const MyApp({super.key, required this.approute});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final localizationController = Get.put(LocalizationController());

    return Obx(
      () => GetMaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        locale: Locale(localizationController.locale.value),
        translations: MyLocal(),
        onGenerateRoute: approute.generateRoute,
      ),
    );
  }
  
}
