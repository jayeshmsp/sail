import 'package:intl/intl.dart';

/// IsSucceed : 1
/// Data : [{"Id":3,"Mobile":"99490037","ArabicName":"ابراهيم محمود حسن علي","EnglishName":"IBRAHIM MAHMOUD HASSAN ALI","CivilId":"290062605601","ExpiryDate":"20220316","Nationality":"EGY","SexArabic":"ذكر","SexEnglish":"M","DocumentNumber":"K71650232","Barcode":null,"IsSynced":false}]

class GetSyncDataModel {
  int? isSucceed;
  List<Data>? data;
  String? message;

  GetSyncDataModel({this.isSucceed, this.data,});

  GetSyncDataModel.fromJson(dynamic json) {
    isSucceed = json['IsSucceed'] ?? 0;
    if (json['Data'] != null) {
      data = [];
      json['Data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsSucceed'] = isSucceed;
    if (data != null) {
      map['Data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Id : 3
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

class Data {
  String? id;
  String? mobile;
  String? arabicName;
  String? englishName;
  String? civilId;
  String? expiryDate;
  String? nationality;
  String? sexArabic;
  String? sexEnglish;
  String? documentNumber;
  String? barcode;
  String? createdDateTime;
  bool? isSynced;

  Data({
      this.id, 
      this.mobile, 
      this.arabicName, 
      this.englishName, 
      this.civilId, 
      this.expiryDate, 
      this.nationality, 
      this.sexArabic, 
      this.sexEnglish, 
      this.documentNumber, 
      this.createdDateTime,
      this.barcode,
      this.isSynced,});

  Data.fromJson(dynamic json) {
    id = json['Id']!=null ? json['Id'].toString() : '';
    mobile = json['Mobile'] ?? '';
    arabicName = json['ArabicName'] ?? '';
    englishName = json['EnglishName'] ?? '';
    civilId = json['CivilId'] ?? '';
    expiryDate = json['ExpiryDate']/* != null && json['ExpiryDate'] != '' ? DateFormat("dd/MM/yyyy").format(DateTime.parse(json['ExpiryDate'])) : ''*/;
    nationality = json['Nationality'] ?? '';
    sexArabic = json['SexArabic'] ?? '';
    sexEnglish = json['SexEnglish'] ?? '';
    documentNumber = json['DocumentNumber'] ?? '';
    createdDateTime = json['CreatedDateTime'] ?? '';
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
    map['CreatedDateTime'] = createdDateTime;
    map['SexArabic'] = sexArabic;
    map['SexEnglish'] = sexEnglish;
    map['DocumentNumber'] = documentNumber;
    map['Barcode'] = barcode;
    map['IsSynced'] = isSynced;
    return map;
  }

}