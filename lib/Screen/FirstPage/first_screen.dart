import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:sali/CommonWidget/CommonRaisedButton.dart';
import 'package:sali/CommonWidget/CommonTextInput.dart';
import 'package:sali/CommonWidget/keyboard_key.dart';
import 'package:sali/Constants/app_constant.dart';
import 'package:sali/Screen/SecondPage/second_screen.dart';
import 'package:sali/Utils/Common_style.dart';
import 'package:sali/model/bar_code_model.dart';
import 'package:sali/model/barcode_data_model.dart';
import 'package:sali/model/user_data_model.dart';
import '../../generated/l10n.dart';
import '../../main.dart';
import '../WelcomePage/welcome_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

CivilIdDataModel _civilDataModel = CivilIdDataModel(
    data: CivilData(
        mobile: '',
        arabicName: '',
        englishName: '',
        civilId: '',
        expiryDate: '',
        nationality: '',
        sexArabic: '',
        sexEnglish: '',
        documentNumber: '',
        barcode: ''));

class _FirstScreenState extends State<FirstScreen> {
  final List<String> _language = [];
  bool noData = true;
  bool isConnected = false;
  late Timer _timer;
  FocusNode textCivilIDFocusNode = FocusNode();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController civilIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /*void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/contact.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    print(_listData);
    // setState(() {
    //   _data = _listData;
    // });
  }*/

  void buttonOnClick(String btnValue) {
    if (btnValue == "C") {
      phoneNoController.text = '';
    } else if (btnValue == 'X') {
      if ((phoneNoController.text != '') &&
          (phoneNoController.text.isNotEmpty)) {
        phoneNoController.text = phoneNoController.text
            .substring(0, phoneNoController.text.length - 1);
      }
    } else {
      phoneNoController.text = phoneNoController.text + btnValue;
    }

    textCivilIDFocusNode.requestFocus();
    setState(() {
      phoneNoController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _language.add('English');
    _language.add('Arabic');
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      hasNetwork().then((value) {
        setState(() {
          isConnected = value;
        });
      });
    });
    // _loadCSV();
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 200,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
          child: Container(
            width: 500,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Text(
                      Sd.of(context).sailShippingLogisticsServices,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontFamily: Fonts.fontSemibold,
                          color: Color(0xFF237793)),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/Sail_Shipping_Logo.png',
                  height: 200,
                  width: 200,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(Sd.of(context).AppBarTitle,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            fontFamily: Fonts.fontSemibold,
                            color: Color(0xFF237793))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height - 200,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // textDirection: TextDirection.ltr,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/images/SailERPback.jpg",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0, 0.6],
                              colors: [
                                Colors.white.withOpacity(0.85),
                                Colors.white70,
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    margin: EdgeInsets.only(top: 15),
                                    alignment: language.value == 'en'
                                        ? Alignment.centerLeft
                                        : Alignment.centerRight,
                                    child: Text(
                                      Sd.of(context).welcome,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: Fonts.fontSemibold),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 40),
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    alignment: language.value == 'en'
                                        ? Alignment.centerLeft
                                        : Alignment.centerRight,
                                    //Mobile number
                                    child: Text(
                                      Sd.of(context)
                                          .kindlyEnterYourMobileNumber,
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: Fonts.fontSemibold),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    margin: EdgeInsets.only(top: 5),
                                    //Number
                                    child: TextFormField(
                                      autofocus: false,
                                      enabled: false,
                                      controller: phoneNoController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onFieldSubmitted: (value) {
                                        print('search: $value');
                                        /*if (_formKey.currentState!.validate()) {
                                          // getExcelData(phoneNoController.text);
                                          if (phoneNoController
                                              .text.isNotEmpty) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SecondScreen(
                                                            phone:
                                                                phoneNoController
                                                                    .text,
                                                            civilDataModel: _civilDataModel,
                                                            userDataModel: _userDataModel,
                                                            noData: true)));
                                            getName(phoneNoController.text).then((value){
                                                if(value.data != null){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(phone: phoneNoController.text, name: value.data!.name1!, noData: false)));
                                                } else{
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(phone: phoneNoController.text, name: '', noData: true)));
                                                  // var snackBar = SnackBar(content: Text(Sd.of(context).thisNumberIsNotAvailable));
                                                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                              });
                                          }
                                        }*/
                                      },
                                      textDirection: language.value == 'en'
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                      style: const TextStyle(fontSize: 26),
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        border: outlineInputBorder,
                                        focusedBorder: outlineInputBorder,
                                        hintText: '',
                                        hintStyle: TextStyle(fontSize: 26),
                                        fillColor: Colors.white,
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 20),
                                        filled: true,
                                        enabledBorder: outlineInputBorder,
                                        focusedErrorBorder: outlineInputBorder,
                                        disabledBorder: outlineInputBorder,
                                      ),
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          var snackBar = SnackBar(
                                              content: Text(Sd.of(context)
                                                  .pleaseEnterAMobilePhoneNumber));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          return Sd.of(context)
                                              .pleaseEnterAMobilePhoneNumber;
                                        } else if (value
                                                .toString()
                                                .trim()
                                                .length !=
                                            8) {
                                          var snackBar = SnackBar(
                                              content: Text(Sd.of(context)
                                                  .pleaseEnterAValidMobilePhoneNumber));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          return Sd.of(context)
                                              .pleaseEnterAValidMobilePhoneNumber;
                                        } else {
                                          return null;
                                        }
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      textInputAction: TextInputAction.search,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    alignment: language.value == 'en'
                                        ? Alignment.centerLeft
                                        : Alignment.centerRight,
                                    //Mobile number
                                    child: Text(
                                      Sd.of(context).civilIdCardNumber,
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: Fonts.fontSemibold),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    margin: const EdgeInsets.only(top: 5),
                                    //Number
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: TextFormField(
                                            enabled: false,
                                            focusNode: textCivilIDFocusNode,
                                            controller: civilIdController,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            onFieldSubmitted: (value) {
                                              if (_formKey.currentState!
                                                  .validate()) {}
                                            },
                                            textDirection:
                                                language.value == 'en'
                                                    ? TextDirection.ltr
                                                    : TextDirection.rtl,
                                            style:
                                                const TextStyle(fontSize: 26),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                              border: outlineInputBorder,
                                              focusedBorder: outlineInputBorder,
                                              hintText: '',
                                              hintStyle:
                                                  TextStyle(fontSize: 26),
                                              fillColor: Colors.white,
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              filled: true,
                                              enabledBorder: outlineInputBorder,
                                              focusedErrorBorder:
                                                  outlineInputBorder,
                                              disabledBorder:
                                                  outlineInputBorder,
                                            ),
                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
                                            validator: (value) {},
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            textInputAction:
                                                TextInputAction.search,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 60,
                                            padding: language.value == 'en'
                                                ? const EdgeInsets.only(
                                                    left: 10)
                                                : const EdgeInsets.only(
                                                    right: 10),
                                            child: ElevatedButton(
                                              child: Text(
                                                Sd.of(context).scan,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 26,
                                                    fontFamily:
                                                        Fonts.fontRegular),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(const Color(
                                                            0xFF237793)),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7))),
                                                elevation: MaterialStateProperty
                                                    .all<double>(0),
                                                alignment: Alignment.center,
                                              ),
                                              onPressed: () {
                                                getScannedData().then((value) {
                                                  _civilDataModel = value;
                                                  noData = true;
                                                  if (value.isSucceed == 1 &&
                                                      value.data !=
                                                          CivilData(
                                                              mobile: '',
                                                              arabicName: '',
                                                              englishName: '',
                                                              civilId: '',
                                                              expiryDate: '',
                                                              nationality: '',
                                                              sexArabic: '',
                                                              sexEnglish: '',
                                                              documentNumber:
                                                                  '',
                                                              barcode: '')) {
                                                    noData = false;
                                                    civilIdController.text =
                                                        _civilDataModel
                                                            .data.civilId;
                                                  }
                                                  /*var snackBar = SnackBar(content: Text(value.data!.toJson().toString()));
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0, bottom: 120),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          // margin: const EdgeInsets.only(top: 50.0, bottom: 120),
                                          alignment: Alignment.center,
                                          child: CustomRaisedButton(
                                              buttonTitle: Sd.of(context).ok,
                                              width: 300,
                                              backgroundColor: const Color(0xFF237793),
                                              textColor: Colors.white,
                                              raisedButtonHandler: () {
                                                if (_formKey.currentState!.validate()) {
                                                  // getExcelData(phoneNoController.text);
                                                  if (phoneNoController
                                                      .text.isNotEmpty) {
                                                    if (_civilDataModel.data != null)
                                                      print(
                                                          'CivilDataModel: ${_civilDataModel.data.toJson().toString()}');
                                                    print(
                                                        'phone: ${phoneNoController.text}');
                                                    if (isConnected) {
                                                      getName(phoneNoController.text)
                                                          .then((value) {
                                                        if (value.data != null) {
                                                          print('if getName');
                                                          noData = false;
                                                          value.data!.civilId =
                                                              _civilDataModel
                                                                  .data.civilId;
                                                          _civilDataModel.data =
                                                              CivilData(
                                                                  mobile: '',
                                                                  arabicName: '',
                                                                  englishName: '',
                                                                  civilId: '',
                                                                  expiryDate: '',
                                                                  nationality: '',
                                                                  sexArabic: '',
                                                                  sexEnglish: '',
                                                                  documentNumber: '',
                                                                  barcode: '');
                                                          value.data!.phone =
                                                              phoneNoController.text;
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => SecondScreen(
                                                                      phone:
                                                                          phoneNoController
                                                                              .text,
                                                                      civilDataModel:
                                                                          _civilDataModel,
                                                                      userDataModel:
                                                                          value.data!,
                                                                      noData:
                                                                          noData)));
                                                        } else {
                                                          print('else getName');
                                                          value.data = DataModel();
                                                          value.data!.phone = '';
                                                          if (civilIdController
                                                              .text.isEmpty) {
                                                            _civilDataModel.data =
                                                                CivilData(
                                                                    mobile: '',
                                                                    arabicName: '',
                                                                    englishName: '',
                                                                    civilId: '',
                                                                    expiryDate: '',
                                                                    nationality: '',
                                                                    sexArabic: '',
                                                                    sexEnglish: '',
                                                                    documentNumber:
                                                                        '',
                                                                    barcode: '');
                                                          }
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => SecondScreen(
                                                                      phone:
                                                                          phoneNoController
                                                                              .text,
                                                                      civilDataModel:
                                                                          _civilDataModel,
                                                                      userDataModel:
                                                                          DataModel(),
                                                                      noData:
                                                                          noData)));
                                                          // var snackBar = SnackBar(content: Text(Sd.of(context).thisNumberIsNotAvailable));
                                                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                        }
                                                      });
                                                    } else {
                                                      print('else is Disconnected');
                                                      if (civilIdController
                                                          .text.isEmpty) {
                                                        _civilDataModel.data =
                                                            CivilData(
                                                                mobile: '',
                                                                arabicName: '',
                                                                englishName: '',
                                                                civilId: '',
                                                                expiryDate: '',
                                                                nationality: '',
                                                                sexArabic: '',
                                                                sexEnglish: '',
                                                                documentNumber: '',
                                                                barcode: '');
                                                      }
                                                      print(
                                                          '_civilDataModel.data: ${_civilDataModel.data.toJson().toString()}');
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SecondScreen(
                                                                      phone:
                                                                          phoneNoController
                                                                              .text,
                                                                      civilDataModel:
                                                                          _civilDataModel,
                                                                      userDataModel:
                                                                          DataModel(),
                                                                      noData:
                                                                          noData)));
                                                    }
                                                  }
                                                }
                                              }),
                                        ),
                                        Image.asset(
                                          'assets/images/CivilIDBack.png',
                                          height: 300,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    Welcomepage()),
                                            (Route<dynamic> route) =>
                                                route is Welcomepage);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(15),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0xFF237793),
                                        ),
                                        child: Text(
                                          Sd.of(context).mainPageButton,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontFamily: Fonts.fontMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  Sd.of(context)
                                      .noteForQualityControllAllProcessIsMonitoredByCctv,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Fonts.fontSemibold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height - 160,
                      alignment: Alignment.center,
                      color: const Color(0xFFe4e4e5),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                      title: '1',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                  CustomButton(
                                      title: '2',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                  CustomButton(
                                      title: '3',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                      title: '4',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                  CustomButton(
                                      title: '5',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                  CustomButton(
                                      title: '6',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                      title: '7',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                  CustomButton(
                                      title: '8',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                  CustomButton(
                                      title: '9',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                      title: 'X',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                  CustomButton(
                                      title: '0',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                  CustomButton(
                                      title: 'C',
                                      onTap: (value) {
                                        buttonOnClick(value);
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              /*if (_language.isNotEmpty)
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: DropdownButton(
                      value:
                          language.value == 'en' ? _language[0] : _language[1],
                      onChanged: (newValue) {
                        if (newValue == 'English') {
                          print('if');
                          setCurrentLanguage('en');
                        } else {
                          print('else');
                          setCurrentLanguage('ar');
                        }
                      },
                      items: _language
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontFamily: Fonts.fontMedium,
                            ),
                          ),
                        );
                      }).toList(),
                      underline: SizedBox(height: 0),
                    ),
                  ),
                ),*/
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

Future<UserDataModel> getName(String phone) async {
  UserDataModel model = UserDataModel();
  // print('getUserData: ${API.getContactDetails}?code=$phone');
  print(
      'getUserData: http://sailapi.exceed-erp.com:8117/api/Contact/getContactDetails?code=$phone');
  // http://sailapi.exceed-erp.com:1001/api/Contact/getContactDetails?code=99490037
  final client = http.Client();

  final response = await client.get(
    /*phone.isNotEmpty?*/
    Uri.parse(
        'http://sailapi.exceed-erp.com:8117/api/Contact/getContactDetails?code=$phone') /*:Uri.parse('http://sailapi.exceed-erp.com:1001/api/Contact/getContactDetails')*/,
    // Uri.parse('${API.getContactDetails}?code=$phone'),
    headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      // "Access-Control-Allow-Methods": "GET, HEAD",
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
    },
  );

  if (response.statusCode == 200) {
    print('getUserData response: ${response.body}');
    if (json.decode(response.body)['Data'] != null) {
      print('200 if');
      try {
        model = UserDataModel.fromJson(json.decode(response.body));
      } catch (e) {
        print('error:${e.toString()}');
      }
    } else {
      print('200 else');
      model.data = null;
      model.isSucceed = jsonDecode(response.body)['IsSucceed'];
    }
  } else {
    print('else');
    model.data = null;
    model.isSucceed = jsonDecode(response.body)['IsSucceed'];
  }
  return model;
}

Future<CivilIdDataModel> getScannedData() async {
  CivilIdDataModel barcodeDataModel = CivilIdDataModel(
      data: CivilData(
          mobile: '',
          arabicName: '',
          englishName: '',
          civilId: '',
          expiryDate: '',
          nationality: '',
          sexArabic: '',
          sexEnglish: '',
          documentNumber: '',
          barcode: ''));
  print('getScannedData URL: ${API.getReaderDetails}');
  final client = http.Client();

  final response = await client.get(
    Uri.parse(API.getReaderDetails),
    headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      // "Access-Control-Allow-Methods": "GET, HEAD",
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
    },
  );

  if (response.statusCode == 200) {
    print('getScannedData response: ${response.body}');
    if (json.decode(response.body)['Data'] != null) {
      print('200 if');
      try {
        barcodeDataModel =
            CivilIdDataModel.fromJson(json.decode(response.body));
      } catch (e) {
        print('error: ${e.toString()}');
      }
    } else {
      print('200 else');
      barcodeDataModel.data = CivilData(
          mobile: '',
          arabicName: '',
          englishName: '',
          civilId: '',
          expiryDate: '',
          nationality: '',
          sexArabic: '',
          sexEnglish: '',
          documentNumber: '',
          barcode: '');
      barcodeDataModel.isSucceed = jsonDecode(response.body)['IsSucceed'];
      barcodeDataModel.message =
          jsonDecode(response.body)['Message'] ?? 'Barcode Not Attached';
    }
  } else {
    print('else');
    barcodeDataModel.data = CivilData(
        mobile: '',
        arabicName: '',
        englishName: '',
        civilId: '',
        expiryDate: '',
        nationality: '',
        sexArabic: '',
        sexEnglish: '',
        documentNumber: '',
        barcode: '');
    barcodeDataModel.isSucceed = jsonDecode(response.body)['IsSucceed'];
    barcodeDataModel.message =
        jsonDecode(response.body)['Message'] ?? 'Barcode Not Attached';
  }
  return barcodeDataModel;
}

Future<void> getExcelData(String args) async {
  ByteData data = await rootBundle.load("assets/Contact.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  print(excel.tables.keys);

  for (var table in excel.tables.keys) {
    print(table); //sheet Name
    print(excel.tables[table]!.maxCols);
    print(excel.tables[table]!.maxRows);
    for (var row in excel.tables[table]!.rows) {
      print("${row}");
    }
  }
}
