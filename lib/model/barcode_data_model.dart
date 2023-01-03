import 'package:intl/intl.dart';

/// IsSucceed : 1
/// Data : {"Id":null,"Mobile":"99490037","ArabicName":"ابراهيم محمود حسن علي","EnglishName":"IBRAHIM MAHMOUD HASSAN ALI","CivilId":"290062605601","ExpiryDate":"20220316","Nationality":"EGY","SexArabic":"ذكر","SexEnglish":"M","DocumentNumber":"K71650232","Barcode":null,"IsSynced":false}

class CivilIdDataModel {
  int? isSucceed;
  String? message;
  CivilData data = CivilData(mobile: '', arabicName: '', englishName: '', civilId: '', expiryDate: '', nationality: '', sexArabic: '', sexEnglish: '', documentNumber: '', barcode: '');

  CivilIdDataModel({this.isSucceed, required this.data,});

  CivilIdDataModel.fromJson(dynamic json) {
    isSucceed = json['IsSucceed'] ?? 0;
    data = json['Data'] != null ? CivilData.fromJson(json['Data']) : CivilData(mobile: '', arabicName: '', englishName: '', civilId: '', expiryDate: '', nationality: '', sexArabic: '', sexEnglish: '', documentNumber: '', barcode: '');
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsSucceed'] = isSucceed;
    if (data != CivilData(mobile: '', arabicName: '', englishName: '', civilId: '', expiryDate: '', nationality: '', sexArabic: '', sexEnglish: '', documentNumber: '', barcode: '')) {
      map['Data'] = data.toOfflineJson();
    } else {
      map['Data'] = CivilData(mobile: '', arabicName: '', englishName: '', civilId: '', expiryDate: '', nationality: '', sexArabic: '', sexEnglish: '', documentNumber: '', barcode: '').toJson();
    }
    return map;
  }

}

/// Id : null
/// Mobile : "99490037"
/// ArabicName : "ابراهيم محمود حسن علي"
/// EnglishName : "IBRAHIM MAHMOUD HASSAN ALI"
/// CivilId : "290062605601"
/// ExpiryDate : "20220316"
/// Nationality : "EGY"
/// SexArabic : "ذكر"
/// SexEnglish : "M"
/// DocumentNumber : "K71650232"
/// Barcode : null
/// IsSynced : false

class CivilData {
  String? id = '';
  String mobile = '';
  String arabicName = '';
  String englishName = '';
  String civilId = '';
  String expiryDate = '';
  String nationality = '';
  String sexArabic = '';
  String sexEnglish = '';
  String documentNumber = '';
  String barcode = '';
  bool? isSynced;

  CivilData({
      this.id, 
      required this.mobile,
      required this.arabicName,
    required this.englishName,
    required this.civilId,
    required this.expiryDate,
    required this.nationality,
    required this.sexArabic,
    required this.sexEnglish,
    required this.documentNumber,
    required this.barcode,
      this.isSynced,});

  CivilData.fromJson(dynamic json) {
    id = json['Id'] ?? '';
    mobile = json['Mobile'] ?? '';
    arabicName = json['ArabicName'] ?? '';
    englishName = json['EnglishName'] ?? '';
    civilId = json['CivilId'] ?? '';
    expiryDate = json['ExpiryDate']!=null && json['ExpiryDate']!='' ? DateFormat("dd/MM/yyyy").format(DateTime.parse(json['ExpiryDate'])) : '';
    nationality = json['Nationality'] ?? '';
    sexArabic = json['SexArabic'] ?? '';
    sexEnglish = json['SexEnglish'] ?? '';
    documentNumber = json['DocumentNumber'] ?? '';
    barcode = json['Barcode'] ?? '';
    isSynced = json['IsSynced'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Mobile'] = mobile;
    map['ArabicName'] = arabicName;
    map['EnglishName'] = englishName;
    map['CivilId'] = civilId;
    map['ExpiryDate'] = expiryDate;
    map['Nationality'] = nationality;
    map['SexArabic'] = sexArabic;
    map['SexEnglish'] = sexEnglish;
    map['DocumentNumber'] = documentNumber;
    map['Barcode'] = barcode;
    map['IsSynced'] = isSynced;
    return map;
  }

  Map<String, dynamic> toOfflineJson() {
    final map = <String, dynamic>{};
    map['Mobile'] = mobile;
    map['ArabicName'] = arabicName;
    map['EnglishName'] = englishName;
    map['CivilId'] = civilId;
    map['ExpiryDate'] = expiryDate;
    map['Nationality'] = nationality;
    map['SexArabic'] = sexArabic;
    map['SexEnglish'] = sexEnglish;
    map['DocumentNumber'] = documentNumber;
    map['Barcode'] = barcode;
    return map;
  }

}