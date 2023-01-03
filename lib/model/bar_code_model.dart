class BarCodeModel {
  List<CustomerClass5> customerClass5 = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CustomerClass5'] = customerClass5.map((v) => v.toJson()).toList();
    return data;
  }
}

class CustomerClass5 {
  late String code;
  late int draftCreated;
  late String group;
  late String description1;
  late String description2;
  late String description3;
  late String description4;
  late String name2;
  late String name1;
  late String date3;
  late String legalEntity;
  late String customViewName;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['draftCreated'] = draftCreated;
    data['group'] = group;
    data['description1'] = description1;
    data['description2'] = description2;
    data['description3'] = description3;
    data['description4'] = description4;
    data['name2'] = name2;
    data['name1'] = name1;
    data['date3'] = date3;
    data['legalEntity'] = legalEntity;
    data['customViewName'] = customViewName;
    return data;
  }
}