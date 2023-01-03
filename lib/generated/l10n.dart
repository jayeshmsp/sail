// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Sd {
  Sd();

  static Sd? _current;

  static Sd get current {
    assert(_current != null,
        'No instance of Sd was loaded. Try to initialize the Sd delegate before accessing Sd.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Sd> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Sd();
      Sd._current = instance;

      return instance;
    });
  }

  static Sd of(BuildContext context) {
    final instance = Sd.maybeOf(context);
    assert(instance != null,
        'No instance of Sd present in the widget tree. Did you add Sd.delegate in localizationsDelegates?');
    return instance!;
  }

  static Sd? maybeOf(BuildContext context) {
    return Localizations.of<Sd>(context, Sd);
  }

  /// `Sail`
  String get sail {
    return Intl.message(
      'Sail',
      name: 'sail',
      desc: '',
      args: [],
    );
  }

  /// `Welcome in Automation Customs decliration receiver`
  String get welcome {
    return Intl.message(
      'Welcome in Automation Customs decliration receiver',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get kindlyEnterYourMobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'kindlyEnterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a mobile phone number`
  String get pleaseEnterAMobilePhoneNumber {
    return Intl.message(
      'Please enter a mobile phone number',
      name: 'pleaseEnterAMobilePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid mobile phone number`
  String get pleaseEnterAValidMobilePhoneNumber {
    return Intl.message(
      'Please enter a valid mobile phone number',
      name: 'pleaseEnterAValidMobilePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `This number is not available`
  String get thisNumberIsNotAvailable {
    return Intl.message(
      'This number is not available',
      name: 'thisNumberIsNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get thankYou {
    return Intl.message(
      'Thank you',
      name: 'thankYou',
      desc: '',
      args: [],
    );
  }

  /// `Number : {barcodeNumber}`
  String barcodeNumber(Object barcodeNumber) {
    return Intl.message(
      'Number : $barcodeNumber',
      name: 'barcodeNumber',
      desc: '',
      args: [barcodeNumber],
    );
  }

  /// `Kindly put the transaction's paper in the box`
  String get transactionPaperInTheBox {
    return Intl.message(
      'Kindly put the transaction\'s paper in the box',
      name: 'transactionPaperInTheBox',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Record Created`
  String get recordCreated {
    return Intl.message(
      'Record Created',
      name: 'recordCreated',
      desc: '',
      args: [],
    );
  }

  /// `Kindly notice that this is not consider delivery untill you receive SMS from our side.`
  String get lastScreenBottomData {
    return Intl.message(
      'Kindly notice that this is not consider delivery untill you receive SMS from our side.',
      name: 'lastScreenBottomData',
      desc: '',
      args: [],
    );
  }

  /// `Hello / {name}`
  String hello(Object name) {
    return Intl.message(
      'Hello / $name',
      name: 'hello',
      desc: '',
      args: [name],
    );
  }

  /// `Kindly scan transaction barcode`
  String get scanTheBarcode {
    return Intl.message(
      'Kindly scan transaction barcode',
      name: 'scanTheBarcode',
      desc: '',
      args: [],
    );
  }

  /// `Hello Sir`
  String get helloSir {
    return Intl.message(
      'Hello Sir',
      name: 'helloSir',
      desc: '',
      args: [],
    );
  }

  /// `Civil I.D. Card Number`
  String get civilIdCardNumber {
    return Intl.message(
      'Civil I.D. Card Number',
      name: 'civilIdCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Note : For quality controll all process is monitored By CCTV Camera.`
  String get noteForQualityControllAllProcessIsMonitoredByCctv {
    return Intl.message(
      'Note : For quality controll all process is monitored By CCTV Camera.',
      name: 'noteForQualityControllAllProcessIsMonitoredByCctv',
      desc: '',
      args: [],
    );
  }

  /// `If the below document is valide Pls.press OK :`
  String get ifTheBelowDocumentIsValidePlspressOk {
    return Intl.message(
      'If the below document is valide Pls.press OK :',
      name: 'ifTheBelowDocumentIsValidePlspressOk',
      desc: '',
      args: [],
    );
  }

  /// `1.Original Customs Decliration(Bayan)\n2.B/L Automated D/O copy\n3.Invoice Copy\n4.Certificate Of origin Copy\n5.Authorisation letter for Consignee\n6.Authorisation Of signatury\n7.Civil I.D copy`
  String get SecondScreenHintText {
    return Intl.message(
      '1.Original Customs Decliration(Bayan)\n2.B/L Automated D/O copy\n3.Invoice Copy\n4.Certificate Of origin Copy\n5.Authorisation letter for Consignee\n6.Authorisation Of signatury\n7.Civil I.D copy',
      name: 'SecondScreenHintText',
      desc: '',
      args: [],
    );
  }

  /// `Main Page`
  String get mainPageButton {
    return Intl.message(
      'Main Page',
      name: 'mainPageButton',
      desc: '',
      args: [],
    );
  }

  /// `Wel Come`
  String get welCome {
    return Intl.message(
      'Wel Come',
      name: 'welCome',
      desc: '',
      args: [],
    );
  }

  /// `Sail Shipping Logistics Services`
  String get sailShippingLogisticsServices {
    return Intl.message(
      'Sail Shipping Logistics Services',
      name: 'sailShippingLogisticsServices',
      desc: '',
      args: [],
    );
  }

  /// `شركة الشراع للملاحة والخدمات اللوجستية`
  String get AppBarTitle {
    return Intl.message(
      'شركة الشراع للملاحة والخدمات اللوجستية',
      name: 'AppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Kindly follow the below :`
  String get kindlyFollowTheBelow {
    return Intl.message(
      'Kindly follow the below :',
      name: 'kindlyFollowTheBelow',
      desc: '',
      args: [],
    );
  }

  /// `1.Scan bayan Barcode\n2.Insert all document in the post box\n3.Press OK`
  String get transactionScreenHintText {
    return Intl.message(
      '1.Scan bayan Barcode\n2.Insert all document in the post box\n3.Press OK',
      name: 'transactionScreenHintText',
      desc: '',
      args: [],
    );
  }

  /// `*You will get SMS within 3 minutes confirm receiving Doc.\n*You will get SMS message with QR Code + Serial number for daily process\n*Expected time for shipment to be ready for receicing is 4 Houres from time of starting procedure`
  String get finalScreenHintText {
    return Intl.message(
      '*You will get SMS within 3 minutes confirm receiving Doc.\n*You will get SMS message with QR Code + Serial number for daily process\n*Expected time for shipment to be ready for receicing is 4 Houres from time of starting procedure',
      name: 'finalScreenHintText',
      desc: '',
      args: [],
    );
  }

  /// `Thanks`
  String get thanks {
    return Intl.message(
      'Thanks',
      name: 'thanks',
      desc: '',
      args: [],
    );
  }

  /// `Sync`
  String get sync {
    return Intl.message(
      'Sync',
      name: 'sync',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scan {
    return Intl.message(
      'Scan',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `Recode not stored offline`
  String get recodeNotStoredOffline {
    return Intl.message(
      'Recode not stored offline',
      name: 'recodeNotStoredOffline',
      desc: '',
      args: [],
    );
  }

  /// `Please scan Barcode.`
  String get pleaseEnterScanBarcode {
    return Intl.message(
      'Please scan Barcode.',
      name: 'pleaseEnterScanBarcode',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found`
  String get noDataFound {
    return Intl.message(
      'No Data Found',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Sd> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Sd> load(Locale locale) => Sd.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
