
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//class RouterGenerator{
//  static Route<dynamic> generateRoute(RouteSettings settings) {
//    final args = settings.arguments;
//
//
//    switch(settings.name){
//      case '/LoginScreen':
//        return MaterialPageRoute(builder: (_)=>LoginScreen());
//    }
//    return _errorRoute();
//  }
//
//  static Route<dynamic> _errorRoute(){
//    return MaterialPageRoute(builder: (_){
//      return Scaffold(
//        appBar: AppBar(
//          title: Text('Error'),
//        ),
//        body: Center(
//          child: Text('Something went Wrong'),
//        ),
//      );
//    });
//  }
//}
class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => Welcome());

      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Somethings went Wrong'),
        ),
      );
    });
  }
}


