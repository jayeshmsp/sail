import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//MARK : - Fonts
class Fonts {
  static const String fontRegular = 'Regular';
  static const String fontMedium = 'Medium';
  static const String fontSemibold = 'Semibold';
  static const String fontBold = 'Bold';
}

class API {
  // static String baseUrl = 'http://202.131.107.108/demoapioffline/api/Contact/'; //202
  static String baseUrl = 'http://localhost/sailoffline/api/Contact/'; //Local
  static String updateContact = baseUrl + "UpdateContactSync";
  static String saveContact = baseUrl + "SaveContact";
  static String getReaderDetails = baseUrl + "getReaderDetails";
  static String getContactDetails = baseUrl + "getContactDetails";
  static String getOfflineContacts = baseUrl + "getOfflineContacts";
}

//MARK: - font sizes
class FontSize {
  static double textSize4 = 4.sp;
  static double textSize6 = 6.sp;
  static double textSize8 = 8.sp;
  static double textSize10 = 10.sp;
  static double textSize12 = 12.sp;
  static double textSize14 = 14.sp;
  static double textSize16 = 16.sp;
  static double textSize18 = 18.sp;
  static double textSize20 = 20.sp;
  static double textSize22 = 22.sp;
  static double textSize30 = 30.sp;
  static double textSize35 = 35.sp;
}

//MARK: - Spacing
class Spacing {
  static double spacingPadding2 = 2.0;
  static double spacingPadding4 = 4.0;
  static double spacingPadding6 = 6.0;
  static double spacingPadding8 = 8.0;
  static double spacingPadding10 = 10.0;
  static double spacingPadding12 = 12.0;
  static double spacingPadding14 = 14.0;
  static double spacingPadding15 = 15.0;
  static double spacingPadding16 = 16.0;
  static double spacingPadding18 = 18.0;
  static double spacingPadding20 = 20.0;
  static double spacingPadding22 = 22.0;
  static double spacingPadding24 = 24.0;
  static double spacingPadding32 = 32.0;
  static double spacingPadding40 = 40.0;
  static double spacingPadding50 = 50.0;
}