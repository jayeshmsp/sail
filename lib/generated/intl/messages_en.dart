// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(barcodeNumber) => "Number : ${barcodeNumber}";

  static String m1(name) => "Hello / ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AppBarTitle": MessageLookupByLibrary.simpleMessage(
            "شركة الشراع للملاحة والخدمات اللوجستية"),
        "SecondScreenHintText": MessageLookupByLibrary.simpleMessage(
            "1.Original Customs Decliration(Bayan)\n2.B/L Automated D/O copy\n3.Invoice Copy\n4.Certificate Of origin Copy\n5.Authorisation letter for Consignee\n6.Authorisation Of signatury\n7.Civil I.D copy"),
        "barcodeNumber": m0,
        "civilIdCardNumber":
            MessageLookupByLibrary.simpleMessage("Civil I.D. Card Number"),
        "finalScreenHintText": MessageLookupByLibrary.simpleMessage(
            "*You will get SMS within 3 minutes confirm receiving Doc.\n*You will get SMS message with QR Code + Serial number for daily process\n*Expected time for shipment to be ready for receicing is 4 Houres from time of starting procedure"),
        "hello": m1,
        "helloSir": MessageLookupByLibrary.simpleMessage("Hello Sir"),
        "ifTheBelowDocumentIsValidePlspressOk":
            MessageLookupByLibrary.simpleMessage(
                "If the below document is valide Pls.press OK :"),
        "kindlyEnterYourMobileNumber":
            MessageLookupByLibrary.simpleMessage("Mobile Number"),
        "kindlyFollowTheBelow":
            MessageLookupByLibrary.simpleMessage("Kindly follow the below :"),
        "lastScreenBottomData": MessageLookupByLibrary.simpleMessage(
            "Kindly notice that this is not consider delivery untill you receive SMS from our side."),
        "mainPageButton": MessageLookupByLibrary.simpleMessage("Main Page"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "noDataFound": MessageLookupByLibrary.simpleMessage("No Data Found"),
        "noteForQualityControllAllProcessIsMonitoredByCctv":
            MessageLookupByLibrary.simpleMessage(
                "Note : For quality controll all process is monitored By CCTV Camera."),
        "number": MessageLookupByLibrary.simpleMessage("Number"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "pleaseEnterAMobilePhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter a mobile phone number"),
        "pleaseEnterAValidMobilePhoneNumber":
            MessageLookupByLibrary.simpleMessage(
                "Please enter a valid mobile phone number"),
        "pleaseEnterScanBarcode":
            MessageLookupByLibrary.simpleMessage("Please scan Barcode."),
        "recodeNotStoredOffline":
            MessageLookupByLibrary.simpleMessage("Recode not stored offline"),
        "recordCreated": MessageLookupByLibrary.simpleMessage("Record Created"),
        "sail": MessageLookupByLibrary.simpleMessage("Sail"),
        "sailShippingLogisticsServices": MessageLookupByLibrary.simpleMessage(
            "Sail Shipping Logistics Services"),
        "scan": MessageLookupByLibrary.simpleMessage("Scan"),
        "scanTheBarcode": MessageLookupByLibrary.simpleMessage(
            "Kindly scan transaction barcode"),
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "sync": MessageLookupByLibrary.simpleMessage("Sync"),
        "thankYou": MessageLookupByLibrary.simpleMessage("Thank you"),
        "thanks": MessageLookupByLibrary.simpleMessage("Thanks"),
        "thisNumberIsNotAvailable": MessageLookupByLibrary.simpleMessage(
            "This number is not available"),
        "transactionPaperInTheBox": MessageLookupByLibrary.simpleMessage(
            "Kindly put the transaction\'s paper in the box"),
        "transactionScreenHintText": MessageLookupByLibrary.simpleMessage(
            "1.Scan bayan Barcode\n2.Insert all document in the post box\n3.Press OK"),
        "welCome": MessageLookupByLibrary.simpleMessage("Wel Come"),
        "welcome": MessageLookupByLibrary.simpleMessage(
            "Welcome in Automation Customs decliration receiver")
      };
}
