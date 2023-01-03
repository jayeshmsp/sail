import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:sali/Constants/app_constant.dart';
import 'package:sali/Screen/Finalpage/final_screen.dart';
import 'package:sali/Screen/WelcomePage/welcome_screen.dart';
import 'package:sali/model/barcode_data_model.dart';
import 'package:sali/model/user_data_model.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:sali/CommonWidget/CommonRaisedButton.dart';
import 'package:sali/Utils/Common_style.dart';
import 'package:sali/model/bar_code_model.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../main.dart';

class Transaction extends StatefulWidget {
  final String phone;
  final CivilIdDataModel civilDataModel;
  final DataModel userDataModel;
  final bool noData;

  const Transaction({Key? key, required this.phone, required this.civilDataModel, required this.userDataModel, required this.noData})
      : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  TextEditingController barcodeController = TextEditingController();
  late bool visible;
  bool isConnected = false;
  late Timer _timer;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print('phone: ${widget.phone}');
    print('civilId: ${widget.civilDataModel.data.civilId}');
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t){
      hasNetwork().then((value){
        setState(() {
          isConnected = value;
        });
      });
    });
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
                          width: MediaQuery.of(context).size.width / 2.3,
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
                            margin: EdgeInsets.only(top: 40),
                            width: MediaQuery.of(context).size.width / 2.3,
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
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.3,
                              alignment: language.value == 'en'
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              //Kindly scan transaction barcode
                              child: Text(
                                Sd.of(context).scanTheBarcode,
                                style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: Fonts.fontSemibold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // textDirection: TextDirection.ltr,
                            children: [
                              Expanded(
                                child: Form(
                                  key: _formKey,
                                  child: Container(
                                    width: 220,
                                    child: TextFormField(
                                      autofocus: true,
                                      controller: barcodeController,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      onChanged: (value) {
                                        setState(() {});
                                        print(barcodeController.text);
                                      },
                                      onFieldSubmitted: (value) {
                                        if (_formKey.currentState!.validate()) {
                                          if(!isConnected && widget.civilDataModel.data != CivilData(mobile: '', arabicName: '', englishName: '', civilId: '', expiryDate: '', nationality: '', sexArabic: '', sexEnglish: '', documentNumber: '', barcode: '')){
                                            widget.civilDataModel.data.mobile = widget.phone;
                                          }
                                          widget.userDataModel.phone.isNotEmpty ? widget.userDataModel.barCode = barcodeController.text : widget.civilDataModel.data.barcode = barcodeController.text;
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                              FinalScreen(phone: widget.phone, civilDataModel: widget.civilDataModel, userDataModel: widget.userDataModel, noData: widget.noData)));
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return Sd.of(context).pleaseEnterScanBarcode;
                                        } else {
                                          return null;
                                        }
                                      },
                                      style: const TextStyle(fontSize: 26),
                                      textInputAction: TextInputAction.search,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        hintText: 'xXxXxXxXxXxXxX',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 26,
                                        ),
                                        isDense: true,
                                        enabledBorder: outlineInputBorder,
                                        focusedErrorBorder: outlineInputBorder,
                                        focusedBorder: outlineInputBorder,
                                        disabledBorder: outlineInputBorder,
                                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                        filled: true,
                                      ),
                                      cursorColor: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 170,
                                child: barcodeController.text.isNotEmpty?
                                SfBarcodeGenerator(
                                    value: barcodeController.text):const SizedBox(width: 0),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: VisibilityDetector(
                              onVisibilityChanged: (VisibilityInfo info) {
                                visible = info.visibleFraction > 0;
                              },
                              key: const Key('visible-detector-key'),
                              child: BarcodeKeyboardListener(
                                bufferDuration: const Duration(milliseconds: 200),
                                onBarcodeScanned: (barcode) {
                                  if (!visible) return;
                                  print(barcode);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(top: 50.0,bottom: 50),
                                      width: MediaQuery.of(context).size.width/2.3,
                                      alignment: language.value == 'en'
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: CustomRaisedButton(
                                        buttonTitle: Sd.of(context).ok,
                                        backgroundColor: const Color(0xFF237793),
                                        textColor: Colors.white,
                                        raisedButtonHandler: () {
                                          if (_formKey.currentState!.validate()) {
                                            if(!isConnected && widget.civilDataModel.data != CivilData(mobile: '', arabicName: '', englishName: '', civilId: '', expiryDate: '', nationality: '', sexArabic: '', sexEnglish: '', documentNumber: '', barcode: '')){
                                              widget.civilDataModel.data.mobile = widget.phone;
                                            }
                                            widget.userDataModel.phone.isNotEmpty ? widget.userDataModel.barCode = barcodeController.text : widget.civilDataModel.data.barcode = barcodeController.text;
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                FinalScreen(phone: widget.phone, civilDataModel: widget.civilDataModel, userDataModel: widget.userDataModel, noData: widget.noData)));
                                          }
                                        },
                                        width:300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                          margin: EdgeInsets.only(top: 170),
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
                            Sd.of(context).transactionScreenHintText,
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
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Container(
                  child: Center(
                      //Hello / Mahmoud Ahmed - Hello
                      child: Text(
                        widget.noData ? Sd.of(context).helloSir : Sd.of(context).hello(widget.name), style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Container(
                    //Kindly scan transaction barcode
                    child: Text(
                      Sd.of(context).scanTheBarcode,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                padding: EdgeInsets.only(top: 20, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (barcodeController.text.isNotEmpty)
                      Container(
                        height: 30,
                        width: 115,
                        child:
                            SfBarcodeGenerator(value: barcodeController.text),
                      ),
                    Expanded(
                      child: Container(
                        width: 250,
                        child: TextFormField(
                          autofocus: true,
                          controller: barcodeController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {
                            setState(() {});
                            print(barcodeController.text);
                          },
                          onFieldSubmitted: (value) {
                            if (barcodeController.text.isNotEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Final(
                                          barcodeData: barcodeController.text,
                                          phone: widget.phone)));
                              //   Navigator.pushNamed(context, '/OrderList');
                            }
                          },
                          textInputAction: TextInputAction.search,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'xXxXxXxXxXxXxX',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            isDense: true,
                            enabledBorder: outlineInputBorder,
                            focusedErrorBorder: outlineInputBorder,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            filled: true,
                          ),
                          cursorColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: VisibilityDetector(
                    onVisibilityChanged: (VisibilityInfo info) {
                      visible = info.visibleFraction > 0;
                    },
                    key: const Key('visible-detector-key'),
                    child: BarcodeKeyboardListener(
                      bufferDuration: Duration(milliseconds: 200),
                      onBarcodeScanned: (barcode) {
                        if (!visible) return;
                        print(barcode);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, right: 70.0),
                            child: CustomRaisedButton(
                                //Next
                                buttonTitle: Sd.of(context).next,
                                width: 150,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                raisedButtonHandler: () {
                                  if (barcodeController.text.isNotEmpty) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Final(
                                                barcodeData: barcodeController.text,
                                                phone: widget.phone)));
                                    //   Navigator.pushNamed(context, '/OrderList');
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),*/
    );
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
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
