import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          "Book your Flight": 'احجز رحتلك',
          "Multi_City": "مدينة متعددة",
          "RoundTrip": "جولة",
          "One Way": "طريق واحد",
          "Search Flight": "البحث عن الرحلة",
          "Flight created Suceesefully": "تم إنشاء الرحلة بنجاح",
          'First Class': "الدرجة الأولى",
          'Bussiness': "رجال الأعمال   ",
          'Num Of Kids': 'عدد الأطفال',
          'Economy': "الاقتصاديه",
          'Num Of Adults': 'عدد البالغين',
          'Departure': "الرحيل",
          'Please enter departure': 'الرجاء إدخال المغادرة',
          "To": "إلى",
          "From": " من",
          "in": "فى",
          "hr": "ساعه",
          "stop": "وقوف",
          "BookFlight": "حجز الرحله",
          "Search Results": "نتائج البحث",
          "Best Values Offers to Asia": "أفضل العروض القيمة لآسيا",
          "OK": "حسنا ",
          "Discounted Price: ": "السعر المخفض: ",
          "Original Price:": "السعر الأصلي:",
          "You have a 10% discount on the price!": "لديك خصم 10% على السعر!",
          "Promo Code Applied": "تم تطبيق الرمز الترويجي",
        },
        'en': {
          "Book your Flight": "Book your Flight",
          "Multi_City": "Multi_City",
          "RoundTrip": "RoundTrip",
          "One Way": "One Way",
          "Search Flight": "Search Flight",
          "Flight created Suceesefully": "Flight created Suceesefully",
          'First Class': 'First Class',
          'Bussiness': 'Bussiness',
          'Num Of Kids': 'Num Of Kids',
          'Economy': 'Economy',
          'Num Of Adults': 'Num Of Adults',
          'Departure': 'Departure',
          'Please enter departure': 'Please enter departure',
          "To": "To",
          "From": "From",
          "in": "in",
          "hr": "hr",
          "stop": "stop",
          "BookFlight": "BookFlight",
          "Search Results": "Search Results",
          "Best Values Offers to Asia": "Best Values Offers to Asia",
          "OK": "OK",
          "Discounted Price: ": "Discounted Price: ",
          "Original Price:": "Original Price:",
          "You have a 10% discount on the price!":
              "You have a 10% discount on the price!",
          "Promo Code Applied": "Promo Code Applied",
        }
      };
}

class LocalizationController extends GetxController {
  var locale = 'ar'.obs;

  void changeLocale(String newLocale) {
    locale.value = newLocale;
    Get.updateLocale(Locale(newLocale));
  }
}
