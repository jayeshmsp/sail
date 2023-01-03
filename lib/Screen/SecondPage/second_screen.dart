import 'package:flutter/material.dart';
import 'package:sali/CommonWidget/CommonRaisedButton.dart';
import 'package:sali/Constants/app_constant.dart';
import 'package:sali/Screen/Transaction/transaction.dart';
import 'package:sali/Screen/WelcomePage/welcome_screen.dart';
import 'package:sali/generated/l10n.dart';
import 'package:sali/model/barcode_data_model.dart';
import 'package:sali/model/user_data_model.dart';
import '../../main.dart';

class SecondScreen extends StatefulWidget {
  final String phone;
  final CivilIdDataModel civilDataModel;
  final DataModel userDataModel;
  final bool noData;

  const SecondScreen({Key? key, required this.phone, required this.civilDataModel, required this.userDataModel, required this.noData})
      : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('phone: ${widget.phone}');
    print('civilId: ${widget.civilDataModel.data.civilId}');
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width / 1.05,
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
                          width: MediaQuery.of(context).size.width / 1.05,
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
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width / 1.05,
                          alignment: language.value == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Text(
                            Sd.of(context).ifTheBelowDocumentIsValidePlspressOk,
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
                          width: MediaQuery.of(context).size.width / 1.05,
                          alignment: language.value == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Text(
                            Sd.of(context).SecondScreenHintText,
                            textAlign: language.value == 'en'
                                ? TextAlign.left
                                : TextAlign.right,
                            style: TextStyle(
                                fontFamily: Fonts.fontSemibold,
                                fontWeight: FontWeight.w700,
                                fontSize: 26),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30,bottom: 30),
                          width: MediaQuery.of(context).size.width / 1.05,
                          alignment: language.value == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: CustomRaisedButton(
                            buttonTitle: Sd.of(context).ok,
                            width: 300,
                            backgroundColor: const Color(0xFF237793),
                            textColor: Colors.white,
                            raisedButtonHandler: () {
                              print(widget.phone);
                              Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Transaction(phone: widget.phone, civilDataModel: widget.civilDataModel, userDataModel: widget.userDataModel, noData: widget.noData)));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ),
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
    );
  }
}
