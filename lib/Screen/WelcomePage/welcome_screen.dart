import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as dateFormatter;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sali/Constants/app_constant.dart';
import 'package:sali/Screen/Finalpage/final_screen.dart';
import 'package:sali/Screen/FirstPage/first_screen.dart';
import 'package:sali/generated/l10n.dart';
import 'package:sali/model/bar_code_model.dart';
import 'package:sali/model/get_sync_data_model.dart';
import 'package:uuid/uuid.dart';
import '../../main.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({Key? key}) : super(key: key);

  @override
  _WelcomepageState createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  List<String> _language = [];
  bool isConnected = false;
  late Timer _timer;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _language.add('English');
    _language.add('Arabic');
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t){
      hasNetwork().then((value){
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
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
            SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                          child: Center(
                              child: Image.asset(
                        'assets/images/Sail_Shipping_Logo.png',
                        height: 300,
                        width: 300,
                      ))),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 80),
                      child: Text(
                        'مرحبا بكم في شركة الشراع للملاحة والخدمات اللوجستية',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold, fontFamily: Fonts.fontSemibold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Welcome in Sail Shipping  Logistics Services',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold, fontFamily: Fonts.fontSemibold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100, bottom: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: [
                                  Text(
                                    "للغه العربي أضغط ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.fontSemibold,
                                        fontSize: 28),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 90,
                                    margin: EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setCurrentLanguage('ar');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FirstScreen()));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF237793)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(7)),
                                        ),
                                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(bottom: 15)),
                                        alignment: Alignment.center
                                      ),
                                      child: Text(
                                        'عربي',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:28,
                                            fontFamily: Fonts.fontSemibold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "For English Press",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.fontSemibold,
                                        fontSize: 28),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 90,
                                    margin: EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setCurrentLanguage('en');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FirstScreen()));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF237793)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(7)),
                                        ),
                                        alignment: Alignment.center
                                      ),
                                      child: Text(
                                        'English',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontFamily: Fonts.fontSemibold),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ])),
                  ])),
            ),
            Align(
              alignment: language.value == 'en' ? Alignment.topLeft: Alignment.topRight,
              child: Container(
                width: 150,
                height: 70,
                margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if(isConnected){
                      getScannedData().then((value){
                        print('data: ${value.toJson().toString()}');
                        if(value.data != null){
                          BarCodeModel barCodeModel = BarCodeModel();
                          for(int i=0;i<value.data!.length;i++){
                            final CustomerClass5 _class5 = CustomerClass5();
                            var uuid = Uuid();
                            _class5.code = uuid.v1();
                            // _class5.code = 'AUTO000000001@draft';
                            _class5.draftCreated = 0;
                            _class5.group = 'CustomerClass5\$#Auto';
                            _class5.description1 = value.data![i].mobile!;
                            _class5.description2 = value.data![i].createdDateTime!;;
                            _class5.description3 = value.data![i].barcode!;
                            _class5.description4 = value.data![i].civilId!;
                            _class5.name2 = value.data![i].englishName!;
                            _class5.name1 = value.data![i].arabicName!;
                            _class5.date3 = value.data![i].expiryDate!;
                            _class5.legalEntity = '001';
                            _class5.customViewName = ';';
                            barCodeModel.customerClass5.add(_class5);
                          }

                          setFinalData(barCodeModel).then((finalData){
                            if(finalData == 'Success'){
                              print('if setFinal');
                              for(int i=0;i<value.data!.length;i++) {
                                updateSyncData(int.parse(value.data![i].id!))
                                    .then((value) {
                                  if (value == 'Success') {
                                    print('if updateSyncData');
                                  } else {
                                    print('else updateSyncData');
                                  }
                                });
                              }
                            } else {
                              print('else setFinal');
                            }
                          });
                          print('for loop over');
                        } 
                        if(value.data!.isEmpty){
                          var snackBar = SnackBar(content: Text(Sd.of(context).noDataFound));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          isConnected ? const Color(0xFF237793) : Colors.grey),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(7)),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(bottom: 15)),
                      alignment: Alignment.center
                  ),
                  child: Text(
                    Sd.of(context).sync,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:28,
                        fontFamily: Fonts.fontSemibold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

Future<GetSyncDataModel> getScannedData() async {
  GetSyncDataModel getSyncDataModel = GetSyncDataModel();
  print('getScannedData URL: ${API.getOfflineContacts}');
  final client = http.Client();

  final response = await client.get(
    Uri.parse(API.getOfflineContacts),
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
        getSyncDataModel = GetSyncDataModel.fromJson(json.decode(response.body));
      } catch (e) {
        print('error1: ${e.toString()}');
      }
    } else {
      print('200 else');
      getSyncDataModel.data = null;
      getSyncDataModel.isSucceed = jsonDecode(response.body)['IsSucceed'];
      getSyncDataModel.message = jsonDecode(response.body)['Message'] ?? 'Data Not Found';
    }
  } else {
    print('else');
    getSyncDataModel.data = null;
    getSyncDataModel.isSucceed = jsonDecode(response.body)['IsSucceed'];
    getSyncDataModel.message = jsonDecode(response.body)['Message'] ?? 'Data not Found';
  }
  return getSyncDataModel;
}