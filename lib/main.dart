import 'dart:ui';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:sali/Routes/RoutesGenerator.dart';
import 'package:sali/Screen/FirstPage/first_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import 'Screen/WelcomePage/welcome_screen.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  if(Platform.isWindows)
  {
    await windowManager.ensureInitialized();

    // Use it only after calling `hiddenWindowAtLaunch`
    windowManager.waitUntilReadyToShow().then((_) async {
      // Set to frameless window
      // await windowManager.setAsFrameless();
      // var pixelRatio = window.devicePixelRatio;
      // var logicalScreenSize = window.physicalSize / pixelRatio;
      // await windowManager.setSize(Size(WidgetsBinding.instance!.window.physicalSize.width,WidgetsBinding.instance!.window.physicalSize.height));
      // await windowManager.setPosition(Offset.zero);
      await windowManager.setFullScreen(true);
      windowManager.show();
    });
  }
  runApp(const MyApp());
}

ValueNotifier<Locale> defaultLanguage = ValueNotifier(Locale('ar', ''));
ValueNotifier<String> language = ValueNotifier('ar');

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCurrentLanguage('ar');
    var now = new DateTime.now();
    // var formatter = DateFormat.yMMMd("en_US");
    // String formatted = formatter.format(now);
    var formattedDate = DateFormat('yyyy-MM-dd HH:mm', 'en_US').format(now);
    print(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              unselectedWidgetColor: Colors.transparent,
            ),
            title: 'Sail',
            supportedLocales:[
              Locale('en', ''),
              Locale('ar', ''),
            ],
            scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            localizationsDelegates: [Sd.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate],
            initialRoute: '/',
            locale: defaultLanguage.value,
            onGenerateRoute:RouterGenerator.generateRoute,
            home:Welcomepage()
        );
      }, valueListenable: defaultLanguage,
    );
  }
}

void setCurrentLanguage(String data) async {
  if (data != null) {
    print('setCurrentUser: $data');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('default_language', data);

    if (prefs.containsKey('default_language')) {
      print('user data: ${prefs.getString('default_language') ?? ''}');
      defaultLanguage.value = Locale('${prefs.get('default_language')}', '');
      language.value = '${prefs.get('default_language')}';
    } else {
      print('else');
    }
    defaultLanguage.notifyListeners();
  }
}

Future<Locale> getCurrentLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  if (prefs.containsKey('default_language')) {
    print('user data: ${prefs.getString('default_language') ?? ''}');
    defaultLanguage.value = Locale('${prefs.get('default_language')}', '');
    language.value = '${prefs.get('default_language')}';
  } else {
    print('else');
  }
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  defaultLanguage.notifyListeners();
  return defaultLanguage.value;
}