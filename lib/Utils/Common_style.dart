import 'package:flutter/material.dart';

var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.white)
);

var containerBoxShadowDesign = BoxDecoration(
  boxShadow: [
    BoxShadow(
        color: Colors.white,
        spreadRadius: 0.5,
        blurRadius: 5.0,
        offset: Offset(2.0,5.0)
    ),
  ],
  // borderRadius: BorderRadius.circular(10.0),
  color: Colors.white,
);

var expansionBoxBorder = BoxDecoration(
    border: Border.all(
        color: Colors.white
    )
);