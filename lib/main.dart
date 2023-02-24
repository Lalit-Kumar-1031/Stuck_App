import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuck/providers/search_provider.dart';
import 'package:stuck/screens/bottom_tab_screen.dart';
import 'package:stuck/screens/SplashScreen.dart';
import 'package:stuck/screens/UserDetailScreen.dart';
import 'package:stuck/screens/signup_screen.dart';
late double height;
late double width;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
  ChangeNotifierProvider(create: (_) =>SearchProvider(),
  child:MaterialApp(
    debugShowCheckedModeBanner: false,
    home:SplashScreen(),
  )));
}

