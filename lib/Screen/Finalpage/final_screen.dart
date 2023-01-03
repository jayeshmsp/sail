import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as dateFormatter;
import 'package:http/http.dart' as http;
import 'package:sali/Constants/app_constant.dart';
import 'package:sali/Screen/WelcomePage/welcome_screen.dart';
import 'package:sali/main.dart';
import 'package:sali/model/barcode_data_model.dart';
import 'package:sali/model/user_data_model.dart';
import 'package:uuid/uuid.dart';
import '../../generated/l10n.dart';
import 'package:sali/model/bar_code_model.dart';

class FinalScreen extends StatefulWidget {
  final String phone;
  final CivilIdDataModel civilDataModel;
  final DataModel userDataModel;
  final bool noData;

  const FinalScreen({Key? key, required this.phone, required this.civilDataModel, required this.userDataModel, required this.noData})
      : super(key: key);

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  BarCodeModel barCodeModel = BarCodeModel();
  final CustomerClass5 _class5 = CustomerClass5();
  late String formattedDate;
  late String barcodeData, phone;

  @override
  void initState() {
    super.initState();
    print('phone: ${widget.phone}');
    print('civilId: ${widget.civilDataModel.data.civilId}');
    barcodeData = (widget.userDataModel.phone.isNotEmpty ? widget.userDataModel.barCode : widget.civilDataModel.data.barcode);
    phone = /*!widget.noData ? (widget.userDataModel.phone.isNotEmpty ? widget.userDataModel.phone : widget.civilDataModel.data.mobile) : */widget.phone;
    print('$phone : $barcodeData');

    var now = DateTime.now();
    formattedDate = dateFormatter.DateFormat('yyyy-MM-dd HH:mm', 'en_US').format(now);
    var uuid = Uuid();
    // _class5.code = 'AUTO000000001@draft';
    _class5.code = uuid.v1();
    _class5.draftCreated = 0;
    _class5.group = 'CustomerClass5\$#Auto';
    _class5.description1 = phone;
    _class5.description2 = formattedDate;
    _class5.description3 = barcodeData;
    _class5.description4 =!widget.noData ? (widget.userDataModel.phone.isNotEmpty ? widget.userDataModel.civilId : widget.civilDataModel.data.civilId)! : '';
    _class5.name2 = !widget.noData ? (widget.userDataModel.phone.isNotEmpty ? widget.userDataModel.name2 : widget.civilDataModel.data.englishName)! : '';
    _class5.name1 = !widget.noData ? (widget.userDataModel.phone.isNotEmpty ? widget.userDataModel.name1 : widget.civilDataModel.data.arabicName)! : '';
    _class5.date3 = !widget.noData ? (widget.userDataModel.phone.isNotEmpty ? '' : widget.civilDataModel.data.expiryDate) : '';
    _class5.legalEntity = '001';
    _class5.customViewName = ';';
    barCodeModel.customerClass5.add(_class5);

    hasNetwork().then((value){
      if(value){
        setFinalData(barCodeModel).then((finalData){
          if(finalData == 'Success'){
            var snackBar = SnackBar(content: Text(Sd.of(context).recordCreated));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Timer(const Duration(seconds: 6), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcomepage()));
            });
          } else {
            var snackBar = const SnackBar(content: Text('Recode not stored online'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        });
      } else {
        widget.civilDataModel.data.mobile = phone;
        setFinalOfflineData(widget.civilDataModel, context).then((offlineData){
          if(offlineData['IsSucceed'] == 1){
            var snackBar = SnackBar(content: Text(offlineData['DBMessage']));
            // var snackBar = SnackBar(content: Text(Sd.of(context).recordCreated));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Timer(const Duration(seconds: 6), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcomepage()));
            });
          } else {
            // var snackBar = SnackBar(content: Text(Sd.of(context).recodeNotStoredOffline));
            var snackBar = SnackBar(content: Text(offlineData['DBMessage']));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        });
      }
    });
    /*Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Welcomepage()));
    });*/
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
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height - 200,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              // textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 100),
                          width: MediaQuery.of(context).size.width / 3,
                          alignment: language.value == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Text(
                            Sd.of(context).welcome,
                            style: TextStyle(
                                fontSize: 24, fontFamily: Fonts.fontSemibold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: MediaQuery.of(context).size.width / 3,
                          alignment: language.value == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                if(!widget.noData)TextSpan(
                                    text: '${Sd.of(context).welCome}, ',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontFamily: 'Semibold',
                                    )),
                                if(!widget.noData)TextSpan(
                                  text: widget.userDataModel.phone.isNotEmpty ? widget.userDataModel.name1: language.value == 'en' ? widget.civilDataModel.data.englishName : widget.civilDataModel.data.arabicName,
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Bold'),
                                ),
                                if(widget.noData)TextSpan(
                                  text: Sd.of(context).helloSir,
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Bold'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 150),
                          width: MediaQuery.of(context).size.width / 2.2,
                          alignment: language.value == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Text(
                            Sd.of(context).kindlyFollowTheBelow,
                            textAlign: language.value == 'en'
                                ? TextAlign.left
                                : TextAlign.right,
                            style: TextStyle(
                              fontFamily: Fonts.fontBold,
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          alignment: language.value == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Text(
                            Sd.of(context).finalScreenHintText,
                            textAlign: language.value == 'en'
                                ? TextAlign.left
                                : TextAlign.right,
                            style: TextStyle(
                                fontFamily: Fonts.fontSemibold,
                                fontWeight: FontWeight.w700,
                                fontSize: 26),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  Sd.of(context).noteForQualityControllAllProcessIsMonitoredByCctv,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: Fonts.fontSemibold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child:
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) => Welcomepage()),
                          (Route<dynamic> route) => route is Welcomepage
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF237793),
                  ),
                  child: Text(
                    Sd.of(context).mainPageButton,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: Fonts.fontMedium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      /*SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height - 80,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
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
                            stops: [0, 0.5],
                            colors: [
                              Colors.white,
                              Colors.white70,
                            ],
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: Alignment(-0.7, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 150.0),
                                //Thank you
                                child: Container(
                                  // margin: EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width / 3,
                                  alignment: language.value == 'en'
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Text(
                                    Sd.of(context).welcome,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Medium',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.73, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, right: 50.0),
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Thanks, ',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'Semibold',
                                          )),
                                      TextSpan(
                                        text: 'Mr.Ibrahim Khalaf',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Bold'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 100.0),
                            //   child: Center(
                            //     child: Container(
                            //       //Transaction time captured
                            //       child: Text(formattedDate,
                            //         style: TextStyle(
                            //           fontSize: 17.0,
                            //           fontWeight: FontWeight.w700
                            //       ),),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left:50.0,right:40.0,top:10.0),
                            //   child:Text(Sd.of(context).barcodeNumber(widget.barcodeData),
                            //       style: TextStyle(
                            //       fontSize: 17.0,
                            //       fontWeight: FontWeight.w700))),
                            // Padding(
                            //     padding: const EdgeInsets.only(left:26.0,right:40.0,top:10.0),
                            //     //Kindly put the transaction's paper in the box
                            //     child:Text(Sd.of(context).transactionPaperInTheBox,
                            //         style: TextStyle(
                            //             fontSize: 15.0,
                            //             fontWeight: FontWeight.w700
                            //         ))
                            // ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        //  mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, bottom: 10),
                            child: Container(
                              // margin:const EdgeInsets.only(top:5.0, right:10.0,bottom: 15),
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: language.value == 'en'
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Text(
                                "Kindly follow the below :",
                                style: TextStyle(
                                    fontFamily: 'Bold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: language.value == 'en'
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Text(
                                "*You will get SMS within 3 minutes confirm receiving Doc.\n"
                                "*You will get SMS message with QR Code + Serial number for daily process\n"
                                "*Expected time for shipment to be ready for receicing is 4 Houres from time of starting procedure\n",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Semibold',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    //Kindly notice that this is not consider delivery untill you receive SMS from our side.
                    child: Text(Sd.of(context).lastScreenBottomData,
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w600))),
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}

Future setFinalData(BarCodeModel barCodeModel) async {
  print('sendDataToServer: http://sail.exceed-erp.com:8116/erp/integrator?integrator=docRec&mode=write&user=import&pass=1005010050');
  final client = http.Client();

  print('BusinessListing Params: ${barCodeModel.toJson()}');

  final response = await client.post(
    Uri.parse('http://sail.exceed-erp.com:8116/erp/integrator?integrator=docRec&mode=write&user=import&pass=1005010050'),
    body: json.encode(barCodeModel.toJson()),
  );
  print('BusinessListing response 1:${response.body}}');
  if (response.statusCode == 200) {
    if (json.decode(response.body) != null) {
      try {
        return "Success";
      } catch (e) {
        print('error2:${e.toString()}');
      }
    }
  } else {
    return "Dead";
  }
}

Future updateSyncData(int id) async {
  print('UpdateSyncData: ${API.updateContact}');
  final client = http.Client();

  print('UpdateSyncData Params: {"Id":$id}');
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Id'] = id;

  final response = await client.post(
      Uri.parse(API.updateContact),
      body: json.encode(data),
      headers: {
        "content-type":"application/json"
      }
  );

  print('UpdateSyncData response 1:${response.body}}');
  if (response.statusCode == 200) {
    if (json.decode(response.body) != null) {
      try {
        return "Success";
      } catch (e) {
        print('error3:${e.toString()}');
      }
    }
  } else {
    return "Dead";
  }
}

Future setFinalOfflineData(CivilIdDataModel civilDataModel, BuildContext context) async {
  print('sendDataToServer: ${API.saveContact}');
  final client = http.Client();

  print('BusinessListing Params: ${json.encode(civilDataModel.data.toOfflineJson())}');
  /*var snackBar = SnackBar(content: Text((civilDataModel.data.toOfflineJson().toString())));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);*/

  final response = await client.post(
      Uri.parse(API.saveContact),
      body: json.encode(civilDataModel.data.toOfflineJson()),
      headers: {
        "content-type":"application/json"
      }
  );
  print('BusinessListing response 1:${response.body}}');
  if (response.statusCode == 200) {
    if (json.decode(response.body) != null) {
      try {
        return json.decode(response.body);
      } catch (e) {
        // print('error:${e.toString()}');
      }
    }
  } else {
    return json.decode(response.body);
  }
}