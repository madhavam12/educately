import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:liquid_ui/liquid_ui.dart';

import 'package:flutter/services.dart';

import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screens/home/homeScreen.dart';

import 'screens/login/loginScreen.dart';

void main() async {
  SimpleConnectionChecker _simpleConnectionChecker = SimpleConnectionChecker()
    ..setLookUpAddress('google.com');

  _simpleConnectionChecker.onConnectionChange.listen((connected) {
    if (!connected) {
      Fluttertoast.showToast(
          msg: "No internet connection, please connect to the internet",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ProviderScope(
    child: LiquidApp(
        materialApp: FirebaseAuth.instance.currentUser == null
            ? MaterialApp(home: LoginScreen())
            : MaterialApp(home: HomeScreen())),
  ));
}
