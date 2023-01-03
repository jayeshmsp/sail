class UserDataModel {
  int? isSucceed;
  DataModel? data = DataModel();

  UserDataModel({this.isSucceed, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    isSucceed = json['IsSucceed'] ?? 0;
    data =
    json['Data'] != null ? DataModel.fromJson(json['Data']) : DataModel();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IsSucceed'] = isSucceed;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataModel {
  String? id;
  String? code;
  bool? commitedBefore;
  String? creationDate;
  String? description1;
  String? name1;
  String phone = '';
  String barCode = '';
  String? name2;
  String? civilId;
  String? expiryDate;
  String? nationality;
  String? sexEnglish;
  String? sexArabic;
  String? documentnumber;

  DataModel({this.id,
    this.code,
    this.commitedBefore,
    this.creationDate,
    this.description1,
    this.name1,
    this.name2,
    this.civilId,
    this.expiryDate,
    this.nationality,
    this.sexEnglish,
    this.sexArabic,
    this.documentnumber});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    code = json['code'] ?? '';
    commitedBefore = json['commitedBefore'] ?? false;
    creationDate = json['creationDate'] ?? '';
    description1 = json['description1'] ?? '';
    name1 = json['name1'] ?? '';
    name2 = json['name2'] ?? '';
    civilId = json['civilid'] ?? '';
    expiryDate = json['expirydate'] ?? '';
    nationality = json['nationality'] ?? '';
    sexEnglish = json['sexenglish'] ?? '';
    sexArabic = json['sexarabic'] ?? '';
    documentnumber = json['documentnumber'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['commitedBefore'] = commitedBefore;
    data['creationDate'] = creationDate;
    data['description1'] = description1;
    data['name1'] = name1;
    data['name2'] = name2;
    data['phone'] = phone;
    data['civilid'] = civilId;
    data['expirydate'] = expiryDate;
    data['nationality'] = nationality;
    data['sexenglish'] = sexEnglish;
    data['sexarabic'] = sexArabic;
    data['documentnumber'] = documentnumber;
    return data;
  }
}
