import 'package:flutter/material.dart';
import 'package:sali/Constants/app_constant.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const CustomButton({required this.title, required this.onTap}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onTap(title);
        },
        child: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.2],
                colors: [
                  Colors.black45,
                  Colors.black87,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 7),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black
              ),
              child: Container(
                margin: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  /*gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0, 0.9],
                    colors: [
                      Colors.black87,
                      Colors.black38,
                    ],
                  ),*/
                  color: Colors.black.withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 1,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 26, color: Colors.white, fontFamily: Fonts.fontBold, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
